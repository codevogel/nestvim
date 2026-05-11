local keymap = require("lz.n").keymap({ "copilot.vim" })
return {
  "copilot.vim",
  event = { "BufNewFile", "BufReadPost" },
  after = function()
    vim.g.copilot_no_tab_map = true
  end,
  keymap.set("i", "<C-p>", 'copilot#Accept("\\<CR>")', { expr = true, replace_keycodes = false }),
}
