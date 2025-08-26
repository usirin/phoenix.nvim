return {
  'dmtrKovalenko/fff.nvim',
  build = 'cargo build --release',
  -- or if you are using nixos
  -- build = "nix run .#release",
  opts = {
    max_threads = 8,
    keymaps = {
      close = { '<Esc>', '<C-c>' },
    },
  },
  keys = {
    {
      'ff', -- try it if you didn't it is a banger keybinding for a picker
      function()
        require('fff').find_in_git_root()
      end,
      desc = 'Open file picker',
    },
  },
}
