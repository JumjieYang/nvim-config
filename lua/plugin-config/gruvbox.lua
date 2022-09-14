local status, gruvbox = pcall(require, 'gruvbox')

if not status then
  vim.notify('unable to find gruvbox')
  return
end

gruvbox.setup({
})

vim.cmd("colorscheme gruvbox")
