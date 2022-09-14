local status, project = pcall(require, 'project-nvim')

if not status then
  vim.notify('project_nvim not found')
  return
end

vim.g.nvim_tree_respect_buf_cwd = 1

project.setup({
  detection_methods = {'pattern'},
  patterns = { '.git', '.bzr','makefile','Dockerfile','package.json', 'requirements.txt','.sln'},
})

local status, telescope = pcall(require, 'telescope')
if not status then
  vim.notify('telescope not found')
  return
end

pcall(telescope.load_extension, "projects")
