local plugins = {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		init = function()
			require("nvim-autopairs").setup()
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
		init = function()
			require("nvim-ts-autotag").setup()
		end,
	},
}

return plugins
