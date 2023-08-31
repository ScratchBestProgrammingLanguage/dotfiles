local get_capabilities = function()
	return require("cmp_nvim_lsp").default_capabilities()
end
local lsps = { "lua_ls", "rust_analyzer", "zls", "bashls", "gopls", "html" }

local handlers = {
	function(server_name)
		require("lspconfig")[server_name].setup({
			capabilities = get_capabilities(),
		})
	end,

	["rust_analyzer"] = function()
		require("rust-tools").setup({
			capabilities = get_capabilities(),
		})
	end,

	["lua_ls"] = function()
		require("lspconfig").lua_ls.setup({
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
			capabilities = get_capabilities(),
		})
	end,
}

local plugins = {
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim", config = true },
		opts = {
			ensure_installed = lsps,
			handlers = handlers,
			automatic_installation = true,
		},
	},
	{ "simrat39/rust-tools.nvim" },
	{ "neovim/nvim-lspconfig" },
}

return plugins
