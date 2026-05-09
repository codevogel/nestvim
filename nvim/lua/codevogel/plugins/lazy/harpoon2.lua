return {
  "harpoon",
  keys = {
    {
      "<leader>ha",
      function()
        require("harpoon"):list():add()
      end,
      desc = "Harpoon: Add file",
    },
    {
      "<leader>hw",
      function()
        local harpoon = require("harpoon")
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = "Harpoon: Open menu",
    },
    {
      "<leader>hh",
      function()
        require("harpoon"):list():select(1)
      end,
      desc = "Harpoon: Go to file 1",
    },
    {
      "<leader>hj",
      function()
        require("harpoon"):list():select(2)
      end,
      desc = "Harpoon: Go to file 2",
    },
    {
      "<leader>hk",
      function()
        require("harpoon"):list():select(3)
      end,
      desc = "Harpoon: Go to file 3",
    },
    {
      "<leader>hl",
      function()
        require("harpoon"):list():select(4)
      end,
      desc = "Harpoon: Go to file 4",
    },
  },

  after = function()
    require("harpoon")
  end,
}
