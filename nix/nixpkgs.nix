let
  inherit (import <nixpkgs> {}) fetchFromGitHub;
in
import (
  fetchFromGitHub {
    owner = "nixos";
    repo = "nixpkgs";
    # 25/11/2020
    rev = "cc5ec5b53b649233b05136b1ea00ef56d6c1253b";
    sha256 = "03dbwy4srzw5rp9nqs0kfavwf2bp341lkl4w2h5iczn1knz0g7s6";
  }
)
