{
  pkgs,
  inputs,
}:

{
  neovim = inputs.neovim-nightly-overlay.packages.${pkgs.stdenv.hostPlatform.system}.default;

  initLua = ''
    require('codevogel')
  '';

  extraBinPath = with pkgs; [
    # Tools
    ripgrep

    # LSP
    lua-language-server

    # Formatters
    stylua
    nixfmt
    prettier
    prettierd
    csharpier
  ];

  plugins = {

    start =
      with pkgs.vimPlugins;
      [
        lz-n
        kanagawa-nvim
      ]
      ++ [ ];

    opt =
      with pkgs.vimPlugins;
      [
        oil-nvim
        nvim-lspconfig
        which-key-nvim
        mini-icons
        nvim-web-devicons
        snacks-nvim
        blink-cmp
        luasnip
        conform-nvim
        fidget-nvim
      ]
      ++ [ ];

    dev.codevogel = {
      pure = ./nvim;
      impure = "/home/$(whoami)/nestvim/nvim";
    };
  };
}
