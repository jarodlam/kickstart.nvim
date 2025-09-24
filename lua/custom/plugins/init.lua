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
        lualine_b = { { 'filename', path = 1 }, 'branch', 'diff', 'diagnostics' },
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
    'akinsho/bufferline.nvim',
    event = 'VeryLazy',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    keys = {
      { '<leader>bp', '<Cmd>BufferLineTogglePin<CR>', desc = 'Bufferline: Toggle [p]in' },
      { '<leader>bP', '<Cmd>BufferLineGroupClose ungrouped<CR>', desc = 'Bufferline: Delete non-[P]inned buffers' },
      { '<leader>br', '<Cmd>BufferLineCloseRight<CR>', desc = 'Bufferline: Delete buffers to the [r]ight' },
      { '<leader>bl', '<Cmd>BufferLineCloseLeft<CR>', desc = 'Bufferline: Delete buffers to the [l]eft' },
      { '<S-h>', '<cmd>BufferLineCyclePrev<cr>', desc = 'Bufferline: Prev buffer' },
      { '<S-l>', '<cmd>BufferLineCycleNext<cr>', desc = 'Bufferline: Next buffer' },
      { '[b', '<cmd>BufferLineCyclePrev<cr>', desc = 'Bufferline: Prev buffer' },
      { ']b', '<cmd>BufferLineCycleNext<cr>', desc = 'Bufferline: Next buffer' },
      { '[B', '<cmd>BufferLineMovePrev<cr>', desc = 'Bufferline: Move buffer prev' },
      { ']B', '<cmd>BufferLineMoveNext<cr>', desc = 'Bufferline: Move buffer next' },
    },
    opts = {
      highlights = require('catppuccin.groups.integrations.bufferline').get_theme(),
      options = {
        separator_style = 'thick',
      },
    },
    config = function(_, opts)
      require('bufferline').setup(opts)
    end,
  },
  {
    'dstein64/nvim-scrollview',
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
        desc = 'mini.files: Open [e]xplorer (current directory)',
      },
      {
        '<leader>E',
        function()
          require('mini.files').open(vim.uv.cwd(), true)
        end,
        desc = 'mini.files: Open [E]xplorer (working directory)',
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
        '<leader>ps',
        function()
          require('persistence').load()
        end,
        desc = 'Persistence: Load [s]ession for current directory',
      },
      {
        '<leader>pS',
        function()
          require('persistence').select()
        end,
        desc = 'Persistence: [S]elect a session to load',
      },
      {
        '<leader>pl',
        function()
          require('persistence').load { last = true }
        end,
        desc = 'Persistence: Load the [l]ast session',
      },
      {
        '<leader>pd',
        function()
          require('persistence').stop()
        end,
        desc = "Persistence: Stop, session won't be saved on exit",
      },
    },
  },
  {
    'mrcjkb/rustaceanvim',
    version = '^6', -- Recommended
    lazy = false, -- This plugin is already lazy
  },
}
