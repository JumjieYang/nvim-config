local status, nvim_tree = pcall(require, 'nvim-tree')

if not status then
  vim.notify('unable to find nvim-tree')
  return
end

local list_keys = require('keybindings').nvimTreeList

nvim_tree.setup({
  git = {
    enable = false,
  },

  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },

  filters = {
    dotfiles = true,
    custom = {'node_modules'},
  },

  view = {
    width = 40,
    side = 'left',
    hide_root_folder = false,
    mappings = {
      custom_only = false,
      list = list_keys,
    },

    number = false,
    relativenumber = false,
    signcolumn = 'yes',
  },

  actions = {
    open_file = {
      resize_window = true,
      quit_on_open = false,
    },
  },

  system_open = {
    cmd='open',
  },
})

vim.cmd([[
  autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
]])



