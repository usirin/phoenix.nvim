local auto = require 'phoenix.utils.auto'

local M = {}

---@param is_vscode boolean
M.setup = function(is_vscode)
  -- Make line numbers default
  vim.wo.number = true

  -- do not wrap lines to the next line
  vim.wo.wrap = false

  -- Enable mouse mode
  vim.o.mouse = 'a'

  -- Enable break indent
  vim.o.breakindent = true

  -- no swap file
  vim.opt.swapfile = false

  -- Case insensitive searching UNLESS /C or capital in search
  vim.o.incsearch = true
  vim.o.hlsearch = true
  vim.o.ignorecase = true
  vim.o.smartcase = true

  -- Keep signcolumn on by default
  vim.wo.signcolumn = 'yes'

  -- Decrease update time
  vim.o.updatetime = 250
  vim.o.timeout = true
  vim.o.timeoutlen = 300

  -- Set completeopt to have a better completion experience
  vim.o.completeopt = 'menuone,noselect'

  -- NOTE: You should make sure your terminal supports this
  vim.o.termguicolors = true

  -- [[ Basic Keymaps ]]

  -- Keymaps for better default experience
  -- See `:help vim.keymap.set()`
  -- vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

  -- usirin configurations
  vim.o.scrolloff = 5
  vim.cmd 'set inccommand=split'
  vim.cmd [[set list listchars=tab:\ \ ,trail:·,nbsp:·]]
  vim.cmd [[set wildignore+=*/.git/*,*/.hg/*,*/.svn/*.,*/.DS_Store,*/node_modules/*]]

  -- set working directory to current buffer's directory
  -- vim.cmd [[autocmd BufEnter * silent! cd %:p:h]]

  -- remove whitespace on save
  vim.cmd [[autocmd BufWritePre * :%s/\s\+$//e]]
  -- set working directory to current buffer's directory
  vim.cmd [[autocmd BufEnter * silent! cd %:p:h]]

  vim.o.splitright = true
  vim.o.splitbelow = true

  vim.wo.cursorline = true
  vim.wo.signcolumn = 'yes'
  vim.o.hidden = true

  vim.o.incsearch = true
  vim.o.hlsearch = true
  vim.o.ignorecase = true
  vim.o.smartcase = true

  vim.o.showmode = false

  vim.cmd [[set expandtab]]
  vim.bo.tabstop = 2
  vim.bo.shiftwidth = 2
  vim.cmd 'set ts=2'
  vim.cmd 'set sw=2'
  vim.o.shiftround = true
  vim.cmd [[autocmd BufNewFile,BufReadPost *.js,*.ts,*.tsx setl colorcolumn=80,100,120]]
  vim.o.foldmethod = 'indent'
  vim.o.foldlevelstart = 99 -- start unfolded
  vim.o.foldminlines = 1

  vim.filetype.add {
    extension = {
      mdx = 'markdown.mdx',
    },
  }

  if is_vscode then
    return
  end

  auto.group('QuickfixKeybinds', { clear = true })
  auto.cmd('Filetype', {
    group = 'QuickfixKeybinds',
    pattern = 'qf',
    callback = function()
      -- map('n', '<cr>', ":.cc<cr>", { desc = "open file under cursor",  })
    end,
  })

  -- [[ Highlight on yank ]]
  -- See `:help vim.highlight.on_yank()`
  auto.group('YankHighlight', { clear = true })
  auto.cmd('TextYankPost', {
    group = 'YankHighlight',
    pattern = '*',
    callback = function()
      vim.highlight.on_yank()
    end,
  })
end

return M
