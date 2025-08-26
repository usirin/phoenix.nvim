local function is_git_repo()
  return vim.fn.system 'git rev-parse --is-inside-work-tree' == 0
end

local function get_git_root()
  local dot_git_path = vim.fn.finddir('.git', '.;')
  return vim.fn.fnamemodify(dot_git_path, ':h')
end

return {
  is_git_repo = is_git_repo,
  get_git_root = get_git_root,
}
