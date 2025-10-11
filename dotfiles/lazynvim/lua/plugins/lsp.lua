return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"mason-org/mason.nvim",
			"mason-org/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"lua_ls",
					"stylua",
					"pyright",
					"omnisharp", --c_sharp
					"alejandra",
				},
			})
		end,
	},
}
