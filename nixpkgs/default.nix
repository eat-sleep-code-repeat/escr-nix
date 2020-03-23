let
  # nixos channel latest 19.09
  # keep the Dockerfile in sync with this!
  nixpkgs = fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/821c7ed030bca86c8217e6d20df1f01c6474adf4.tar.gz";
    sha256 = "0varkgzi5nbx4kb6mjmllk1a48pc5nmad6jfikj627yqrb4wcyfw";
  };
in

import nixpkgs {
  overlays = [];
}
