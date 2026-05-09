return {
  "kanagawa.nvim",
  colorscheme = "kanagawa",
  after = function()
    require("kanagawa").setup({
      overrides = function(colors)
        return {
          DiagnosticWarn = {
            fg = colors.palette.roninYellow,
            bg = colors.palette.sumiInk0,
            bold = false,
          },
        }
      end,
    })
  end,
}
