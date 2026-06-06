-- lua/plugins/bufferline.lua
return {
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    event = 'VeryLazy',
    config = function()
      require('bufferline').setup {
        options = {
          mode = 'buffers',
          separator_style = 'thin',
          always_show_bufferline = true,
          show_buffer_close_icons = true,
          show_close_icon = false,
          diagnostics = 'nvim_lsp',
          diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local s = ' '
            for e, n in pairs(diagnostics_dict) do
              local sym = e == 'error' and '󰅚 ' or (e == 'warning' and '󰀪 ' or '󰋽 ')
              s = s .. sym .. n
            end
            return s
          end,
        },
      }

      -- Shift + H / L to cycle through buffers quickly
      vim.keymap.set('n', '<S-h>', '<cmd>BufferLineCyclePrev<cr>', { desc = 'Prev Buffer' })
      vim.keymap.set('n', '<S-l>', '<cmd>BufferLineCycleNext<cr>', { desc = 'Next Buffer' })
      -- Move buffers around
      vim.keymap.set('n', '<leader>bm', '<cmd>BufferLineMoveNext<cr>', { desc = 'Move Buffer Right' })
      vim.keymap.set('n', '<leader>bM', '<cmd>BufferLineMovePrev<cr>', { desc = 'Move Buffer Left' })
      -- Pin buffer
      vim.keymap.set('n', '<leader>bp', '<cmd>BufferLineTogglePin<cr>', { desc = 'Pin Buffer' })
      -- Close buffer safely (without closing window layout splits)
      vim.keymap.set('n', '<leader>bc', '<cmd>bp|bd #<cr>', { desc = 'Close Current Buffer' })
    end,
  },
}
