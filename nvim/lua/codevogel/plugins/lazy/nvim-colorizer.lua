return {
  "colorizer",
  event = { "BufReadPre", "BufNewFile" },
  after = function()
    require("colorizer").setup()
  end,
}
