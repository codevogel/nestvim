return {
  "oil.nvim",
  cmd = "Oil",
  keys = {
    { "<leader>oo", "<cmd>Oil<cr>", desc = "Open Oil" },
    { "<leader>oc", "<cmd>Oil .<cr>", desc = "Open Oil in CWD" },
    {
      "<leader>oh",
      function()
        require("oil"):toggle_hidden()
      end,
      desc = "Toggle Oil hidden files",
    },
  },
  after = function()
    require("oil").setup()
  end,
}
