vim.api.nvim_create_autocmd("FileType", {
  pattern = "gdscript",
  callback = function(ev)
    vim.treesitter.start(ev.buf, "gdscript")
  end,
})
