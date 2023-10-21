if vim.g.vscode then
  return
end
-- Set , as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.
--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require('lazy').setup {
  -- NOTE: First, some plugins that don't require any configuration

  -- Git related plugins
  {
    -- Theme inspired by twitch colors
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set('n', '<leader>gg', ':vertical G<CR>', { desc = '[g]it Open Fu[g]itive Window' })
      vim.keymap.set('n', '<leader>gb', ':0G<CR>', { desc = '[g]it Open Fugitive Window in [b]uffer' })
    end,
  },
  'tpope/vim-rhubarb',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- NOTE: This is where your plugins related to LSP can be installed.
  --  The configuration is done below. Search for lspconfig to find it below.
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      {
        'j-hui/fidget.nvim',
        tag = 'legacy',
        opts = {},
      },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
  },

  -- Useful plugin to show you pending keybinds.
  {
    'folke/which-key.nvim',
    opts = {},
  },
  {
    -- Adds git releated signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { hl = 'GitSignsAdd', text = '·', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
        change = { hl = 'GitSignsChange', text = '·', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
        delete = { hl = 'GitSignsDelete', text = '_', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
        topdelete = { hl = 'GitSignsDelete', text = '‾', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
        changedelete = { hl = 'GitSignsChange', text = '·~', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
        untracked = { hl = 'GitSignsAdd', text = '│', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
      },
      on_attach = function(bufnr)
        vim.keymap.set('n', '[c', require('gitsigns').prev_hunk, { buffer = bufnr, desc = 'Go to Previous Hunk' })
        vim.keymap.set('n', ']c', require('gitsigns').next_hunk, { buffer = bufnr, desc = 'Go to Next Hunk' })
        vim.keymap.set('n', '<leader>ph', require('gitsigns').preview_hunk, { buffer = bufnr, desc = '[P]review [H]unk' })
        vim.keymap.set('n', '<leader>gv', require('gitsigns').select_hunk,
          { buffer = bufnr, desc = 'Git [V]isually select hunk' })
      end,
    },
  },

  {
    -- Theme inspired by twitch colors
    'usirin/bleed-purple.nvim',
    priority = 1000,
    branch = 'phoenix-occupative',
    dependencies = {
      'rktjmp/lush.nvim',
    },
    config = function()
      -- vim.cmd.colorscheme 'bleed-purple'
    end,
  },

  {
    'roobert/palette.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      local colors = require('phoenix.blurple.colors').palette

      local blurple = {
        main = {
          color0 = colors['plum.22'],
          color1 = colors['plum.20'],
          color2 = colors['plum.14'],
          color3 = colors['plum.12'],
          color4 = colors['plum.10'],
          color5 = colors['plum.8'],
          color6 = colors['plum.6'],
          color7 = colors['plum.4'],
          color8 = colors['plum.2'],
        },
        accent = {
          accent0 = '#707bf4',
          accent1 = '#7984f5',
          accent2 = '#949cf7',
          accent3 = '#9ba3f7',
          accent4 = '#a8aff8',
          accent5 = '#bcc1fa',
          accent6 = '#c9cdfb',
        },
        state = {
          error = '#f23f43',
          warning = '#f0b232',
          hint = '#828391',
          ok = '#248045',
          info = '#00aafc',
        },
      }

      require('palette').setup {
        palettes = {
          main = 'blurple',
          accent = 'blurple',
          state = 'blurple',
        },

        custom_palettes = {
          main = { blurple = blurple.main },
          accent = { blurple = blurple.accent },
          state = { blurple = blurple.state },
        },
      }

      vim.cmd [[colorscheme palette]]
      vim.cmd [[highlight ColorColumn guibg=#1c1d26]]
      -- vim.cmd [[highlight CursorLine guibg=#1c1d26]]
      vim.cmd [[highlight diffRemoved guifg=#f23f43]]
      vim.cmd [[highlight diffAdded guifg=#248045]]
      vim.cmd [[highlight Comment guifg=#414252]]
      vim.cmd [[highlight link gitcommitFirstLine Search]]
      vim.cmd [[highlight link gitcommitSummary gitcommitFirstLine]]
    end,
  },

  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help indent_blankline.txt`
    main = 'ibl',
    opts = {
      indent = { char = '┊' },
      scope = { show_start = false },
    },
  },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim',         opts = {} },

  -- Fuzzy Finder (files, lsp, etc)
  { 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } },

  -- Fuzzy Finder Algorithm which requires local dependencies to be built.
  -- Only load if `make` is available. Make sure you have the system
  -- requirements installed.
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    -- NOTE: If you are having trouble with this installation,
    --       refer to the README for telescope-fzf-native for more instructions.
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },

  { 'Marskey/telescope-sg' },

  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },

  -- NOTE: Next Step on Your Neovim Journey: Add/Configure additional "plugins" for kickstart
  --       These are some example plugins that I've included in the kickstart repository.
  --       Uncomment any of the lines below to enable them.
  require 'kickstart.plugins.autoformat',
  require 'kickstart.plugins.debug',

  -- NOTE: These are the plugins added by phoenix.nvim community.
  { import = 'phoenix.plugins' },

  -- NOTE: The import below automatically adds your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    You can use this folder to prevent any conflicts with this init.lua if you're interested in keeping
  --    up-to-date with whatever is in the kickstart repo.
  --
  --    For additional information see: https://github.com/folke/lazy.nvim#-structuring-your-plugins
  { import = 'custom.plugins' },
}

-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!

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

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- usirin configurations
vim.o.scrolloff = 5
vim.cmd 'set inccommand=split'
vim.cmd [[set list listchars=tab:\ \ ,trail:·,nbsp:·]]
vim.cmd [[set wildignore+=*/.git/*,*/.hg/*,*/.svn/*.,*/.DS_Store,*/node_modules/*]]

-- set working directory to current buffer's directory
vim.cmd [[autocmd BufEnter * silent! cd %:p:h]]

-- remove whitespace on save
vim.cmd [[autocmd BufWritePre * :%s/\s\+$//e]]

vim.o.splitright = true
vim.o.splitbelow = true

vim.wo.cursorline = true
vim.wo.signcolumn = 'yes'
vim.o.hidden = true

vim.o.incsearch = true
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

vim.cmd [[set expandtab]]
vim.bo.tabstop = 2
vim.bo.shiftwidth = 2
vim.cmd 'set ts=2'
vim.cmd 'set sw=2'
vim.o.shiftround = true
vim.cmd [[autocmd BufNewFile,BufReadPost *.js,*.ts,*.tsx setl colorcolumn=80,100,120]]

local map = function(mode, key, action, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  return vim.keymap.set(mode, key, action, options)
end

local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

local setup_keymaps = function()
  map('n', '<leader>ev', ':e ~/.config/nvim/init.lua<CR>')
  map('n', '<leader>ed', ':e ~/dotfiles/install.sh<CR>')

  map('i', 'jj', '<Esc>')
  map('t', 'jj', [[<C-\><C-n>]])

  map('n', '<leader><space>', ':nohlsearch<cr>')
  map('n', '<leader><leader>', '<C-^>')

  map('n', ';', ':')
  map('v', ';', ':')
  map('n', '<Enter>', 'o<Esc>')
  map('n', '<space>', 'i<space><C-c>l')

  -- Better split switching
  map('n', '<C-J>', '<C-W>j')
  map('n', '<C-K>', '<C-W>k')
  map('n', '<C-H>', '<C-W>h')
  map('n', '<C-L>', '<C-W>l')

  -- easy splits | for vertical _ for horizontal
  map('n', '<bar>', ':vsp<CR>')
  map('n', '_', [[Hmx``<C-w>szz<C-w><C-p>`x``<C-w><C-p>]])

  -- tabs
  map('n', 'tt', ':tabe %<cr>')
  map('n', '[t', ':tabprev<cr>')
  map('n', 't[', ':tabprev<cr>')
  map('n', ']t', ':tabnext<cr>')
  map('n', 't]', ':tabnext<cr>')
  map('n', '[T', ':tabfirst<cr>')
  map('n', ']T', ':tablast<cr>')

  map('n', ']f', ':cnext<cr>')
  map('n', '[f', ':cprev<cr>')

  -- Diagnostic keymaps
  map('n', '[q', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
  map('n', ']q', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
  map('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
  -- map('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
  -- map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

  -- quickfix things
  map('n', '<leader>qo', ':copen<cr>', { desc = '[q]uickfix: [o]pen' })
  map('n', '<leader>qc', ':cclose<cr>', { desc = '[q]uickfix: [c]lose' })
  map('n', '<leader>qn', ':cnext<cr>', { desc = '[q]uickfix: [n]ext' })
  map('n', '<leader>qp', ':cprev<cr>', { desc = '[q]uickfix: [p]revious' })
end
setup_keymaps()

local setup_autocmds = function()
  augroup('QuickfixKeybinds', { clear = true })
  autocmd('Filetype', {
    group = 'QuickfixKeybinds',
    pattern = 'qf',
    callback = function()
      -- map('n', '<cr>', ":.cc<cr>", { desc = "open file under cursor",  })
    end,
  })

  -- [[ Highlight on yank ]]
  -- See `:help vim.highlight.on_yank()`
  augroup('YankHighlight', { clear = true })
  autocmd('TextYankPost', {
    group = 'YankHighlight',
    pattern = '*',
    callback = function()
      vim.highlight.on_yank()
    end,
  })
end
setup_autocmds()

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
    path_display = {
      shorten = { len = 1, exclude = { -2, -1 } },
    },
    dynamic_preview_title = true,
  },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension 'ast_grep')

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>b', require('telescope.builtin').buffers, { desc = '[B] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', ':Telescope ast_grep<CR>', { desc = '[S]earch by AST [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<C-t>', require('telescope.builtin').git_files, { desc = 'Git files' })
vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = '[G]it [F]iles' })
vim.keymap.set('n', '<leader>gs', require('telescope.builtin').git_status, { desc = '[G]it [S]tatus' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = 'Telescope resume' })

-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
---@diagnostic disable-next-line: missing-fields
require('nvim-treesitter.configs').setup {
  -- Add languages to be installed here that you want installed for treesitter
  ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx', 'typescript', 'vimdoc', 'vim' },

  -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
  auto_install = false,

  highlight = { enable = true },
  indent = { enable = true, disable = { 'python' } },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<M-space>',
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['<leader>a'] = '@parameter.inner',
      },
      swap_previous = {
        ['<leader>A'] = '@parameter.inner',
      },
    },
  },
}

vim.filetype.add {
  extension = {
    mdx = 'markdown.mdx',
  },
}

-- [[ Configure LSP ]]
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>w', vim.lsp.buf.code_action, '[C]ode [A]ction')
  -- nmap('<leader>w', ':Lspsaga code_action<cr>', '[C]ode [A]ction')

  nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  -- nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  -- nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  -- nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
local servers = {
  -- gopls = {
  --   format = { enable = true },
  -- },
  -- graphql = {},
  tsserver = {},
  -- prismals = {},
  jsonls = {
    format = { enable = false },
  },
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
    }
  end,
}

-- require('lspconfig').relay_lsp.setup {
--   capabilities = capabilities,
--   on_attach = on_attach,
--   settings = {
--     auto_start_compiler = false,
--   },
-- }
-- configure relay_lsp manually since mason doesn't know about it

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
