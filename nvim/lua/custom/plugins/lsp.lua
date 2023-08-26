local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lsps = { "lua_ls", "rust_analyzer", "zls", "bashls" }

local handlers = {
	function(server_name)
		require("lspconfig")[server_name].setup({
			capabilities = capabilities,
		})
	end,

	["rust_analyzer"] = function()
		require("rust-tools").setup({
			capabilities = capabilities,
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
			capabilities = capabilities,
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
