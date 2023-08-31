local config = function()
	local cmp = require("cmp")
	local cmp_autopairs = require("nvim-autopairs.completion.cmp")

	require("luasnip.loaders.from_vscode").lazy_load()

	cmp.setup({
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},
		mapping = cmp.mapping.preset.insert({
			["<Tab>"] = cmp.mapping.confirm({ select = true }),
			["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
			["<C-b>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
		}),
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = "buffer" },
			{ name = "luasnip" },
			{ name = "nvim_lua" },
			{ name = "path" },
		}),
		-- Auto select first item
		completion = {
			completeopt = "menu,menuone,noinsert",
		},
	})

	-- Git filetype.
	cmp.setup.filetype("gitcommit", {
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = "buffer" },
			{ name = "luasnip" },
			{ name = "path" },
		}),
	})

	-- Auto pairs
	cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
end

local plugins = {
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-cmdline" },
	{ "hrsh7th/nvim-cmp", config = config, event = "InsertEnter" },
}

return plugins
