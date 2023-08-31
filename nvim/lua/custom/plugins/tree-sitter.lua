local opts = {
	ensure_installed = "all",
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
}

local plugins = {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		init = function()
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}

return plugins
