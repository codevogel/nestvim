{
  pkgs,
  inputs,
}:

{
  neovim = inputs.neovim-nightly-overlay.packages.${pkgs.stdenv.hostPlatform.system}.default;

  initLua = ''
    require('codevogel')
    require('lz.n').load('codevogel.lazy')
  '';

  plugins = {

    start =
      with pkgs.vimPlugins;
      [
        lz-n
      ]
      ++ [ ];

    opt =
      with pkgs.vimPlugins;
      [
        oil-nvim
        which-key-nvim
        mini-icons
        nvim-web-devicons
      ]
      ++ [ ];

    dev.codevogel = {
      pure = ./nvim;
      impure = "/home/$(whoami)/nestvim/nvim";
    };
  };
}
