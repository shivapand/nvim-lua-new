return {
  'coder/claudecode.nvim',
  dependencies = { 'folke/snacks.nvim' },
  config = function()
    require('claudecode').setup({
      track_selection = false,
      terminal = {
        provider = 'snacks',
        snacks_win_opts = {
          position = 'float',
          width = 120,
          height = 30,
          border = 'rounded',
        },
      },
    })
    -- Deregister tools that open files/diffs in the editor
    local tools = require('claudecode.tools')
    tools.tools['openFile'] = nil
    tools.tools['openDiff'] = nil
  end,
  keys = {
    { '<Leader>ac', '<cmd>ClaudeCode<cr>', desc = 'Toggle Claude' },
    {
      '<Leader>af',
      function()
        local ok, provider = pcall(require, 'claudecode.terminal.snacks')
        if not ok then return end
        local term = provider._get_terminal_for_test()
        if not term or not term:valid() then return end

        if term.opts.width == 0 then
          term.opts.width = 120
          term.opts.height = 30
        else
          term.opts.width = 0
          term.opts.height = 0
        end
        term:update()
      end,
      desc = 'Toggle Claude fullscreen',
    },
  },
}
