return {
  'coder/claudecode.nvim',
  dependencies = { 'folke/snacks.nvim' },
  opts = {},
  keys = {
    { '<Leader>ac', '<cmd>ClaudeCode<cr>', desc = 'Toggle Claude' },
    { '<Leader>as', '<cmd>ClaudeCodeSend<cr>', mode = 'v', desc = 'Send selection to Claude' },
  }
}
