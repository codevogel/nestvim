return {
  "swiftpick",
  keys = {
    { "<leader>h", "<CMD>SwiftPick<CR>", desc = "Open SwiftPick" },
    { "<leader>H", "<CMD>SwiftPickGlobal<CR>", desc = "Open SwiftPick [Global]" },
  },
  after = function()
    require("swiftpick").setup({
      -- your options here
    })
  end,
}
