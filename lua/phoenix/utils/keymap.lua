---@param mode string    Mode short-name, see |nvim_set_keymap()|. Can also be list of modes to create mapping on multiple modes.
---@param lhs string           Left-hand side |{lhs}| of the mapping.
---@param rhs string|function  Right-hand side |{rhs}| of the mapping, can be a Lua function.
---@param opts table|nil Table of |:map-arguments|. Defaults to `{noremap = true, silent = true}`.
---@see |nvim_set_keymap()|
local keymap = function(mode, key, action, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, key, action, options)
end

return keymap
