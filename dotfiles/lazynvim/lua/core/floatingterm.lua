local M = {}

local term_buf = nil
local term_win = nil

function M.toggle_floaterm()
	if term_win and vim.api.nvim_win_is_valid(term_win) then
		vim.api.nvim_win_close(term_win, true)
		term_win = nil
		return
	end

	-- Capture cwd BEFORE creating a new buffer
	local bufname = vim.api.nvim_buf_get_name(0)
	local cwd = vim.fn.fnamemodify(bufname, ":p:h")
	if cwd == "" then
		cwd = vim.fn.getcwd()
	end

	-- Debug
	print("Opening terminal in: " .. cwd)

	term_buf = vim.api.nvim_create_buf(false, true)

	local width = math.floor(vim.o.columns * 0.8)
	local height = math.floor(vim.o.lines * 0.8)
	local row = math.floor((vim.o.lines - height) / 2)
	local col = math.floor((vim.o.columns - width) / 2)

	term_win = vim.api.nvim_open_win(term_buf, true, {
		relative = "editor",
		width = width,
		height = height,
		row = row,
		col = col,
		style = "minimal",
		border = "rounded",
	})

	-- Spawn shell directly in saved cwd
	vim.fn.termopen(vim.o.shell, { cwd = cwd })

	vim.cmd("startinsert")
end

vim.keymap.set("n", "<leader><tab>", M.toggle_floaterm, { noremap = true, silent = true })

return M
