local M = {}

-- Open today's daily note
function M.open_daily_note()
	local today = os.date("%Y-%m-%d")
	local path = "~/sync-vault/Diary/" .. today .. ".md"
	vim.cmd("edit " .. path)
end

return M

