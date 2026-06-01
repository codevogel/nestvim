{
  pkgs,
  inputs,
  lib,
}:

{
  # The package we use for neovim, which is nightly in my case.
  neovim = inputs.neovim-nightly-overlay.packages.${pkgs.stdenv.hostPlatform.system}.default;

  # This will be passed to mnw as the entry point for the config.
  # It delegates to our lua config in `nvim/lua/codevogel/init.lua`
  initLua = ''
    require('codevogel')
  '';

  # Any binaries we may need to run our config, that aren't vim plugins.
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

  # Packages for our vim plugins.
  plugins = {

    # Non-lazy plugins by list
    start =
      with pkgs.vimPlugins;
      [
        lz-n
        kanagawa-nvim
        plenary-nvim
        friendly-snippets
      ]
      ++ [
        # Since nvim-treesitter is archived we manage the parsers ourselves.
        # The grammarToPlugin will build the parser and make it available as a plugin.
        # Queries have to be managed manually.

        # Pin gdscript parser from github as the nixos-unstable doesn't have it
        (pkgs.neovimUtils.grammarToPlugin (
          pkgs.tree-sitter.buildGrammar {
            language = "gdscript";
            version = "d2a0ee9";
            src = pkgs.fetchFromGitHub {
              owner = "PrestonKnopp";
              repo = "tree-sitter-gdscript";
              rev = "d2a0ee914d297b873a40dd4596bd1f7157ebc52b";
              sha256 = "sha256-QT28TQBt20lMScfF4zb2RJhlPFNekjocOWbvQ2a2yuM=";
            };
          }
        ))
      ];

    # Lazy plugins by list
    # These are intended to be loaded by `lz.n`
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
      ]
      ++ [
        # Pinned from git because it's not in nixpkgs
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

    # Lazy plugins by attribute set (some plugins may require renaming)
    optAttrs = {
      "harpoon" = pkgs.vimPlugins.harpoon2;
      "todo-comments" = pkgs.vimPlugins.todo-comments-nvim;
      "lint" = pkgs.vimPlugins.nvim-lint;
      "roslyn" = pkgs.vimPlugins.roslyn-nvim;
      "colorizer" = pkgs.vimPlugins.nvim-colorizer-lua;
    };

    # Finally, here we define our devMode.
    dev.codevogel = {
      pure = ./nvim;
      impure = "/home/$(whoami)/nestvim/nvim";
    };

    dev."swiftpick.nvim" = {
      pure = pkgs.vimUtils.buildVimPlugin {
        name = "swiftpick.nvim";
        src = /home/codevogel/work/neovim/swiftpick.nvim;
      };
      impure = "/home/codevogel/work/neovim/swiftpick.nvim";
    };
  };
}
