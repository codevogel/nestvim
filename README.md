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
