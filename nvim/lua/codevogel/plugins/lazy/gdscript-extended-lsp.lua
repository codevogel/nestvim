return {
  "gdscript-extended-lsp.nvim",
  ft = { "gdscript" },
  after = function()
    -- Must run before the gdscript client attaches, as it hooks into LspAttach.
    require("gdscript-extended-lsp").setup({
      picker = "snacks",
    })

    -- Godot's LSP answers a declaration request on a native symbol by sending
    -- the documentation for it, which the plugin then renders in a split.
    -- With an argument, open the documentation for that class instead.
    vim.api.nvim_create_user_command("Doc", function(cmd)
      if cmd.args ~= "" then
        require("gdscript-extended-lsp").request_doc_class(cmd.args)
      else
        vim.lsp.buf.declaration()
      end
    end, {
      nargs = "?",
      desc = "Open Godot documentation for the symbol under the cursor",
      complete = function(arg_lead)
        return vim.tbl_filter(function(class)
          return vim.startswith(class:lower(), arg_lead:lower())
        end, require("gdscript-extended-lsp").get_classes())
      end,
    })

    -- User commands must start with an uppercase letter, so expand `:doc` to `:Doc`.
    vim.cmd([[cnoreabbrev <expr> doc getcmdtype() ==# ':' && getcmdline() ==# 'doc' ? 'Doc' : 'doc']])
  end,
}
