---@param mode string|string[]    Mode short-name, see |nvim_set_keymap()|. Can also be list of modes to create mapping on multiple modes.
---@param key string           Left-hand side |{lhs}| of the mapping.
---@param action string|function  Right-hand side |{rhs}| of the mapping, can be a Lua function.
---@param opts? vim.keymap.set.Opts
---
---@see vim.keymap.set()
local keymap = function(mode, key, action, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.keymap.set(mode, key, action, options)
end

return keymap
