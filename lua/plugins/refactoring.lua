-- lua/plugins/refactoring.lua
return {
  {
    'stevearc/dressing.nvim',
    event = 'VeryLazy',
    opts = {},
  },

  {
    'smjonas/inc-rename.nvim',
    event = 'VeryLazy',
    config = function()
      require('inc-rename').setup()
      vim.keymap.set('n', '<leader>rn', function()
        return ':IncRename ' .. vim.fn.expand '<cword>'
      end, { expr = true, desc = 'Incremental LSP Rename' })
    end,
  },

  {
    'ThePrimeagen/refactoring.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    event = 'VeryLazy',
    config = function()
      require('refactoring').setup()

      -- visual mode keymaps
      vim.keymap.set('x', '<leader>re', ':Refactor extract ', { desc = 'Refactor: Extract Function' })
      vim.keymap.set('x', '<leader>rv', ':Refactor extract_var ', { desc = 'Refactor: Extract Variable' })
      vim.keymap.set('x', '<leader>rf', ':Refactor extract_to_file ', { desc = 'Refactor: Extract to File' })

      -- normal mode keymaps
      vim.keymap.set('n', '<leader>ri', ':Refactor inline_var', { desc = 'Refactor: Inline Variable' })
      vim.keymap.set('n', '<leader>rb', ':Refactor extract_block ', { desc = 'Refactor: Extract Block' })
      vim.keymap.set('n', '<leader>rB', ':Refactor extract_block_to_file ', { desc = 'Refactor: Extract Block to File' })
    end,
  },
}
