local function windows_host_ip()
  local handle = io.popen("ip route show | grep -i default | awk '{ print $3}'")
  local ip = handle:read("*l")
  handle:close()
  return ip
end

return {
  "roslyn",
  ft = { "cs" },
  before = function()
    vim.lsp.config("roslyn", {
      cmd = vim.lsp.rpc.connect(windows_host_ip(), 5757),
    })
  end,
  after = function()
    require("roslyn").setup({})
  end,
}
