local telescope = require("telescope.builtin")

local keymaps = {
	["n"] = {
		-- Telescope
		{ "<leader>ff", telescope.find_files, "[F]ind [F]iles" },
		{ "<leader>fg", telescope.live_grep, "[F]ind [G]rep" },
		{ "<leader>fb", telescope.buffers, "[F]ind [B]uffers" },
		{ "<leader>fh", telescope.help_tags, "[F]ind [H]elp" },

		-- Lsp
		{ "<leader>lh", vim.lsp.buf.hover, "[L]sp [H]over" },
		{ "<leader>gd", vim.lsp.buf.definition, "[G]oto [D]efinition" },
	},
}

return keymaps
