return {
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    opts = function(_, opts)
      opts.transparent = true
      opts.italic_comments = true
      opts.borderless_telescope = false
    end,
  },
}

-- return {
--   "folke/tokyonight.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require("tokyonight").setup({
--       style = "moon",
--       transparent = true,
--       borderless_telescope = true,
--       terminal_colors = true,
--       styles = {
--         comments = { italic = true },
--         keywords = { italic = false },
--         functions = {},
--         variables = {},
--       },
--       sidebars = { "qf", "vista_kind", "terminal", "packer" },
--       dim_inactive = false,
--       lualine_bold = true,
--       on_highlights = function(hl, c)
--         local transparent_bg = "NONE"

--         hl.TelescopeNormal = {
--           bg = transparent_bg,
--           fg = c.fg_dark,
--         }
--         hl.TelescopeBorder = {
--           bg = transparent_bg,
--           fg = c.fg_dark,
--         }
--         hl.TelescopePromptNormal = {
--           bg = transparent_bg,
--           fg = c.fg,
--         }
--         hl.TelescopePromptBorder = {
--           bg = transparent_bg,
--           fg = c.fg_dark,
--         }
--         hl.TelescopePromptTitle = {
--           bg = transparent_bg,
--           fg = c.fg,
--         }
--         hl.TelescopePreviewTitle = {
--           bg = transparent_bg,
--           fg = c.fg_dark,
--         }
--         hl.TelescopeResultsTitle = {
--           bg = transparent_bg,
--           fg = c.fg_dark,
--         }
--         hl.TelescopeResultsNormal = {
--           bg = transparent_bg,
--           fg = c.fg,
--         }
--         hl.TelescopePreviewNormal = {
--           bg = transparent_bg,
--           fg = c.fg,
--         }
--       end,
--     })
--     vim.cmd.colorscheme "tokyonight"
--   end,
-- }