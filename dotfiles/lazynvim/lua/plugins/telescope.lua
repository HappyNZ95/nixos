return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		keys = {
			{ "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Find files in project directory" },
			{ "<leader>fg", function() require("telescope.builtin").live_grep() end, desc = "Find by grepping in project directory" },
			{ "<leader>fc", function() require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find within Neovim configuration" },
			{ "<leader>fv", function() require("telescope.builtin").find_files({ cwd = "~/sync-vault/" }) end, desc = "Find within obsidian Vault" },
			{ "<leader>fp", ":Telescope projects<CR>", desc = "Find Project" },
			{ "<leader>fh", function() require("telescope.builtin").help_tags() end, desc = "Find Help" },
			{ "<leader>fk", function() require("telescope.builtin").keymaps() end, desc = "Find Keymaps" },
			{ "<leader>fb", function() require("telescope.builtin").builtin() end, desc = "Find Builtin telescope commands" },
			{ "<leader>fw", function() require("telescope.builtin").grep_string() end, desc = "Find current Word under cursor" },
			{ "<leader>fW", function() require("telescope.builtin").grep_string({ search = vim.fn.expand("<cWORD>") }) end, desc = "Find current WORD under cursor" },
			{ "<leader>fd", function() require("telescope.builtin").diagnostics() end, desc = "Find Diagnostics" },
			{ "<leader>fr", function() require("telescope.builtin").resume() end, desc = "Resume last picker" },
			{ "<leader>fof", function() require("telescope.builtin").oldfiles() end, desc = "Find Old Files" },
			{ "<leader><leader>", function() require("telescope.builtin").buffers() end, desc = "[,] Find existing buffers" },
			{ "<leader>/", function() require("telescope.builtin").current_buffer_fuzzy_find() end, desc = "[/] Live grep the current buffer" },
		},
		opts = {
			defaults = {
				mappings = {
					i = {
						["<esc>"] = function(...) require("telescope.actions").close(...) end,
						["<C-j>"] = function(...) require("telescope.actions").move_selection_next(...) end,
						["<C-k>"] = function(...) require("telescope.actions").move_selection_previous(...) end,
					},
				},
			},
		},
	},
}
