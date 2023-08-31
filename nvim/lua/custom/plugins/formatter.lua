local cfg = function()
	local cfg = {
		filetype = {
			lua = require("formatter.filetypes.lua").stylua,
			go = require("formatter.filetypes.go").gofmt,
		},
	}

	return cfg
end

local plugins = {
	{
		"mhartington/formatter.nvim",
		init = function()
			require("formatter").setup(cfg())
		end,
	},
}

vim.cmd([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost * FormatWrite
augroup END
]])

return plugins
