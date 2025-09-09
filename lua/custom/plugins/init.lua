-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        theme = 'catppuccin',
        component_separators = '',
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = { { 'mode', separator = { left = '', right = '' }, right_padding = 2 } },
        lualine_b = { 'filename', 'branch', 'diff', 'diagnostics' },
        lualine_c = {
          '%=', --[[ add your center components here in place of this comment ]]
        },
        lualine_x = {},
        lualine_y = { 'lsp_status', 'filetype', 'progress' },
        lualine_z = {
          { 'location', separator = { left = '', right = '' }, left_padding = 0 },
        },
      },
      inactive_sections = {
        lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' },
      },
      tabline = {},
      extensions = {},
    },
  },
  {
    'echasnovski/mini.files',
    opts = {
      windows = {
        preview = true,
        width_focus = 50,
        width_preview = 30,
      },
      options = {
        -- Whether to use for editing directories
        use_as_default_explorer = true,
      },
    },
    keys = {
      {
        '<leader>e',
        function()
          require('mini.files').open(vim.api.nvim_buf_get_name(0), true)
        end,
        desc = 'Open mini.files [e]xplorer (current directory)',
      },
      {
        '<leader>E',
        function()
          require('mini.files').open(vim.uv.cwd(), true)
        end,
        desc = 'Open mini.files [E]xplorer (working directory)',
      },
    },
  },
  {
    'christoomey/vim-tmux-navigator',
    cmd = {
      'TmuxNavigateLeft',
      'TmuxNavigateDown',
      'TmuxNavigateUp',
      'TmuxNavigateRight',
      'TmuxNavigatePrevious',
      'TmuxNavigatorProcessList',
    },
    keys = {
      { '<c-h>', '<cmd><C-U>TmuxNavigateLeft<cr>' },
      { '<c-j>', '<cmd><C-U>TmuxNavigateDown<cr>' },
      { '<c-k>', '<cmd><C-U>TmuxNavigateUp<cr>' },
      { '<c-l>', '<cmd><C-U>TmuxNavigateRight<cr>' },
      { '<c-\\>', '<cmd><C-U>TmuxNavigatePrevious<cr>' },
    },
  },
  {
    'folke/persistence.nvim',
    event = 'BufReadPre', -- this will only start session saving when an actual file was opened
    opts = {
      -- add any custom options here
    },
    keys = {
      {
        '<leader>qs',
        function()
          require('persistence').load()
        end,
        desc = 'Load [s]ession for current directory',
      },
      {
        '<leader>qS',
        function()
          require('persistence').select()
        end,
        desc = '[S]elect a session to load',
      },
      {
        '<leader>ql',
        function()
          require('persistence').load { last = true }
        end,
        desc = 'Load the [l]ast session',
      },
      {
        '<leader>qd',
        function()
          require('persistence').stop()
        end,
        desc = "Stop persistence, session won't be saved on exit",
      },
    },
  },
}
