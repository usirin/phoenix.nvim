local M = {}

M.group = vim.api.nvim_create_augroup -- Create/get autocommand group
M.cmd = vim.api.nvim_create_autocmd   -- Create autocommand

return M
