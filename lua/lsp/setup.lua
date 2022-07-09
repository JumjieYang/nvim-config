local status, lsp_installer = pcall(require, 'nvim-lsp-installer')

if not status then
  vim.notify('lsp installer not found')
  return
end

local servers = {
  sumneko_lua = require('lsp.config.lua'),
  pyright = require('lsp.config.pyright'),
}

for name, _ in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)

  if server_is_found then
    if not server:is_installed() then
      print("install " .. name)
      server:install()
    end
  end
end

lsp_installer.on_server_ready(function(server)
  local config = servers[server.name]
  if config == nil then
    return

  end

  if config.on_setup then
    config.on_setup(server)
  else
    sever:setup({})
  end
end)
