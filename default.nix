let
 pkgs = import ./nixpkgs;
 node = pkgs.callPackage ./node { };
 git = pkgs.callPackage ./git { };

 philt3r-shell = pkgs.callPackage ./nix-shell {
  pkgs = pkgs;
  git = git;
  node = node;
 };

 # override and overrideDerivation cannot be handled by mkDerivation
 derivation-safe-philt3r-shell = (removeAttrs philt3r-shell ["override" "overrideDerivation"]);
in
{
 pkgs = pkgs;
 # export the set used to build shell alongside the main derivation
 # downstream devs can extend/override the shell as needed
 # philt3r-shell provides canonical dev shell for generic work
 shell = derivation-safe-philt3r-shell;
 main = pkgs.stdenv.mkDerivation derivation-safe-philt3r-shell;
}
