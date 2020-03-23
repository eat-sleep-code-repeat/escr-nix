{
 pkgs,
 git,
 node
#  vue
}:
{
 name = "philt3r-shell";

 buildInputs = [
  # for mktemp
  pkgs.coreutils

  # simple dev feedback loop
  pkgs.unixtools.watch
 ]
 ++ (pkgs.callPackage ./flush { }).buildInputs
 ++ git.buildInputs
 ++ node.buildInputs
#  ++ vue.buildInputs
 ;
}
