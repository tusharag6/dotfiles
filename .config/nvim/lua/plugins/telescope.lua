return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      "folke/todo-comments.nvim",
      "nvim-tree/nvim-web-devicons",

    },
    config = function()
      require("telescope").setup({
        defaults = {
          path_display = { "smart" },
          mappings = {
            i = { ["<C-c>"] = "close" },
            n = { ["<C-c>"] = "close" },
          },
        },
        extensions = {
          fzf = {},
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        }
      })
      require("telescope").load_extension("fzf")
      require("telescope").load_extension("ui-select")

      vim.keymap.set("n", "<space>fh", require('telescope.builtin').help_tags, { desc = "[F]ind [H]elp" })
      vim.keymap.set("n", "<C-p>", require("telescope.builtin").git_files, { desc = "Find git files" })
      vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, { desc = "[F]ind [F]iles" })
      vim.keymap.set("n", "<leader>en", function()
        require("telescope.builtin").find_files {
          cwd = vim.fn.stdpath("config")
        }
      end, { desc = "[E]dit [N]eovim" })
      vim.keymap.set('n', '<leader>df', ':Telescope diagnostics bufnr=0<CR>',
        { desc = "[D]iagnostics in current [F]ile" })
      vim.keymap.set('n', '<leader>dd', require("telescope.builtin").diagnostics,
        { desc = "[D]iagnostics in current [D]irectory" })
      vim.keymap.set("n", "<leader>fs", require("telescope.builtin").live_grep, { desc = "Find string" })
      vim.keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
      vim.keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
      vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
    end
  }
}
