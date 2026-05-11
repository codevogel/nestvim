{
  description = "codevogel's neovim config";

  # Here we define the inputs to our flake.
  # We need nixpkgs, and Gerg's mnw.
  # (In my case I also need neovim-nightly-overlay,
  #  but if you're on stable you obviously don't need it.)
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
          # Needed for nodejs and some other packages.
          allowUnfree = true;
        };
      };

      # This is where we point to our actual mnw config in a separate file.
      config = import ./config.nix {
        inherit pkgs inputs;
      };
    in
    {
      # Here we define the packages that our flake provides.
      packages.${system} = {
        # 'default' so we can just do `nix run` to run it.
        default = mnw.lib.wrap pkgs config;
        # 'dev' is for the development config
        dev = self.packages.${system}.default.devMode;
      };
    };
}
