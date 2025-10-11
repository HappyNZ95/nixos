vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "gl", function()
	vim.diagnostic.open_float()
end, { desc = "Open Diagnostics in Float" })

vim.keymap.set("n", "<leader>cf", function()
	require("conform").format({
		lsp_format = "fallback",
	})
end, { desc = "Format current file" })

-- Map <leader> fp to open projects
vim.keymap.set("n", "<leader>fp", ":Telescope projects<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>|", ":vsplit<CR>")

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>rr", ":restart<CR>", { desc = "Restart Neovim and open dashboard" })

local helpers = require("core.helpers")

