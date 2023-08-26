local opts = {
	ensure_installed = "all",
}

local plugins = {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		init = function()
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
}

return plugins
