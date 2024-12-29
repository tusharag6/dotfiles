-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

-- Put lazy into the runtimepath(rtp) for neovim
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    {
      "folke/tokyonight.nvim",
      lazy = false,
      priority = 1000,
      config = function()
        require("tokyonight").setup({
          style = "moon",
          transparent = true,
          borderless_telescope = true,
          terminal_colors = true,
          styles = {
            comments = { italic = true },
            keywords = { italic = false },
            functions = {},
            variables = {},
          },
          sidebars = { "qf", "vista_kind", "terminal", "packer" },
          dim_inactive = false,
          lualine_bold = true,
          on_highlights = function(hl, c)
            local transparent_bg = "NONE"

            hl.TelescopeNormal = {
              bg = transparent_bg,
              fg = c.fg_dark,
            }
            hl.TelescopeBorder = {
              bg = transparent_bg,
              fg = c.fg_dark,
            }
            hl.TelescopePromptNormal = {
              bg = transparent_bg,
              fg = c.fg,
            }
            hl.TelescopePromptBorder = {
              bg = transparent_bg,
              fg = c.fg_dark,
            }
            hl.TelescopePromptTitle = {
              bg = transparent_bg,
              fg = c.fg,
            }
            hl.TelescopePreviewTitle = {
              bg = transparent_bg,
              fg = c.fg_dark,
            }
            hl.TelescopeResultsTitle = {
              bg = transparent_bg,
              fg = c.fg_dark,
            }
            hl.TelescopeResultsNormal = {
              bg = transparent_bg,
              fg = c.fg,
            }
            hl.TelescopePreviewNormal = {
              bg = transparent_bg,
              fg = c.fg,
            }
          end,
        })
        vim.cmd.colorscheme "tokyonight"
      end,
    },
    { import = "config.plugins" },
  },
})
