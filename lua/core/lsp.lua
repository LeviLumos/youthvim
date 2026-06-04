vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = { version = "LuaJIT", path = vim.split(package.path, ";") },
			diagnostics = { globals = { "vim" } },
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			format = { enable = true },
		},
	},
})

vim.diagnostic.config({ virtual_text = true })
vim.lsp.enable({ "lua_ls", "pyright", "clangd" })
