require("codevogel.config")
require("lz.n").load("codevogel.plugins.lazy")

vim.cmd("colorscheme kanagawa")

require("codevogel.parsers")

-- Open Oil if the first argument is a directory,
-- which will trigger lz.n to load the plugin.
vim.api.nvim_create_autocmd("VimEnter", {
  once = true,
  callback = function()
    local arg = vim.fn.argv(0) -- [[@as string]]
    if type(arg) == "string" and arg ~= "" and vim.fn.isdirectory(arg) == 1 then
      vim.cmd("Oil " .. vim.fn.fnameescape(arg))
    end
  end,
})

require("swiftpick2").setup({})

vim.api.nvim_set_keymap(
  "n",
  "<leader>h",
  ':lua require("swiftpick2").picker.open_picker()<CR>',
  { desc = "Open SwiftPick2" }
)
