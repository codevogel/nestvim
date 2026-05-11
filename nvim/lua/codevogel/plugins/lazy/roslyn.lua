return {
  "roslyn",
  ft = { "cs" },
  after = function()
    require("roslyn").setup({})
  end,
}
