return {
  "blink.cmp",
  event = "InsertEnter",
  after = function()
    require("blink.cmp").setup({
      keymap = { preset = "default", ["<C-p>"] = false },
      appearance = { nerd_font_variant = "mono" },
      completion = { documentation = { auto_show = false } },
      sources = { default = { "lsp", "path", "snippets", "buffer" } },
      snippets = { preset = "luasnip" },
      fuzzy = { implementation = "prefer_rust_with_warning" },
    })
  end,
}
