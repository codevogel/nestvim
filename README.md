# Nestvim 🪺

**Nestvim** is my [Neovim](https://neovim.io/) config housed in a standalone nix
flake.

It uses [Gerg-L's 'Minimal Neovim Wrapper' (mnw)](https://github.com/Gerg-L/mnw)
to wrap my neovim config (including everything it needs to function, like fzf
and LSPs) into a reproducible package.

## Run my config

You can run my neovim config on any Nix machine using:

```bash
nix run github:codevogel/nestvim
```

Or fork/clone it locally if you want to adapt it:

```bash
git clone git@github.com:codevogel/nestvim.git
cd nestvim
nix run
```

For [hot reloading](https://gerg-l.github.io/mnw/usage.html#dev-mode) the
config use the `#dev` attribute:

```bash
cd nestvim
nix run .#dev
```

## Use in your own config

I wouldn't recommend using my config as everyone has their own needs, but this
might help you understand how to set up mnw for your own nix-based neovim config.

Add this to your `flake.nix`, say in `~/yournixos/flake.nix`:

```nix
{
  inputs = {
    nestvim.url = "github:codevogel/nestvim"; # or point this to your own flake
    inputs.nixpkgs.follows = "nixpkgs";
    # If you use mnw or neovim elsewhere, you might want to follow those too.
  };

  outputs =
    {
      self,
      nixpkgs,
      nestvim,
      ...
    }@inputs:
    {

      packages.x86_64-linux = {
        # map 'nestvim' attribute to the default package from the nestvim flake
        nestvim = nestvim.packages.x86_64-linux.default;
        # map 'dev' attribute to the 'dev' package from the nestvim flake for
        # hot reloading
        dev = nestvim.packages.x86_64-linux.dev;
      };

      nixosConfigurations = { # redacted for brevity };
}
```

Then add this to your `neovim.nix`, say in `~/yournixos/modules/neovim.nix`:

```nix
{
  self,
  ...
}:

{
  environment.systemPackages = [
    # this is the 'nestvim' we defined in the flake.nix outputs
    self.packages.x86_64-linux.nestvim
  ];
}
```

And import that into your `configuration.nix`, say in `~/yournixos/hosts/my-host/configuration.nix`:

```nix
{ ... }:

{
  imports =
    [
      ../../neovim.nix # or wherever you put it
      # other imports...
    ];
}
```

Now you can run `nvim`, or alternatively,
`nix run ~/yournixos#nestvim` or `nix run ~/yournixos#dev`
