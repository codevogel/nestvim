local keymap = require("lz.n").keymap({ "nvim-lspconfig" })

return {
  "nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  after = function()
    -- Servers to enable, with their config.
    -- Empty configs use the nvim-lspconfig defaults.
    local servers = {
      lua_ls = {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = {
                vim.env.VIMRUNTIME,
                unpack(vim.api.nvim_get_runtime_file("", true)),
              },
              checkThirdParty = false,
            },
            hint = { enable = true },
            completion = { callSnippet = "Replace" },
          },
        },
      },
    }

    for server_name, cfg in pairs(servers) do
      vim.lsp.config(server_name, cfg)
      vim.lsp.enable(server_name)
    end
  end,

  keymap.set("n", "<leader>cr", vim.lsp.buf.rename, {
    desc = "LSP: [C]ode [R]ename",
  }),

  keymap.set({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, {
    desc = "LSP: [C]ode [A]ction",
  }),
}
