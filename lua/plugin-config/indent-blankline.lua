local status, ident_blankline = pcall(require, "indent_blankline")
if not status then
  vim.notifiy('ndent_blankline not found')
  return
end

ident_blankline.setup({
  space_char_blankline = " ",
  show_current_context_start = true,
  context_patterns = {
    "class",
    "function",
    "method",
    "element",
    "^if",
    "^while",
    "^for",
    "^object",
    "^table",
    "block",
    "arguments",
  },
  filetype_exclude = {
    "dashboard",
    "packer",
    "terminal",
    "help",
    "log",
    "markdown",
    "TelescopePrompt",
    "lsp-installer",
    "lspinfo",
    "toggleterm",
  },
  char = '| ',
})
