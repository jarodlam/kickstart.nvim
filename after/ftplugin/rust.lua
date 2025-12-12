-- local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set('n', '<leader>a', function()
  vim.cmd.RustLsp 'codeAction' -- supports rust-analyzer's grouping
  -- or vim.lsp.buf.codeAction() if you don't want grouping.
end, { silent = true, buffer = true, desc = 'rustaceanvim: Code [a]ctions' })
vim.keymap.set('n', 'K', function()
  vim.cmd.RustLsp { 'hover', 'actions' }
end, { silent = true, buffer = true, desc = 'rustaceanvim: Hover actions' })
vim.keymap.set('n', '<leader>x', function()
  vim.cmd.RustLsp { 'explainError', 'cycle' }
end, { silent = true, buffer = true, desc = 'rustaceanvim: E[x]plain errors' })
vim.keymap.set('n', '<leader>d', function()
  vim.cmd.RustLsp { 'renderDiagnostic', 'cycle' }
end, { silent = true, buffer = true, desc = 'rustaceanvim: Render [d]iagnostics' })
vim.keymap.set('n', '<leader>m', function()
  vim.cmd.RustLsp { 'expandMacro'}
end, { silent = true, buffer = true, desc = 'rustaceanvim: Expand [m]acros' })
