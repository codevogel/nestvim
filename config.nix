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
    fzf
    nodejs

    # LSP
    nixd
    bash-language-server
    lua-language-server
    roslyn-ls
    vscode-langservers-extracted

    # Linters
    eslint
    eslint_d
    markdownlint-cli2

    # Formatters
    stylua
    nixfmt
    prettier
    prettierd
    csharpier

    # More than one function
    beautysh
    shellcheck
    gdtoolkit_4
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
        nvim-lint
        roslyn-nvim
        {
          pname = "todo-comments";
          src = todo-comments-nvim;
        }
        {
          pname = "lint";
          src = nvim-lint;
        }
        {
          pname = "roslyn";
          src = roslyn-nvim;
        }
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
