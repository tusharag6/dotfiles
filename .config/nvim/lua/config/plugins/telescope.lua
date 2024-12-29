return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function()
      require("telescope").setup({
        defaults = {
          mappings = {
            i = { ["<C-c>"] = "close" },
            n = { ["<C-c>"] = "close" },
          },
        },
        extensions = {
          fzf = {}
        }
      })
      require("telescope").load_extension("fzf")

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
      vim.keymap.set("n", "<C-s>", require("telescope.builtin").live_grep, { desc = "Find string" })
    end
  }
}
