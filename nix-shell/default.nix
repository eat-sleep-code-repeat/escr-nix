{ pkgs, git, node }:
{
 name = "escr-shell";
 buildInputs = [
  pkgs.coreutils
  pkgs.unixtools.watch
 ]
 ++ (pkgs.callPackage ./flush { }).buildInputs
 ++ git.buildInputs
 ++ node.buildInputs
#  ++ drone.buildInputs
 ;
}
