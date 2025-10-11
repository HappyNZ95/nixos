vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.shiftwidth = 4 -- amount to indent with >> and <<
vim.opt.tabstop = 4 -- How many spaces are shown per Tab
vim.opt.softtabstop = 4 -- How many spaces are applied when pressing Tab

vim.api.nvim_set_hl(0, "LineNr", { bg = "NONE" }) -- Disable background colour for linenumbers
vim.api.nvim_set_hl(0, "CursorLineBr", { bg = "NONE" })

vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.autoindent = true -- keep indentation from previous line

-- Enable break indent
vim.opt.breakindent = true

-- Always show relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

--Show line under cursor
vim.opt.cursorline = true

-- Store undos between sessions
vim.opt.undofile = true

-- Enable mouse mode, can be useful for resizing splits
vim.opt.mouse = "a"

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Share system clipboard
vim.api.nvim_set_option("clipboard", "unnamedplus")

--- Case-insensitive seraching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on b default
vim.opt.signcolumn = "yes"

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- sets how neovim will display certain whitespace characters in the editor
-- See `:help 'list'`
-- and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Minimal number of screen lines to keep above and below the cursor
vim.opt.scrolloff = 5

vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "none" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })

-- Set Neovim's CWD to the current file's directory
-- Oil.nvim/Fyler friendly auto CWD
vim.api.nvim_create_autocmd({ "BufEnter" }, {
	callback = function()
		local ft = vim.bo.filetype
		local buftype = vim.bo.buftype
		
		-- Skip special buffers (file explorers, terminals, etc.)
		if ft == "oil" or ft == "fyler" or buftype ~= "" then
			return
		end
		
		local dir = vim.fn.expand("%:p:h")
		-- Only change directory if we have a valid directory path
		if dir ~= "" and vim.fn.isdirectory(dir) == 1 then
			vim.cmd("lcd " .. dir)
		end
	end,
})
---- :terminal opens in current directory
--vim.api.nvim_create_autocmd("TermOpen", {
--	pattern = "*",
--	callback = function()
--		vim.cmd("lcd " .. vim.fn.getcwd())
--	end,
--})

