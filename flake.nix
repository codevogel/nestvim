{
  description = "codevogel's neovim config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    mnw.url = "github:gerg-l/mnw";
  };

  outputs =
    {
      nixpkgs,
      mnw,
      self,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };

      config = import ./config.nix {
        inherit pkgs inputs;
      };
    in
    {
      packages.${system} = {
        default = mnw.lib.wrap pkgs config;
        dev = self.packages.${system}.default.devMode;
      };
    };
}
