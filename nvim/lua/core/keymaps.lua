local keymaps = require("custom.keymaps")

for mode, keymap_group in pairs(keymaps) do
	for _, keymap in ipairs(keymap_group) do
		vim.keymap.set(mode, keymap[1], keymap[2], { desc = keymap[3] })
	end
end
