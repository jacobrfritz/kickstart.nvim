-- lua/plugins/outline.lua
return {
  {
    'stevearc/aerial.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
    event = 'VeryLazy',
    config = function()
      require('aerial').setup {
        show_guides = true,
        layout = {
          default_direction = 'right',
          max_width = { 40, 0.2 },
          min_width = 30,
        },
        close_on_select = false,
      }
      -- Toggle aerial sidebar outline
      vim.keymap.set('n', '<leader>cs', '<cmd>AerialToggle!<CR>', { desc = '[C]ode [S]tructure Outline' })
    end,
  },
}
