-- lua/plugins/diffview.lua
return {
  {
    'sindrets/diffview.nvim',
    cmd = { 'DiffviewOpen', 'DiffviewFileHistory' },
    keys = {
      { '<leader>gd', '<cmd>DiffviewOpen<cr>', desc = 'Git: Open Diffview' },
      { '<leader>gh', '<cmd>DiffviewFileHistory %<cr>', desc = 'Git: File History (Current File)' },
      { '<leader>gH', '<cmd>DiffviewFileHistory<cr>', desc = 'Git: Project Commit History' },
    },
    opts = {},
  },
}
