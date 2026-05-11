local keymap = require("lz.n").keymap({ "luasnip" })

return {
  "luasnip",
  event = "InsertEnter",
  after = function()
    local snippet_paths = vim.api.nvim_get_runtime_file("lua/codevogel/snippets", true)
    require("luasnip.loaders.from_lua").lazy_load({ paths = snippet_paths })
    require("luasnip.loaders.from_vscode").lazy_load()
  end,

  keymap.set({ "i", "s" }, "<C-h>", function()
    require("luasnip").jump(-1)
  end, { desc = "Jump to previous snippet placeholder" }),
  keymap.set({ "i", "s" }, "<C-l>", function()
    require("luasnip").jump(1)
  end, { desc = "Jump to previous snippet placeholder" }),
}
