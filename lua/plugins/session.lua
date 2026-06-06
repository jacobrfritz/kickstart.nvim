-- lua/plugins/session.lua
return {
  {
    'folke/persistence.nvim',
    event = 'BufReadPre',
    opts = {},
    keys = {
      -- Load session for current directory
      { '<leader>qs', function() require('persistence').load() end, desc = 'Restore Session' },
      -- Load last session
      { '<leader>ql', function() require('persistence').load { last = true } end, desc = 'Restore Last Session' },
      -- Stop persistence (don't save on exit)
      { '<leader>qd', function() require('persistence').stop() end, desc = "Don't Save Session on Exit" },
    },
  },
}
