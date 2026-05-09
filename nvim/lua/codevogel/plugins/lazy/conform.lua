return {
  "conform.nvim",
  event = "BufWritePre",
  after = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        nix = { "nixfmt" },
        sh = { "beautysh" },
        markdown = { "prettierd", "markdownlint-cli2" },
        gdscript = { "gdformat" },
        svelte = { "prettierd" },
        ts = { "prettierd" },
        js = { "prettierd" },
        cs = { "csharpier" },
        yaml = { "prettierd" },
      },
    })

    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*",
      callback = function(args)
        require("conform").format({
          bufnr = args.buf,
          timeout_ms = 500,
          lsp_format = "fallback",
        })
      end,
    })
  end,
}
