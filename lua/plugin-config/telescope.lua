local status, telescope = pcall(require, 'telescope')

if not status then
  vim.notify('telescope not found')
  return
end

telescope.setup({
defaults = {
initial_mode = 'insert',

mappings = require('keybindings').telescopeList,
  },
})

pcall(telescope.load_extension, 'env')
