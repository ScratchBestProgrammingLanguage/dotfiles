local plugins = {
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000, init = function ()
		vim.cmd.colorscheme "catppuccin-mocha"
	end },
}

return plugins
