return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "master",
		lazy = false,
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		config = function()
			require("nvim-treesitter.configs").setup({
				-- Install parsers
				ensure_installed = {
					"nix",
					"lua",
					"vim",
					"vimdoc",
					"bash",
					"python",
					"javascript",
					"typescript",
					"html",
					"css",
					"json",
					"yaml",
					"markdown",
					"c_sharp",
				},
				-- Install parsers synchronously
				sync_install = false,
				-- Autoinstall missing parsers when entering buffer
				auto_install = true,
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				indent = { enable = true },
				textobjects = {
					select = {
						enable = true,
						lookahead = true, -- Jump forward like targets.vim
						keymaps = {
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ao"] = "@comment.outer",
						},
						selection_modes = {
							["@parameter.outer"] = "v", -- charwise
							["@function.outer"] = "V", -- linewise
							["@class.outer"] = "<c-v>", -- blockwise
						},
						include_surrounding_whitespace = true,
					},
					swap = {
						enable = true,
						swap_next = {
							["<leader>a"] = "@parameter.inner",
						},
						swap_previous = {
							["<leader>A"] = "@parameter.inner",
						},
					},
				},
			})
		end,
	},
}
