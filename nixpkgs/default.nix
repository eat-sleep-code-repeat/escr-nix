let
  nixpkgs = fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/master.tar.gz";
  };
in

import nixpkgs {
  overlays = [];
}
