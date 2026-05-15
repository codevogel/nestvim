vim.diagnostic.config({
  severity_sort = true,
  float = { border = "rounded", source = "if_many" },
  signs = vim.g.have_nerd_font and {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅚 ",
      [vim.diagnostic.severity.WARN] = "󰀪 ",
      [vim.diagnostic.severity.INFO] = "󰋽 ",
      [vim.diagnostic.severity.HINT] = "󰌶 ",
    },
  } or {},
  underline = true,
  virtual_text = {
    current_line = false,
  },
  virtual_lines = {
    current_line = true,
  },
})
