
return {
  {
    "Saghen/blink.cmp",
dependencies = {
  { "hrsh7th/nvim-cmp" },
  { "ray-x/cmp-sql" },
  { "rafamadriz/friendly-snippets" },
  { "Allaman/emoji.nvim" },
},
    config = function()
      require("blink-cmp").setup({
        keymap = { preset = "default" },

        appearance = {
          nerd_font_variant = "mono",
        },

        completion = {
          documentation = { auto_show = false },
        },

        sources = {
          default = { "lsp", "path", "snippets", "buffer" },
        },

        fuzzy = { implementation = "lua" },
      })
    end,
  },
}
