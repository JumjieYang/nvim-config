local status, mason_lspconfig = pcall(require, "mason-lspconfig")

if not status then
	vim.notify("lsp installer not found")
	return
end

local status, mason = pcall(require, "mason")

if not status then
	vim.notify("mason not found")
	return
end

mason.setup()

mason_lspconfig.setup({
	ensure_installed = {
		"sumneko_lua",
		"pyright",
		"clangd",
		"gopls",
		"graphql",
		"tsserver",
		"cssls",
		"eslint",
		"jsonls",
		"rust_analyzer",
	},
	automatic_installation = true,
})

mason_lspconfig.setup_handlers({
	function(server_name)
		require("lspconfig")[server_name].setup({})
	end,
})
