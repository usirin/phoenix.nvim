local M = {}

-- Helper function to check if value passed by parameter is a table
-- @obj {table}
-- @returns {boolean}
M.is_table = function(obj)
  return type(obj) == 'table'
end

-- Verify if table object works as an array
-- @param obj {table}
-- @return {boolean}
M.is_array = function(obj)
  if not M.is_table(obj) then
    return false
  end

  local i = 0
  for _ in pairs(obj) do
    i = i + 1
    if obj[i] == nil then
      return false
    end
  end

  return true
end

-- Checks wether value is nil
-- @obj {any}
-- @returns {boolean}
M.is_nil = function(value)
  return value == nil
end

-- Checks if parameter is an empty table
-- @param obj {table}
-- @return {boolean}
M.is_empty = function(obj)
  return M.is_array(obj) and #obj == 0
end

return M
