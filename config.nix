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
    nodejs

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
        plenary-nvim
        friendly-snippets
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
        gitsigns-nvim
        lualine-nvim
        copilot-vim
        {
          pname = "colorizer";
          src = nvim-colorizer-lua;
        }
      ]
      ++ [
        {
          pname = "harpoon-lualine";
          src = pkgs.fetchFromGitHub {
            owner = "letieu";
            repo = "harpoon-lualine";
            rev = "215c0847dfb787b19268f7b42eed83bdcf06b966";
            sha256 = "sha256-HGbz/b2AVl8145BCy8I47dDrhBVMSQQIr+mWbOrmj5Q=";
          };
        }
      ];

    optAttrs = {
      "harpoon" = pkgs.vimPlugins.harpoon2;
    };

    dev.codevogel = {
      pure = ./nvim;
      impure = "/home/$(whoami)/nestvim/nvim";
    };
  };
}
