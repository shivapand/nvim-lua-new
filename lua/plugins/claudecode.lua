return {
  'coder/claudecode.nvim',
  dependencies = { 'folke/snacks.nvim' },
  opts = {
    terminal = {
      provider = 'snacks',
      snacks_win_opts = {
        position = 'float',
        width = 120,
        height = 30,
        border = 'rounded',
      },
    },
  },
  keys = {
    { '<Leader>ac', '<cmd>ClaudeCode<cr>', desc = 'Toggle Claude' },
    { '<Leader>as', '<cmd>ClaudeCodeSend<cr>', mode = 'v', desc = 'Send selection to Claude' },
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
