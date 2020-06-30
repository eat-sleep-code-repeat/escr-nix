let
 pkgs = import ./nixpkgs;
 node = pkgs.callPackage ./node { };
 git = pkgs.callPackage ./git { };
#  drone = pkgs.callPackage ./drone { };

 escr-shell = pkgs.callPackage ./nix-shell {
  pkgs = pkgs;
  git = git;
  node = node;
#   drone = drone;
 };

 # override and overrideDerivation cannot be handled by mkDerivation
 derivation-safe-escr-shell = (removeAttrs escr-shell ["override" "overrideDerivation"]);
in
{
 pkgs = pkgs;
 # export the set used to build shell alongside the main derivation
 # downstream devs can extend/override the shell as needed
 # escr-shell provides canonical dev shell for generic work
 shell = derivation-safe-escr-shell;
 main = pkgs.stdenv.mkDerivation derivation-safe-escr-shell;
}
