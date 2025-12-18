-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = { enabled = true },
      bufdelete = { enabled = true },
      gitbrowse = { enabled = true },
      lazygit = { enabled = true },
      scroll = {
        animate = {
          duration = { step = 5, total = 100 },
          easing = 'linear',
        },
        -- faster animation when repeating scroll after delay
        animate_repeat = {
          delay = 100, -- delay in ms before using the repeat animation
          duration = { step = 5, total = 50 },
          easing = 'linear',
        },
        -- what buffers to animate
        filter = function(buf)
          return vim.g.snacks_scroll ~= false and vim.b[buf].snacks_scroll ~= false and vim.bo[buf].buftype ~= 'terminal'
        end,
      },
      terminal = { enabled = true },
    },
    keys = {
      {
        '<leader>hB',
        function()
          require('snacks').gitbrowse()
        end,
        desc = 'git [B]rowse',
        mode = { 'n', 'v' },
      },
      {
        '<leader>hh',
        function()
          require('snacks').lazygit()
        end,
        desc = 'lazygit',
      },
      {
        '<leader>hg',
        function()
          require('snacks').terminal { 'gitui' }
        end,
        desc = 'lazygit',
      },
    },
  },
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
    'folke/flash.nvim',
    event = 'VeryLazy',
    opts = {
      modes = {
        -- options used when flash is activated through
        -- a regular search with `/` or `?`
        search = {
          -- when `true`, flash will be activated during regular search by default.
          -- You can always toggle when searching with `require("flash").toggle()`
          enabled = true,
        },
      },
    },
    keys = {
      -- {
      --   's',
      --   mode = { 'n', 'x', 'o' },
      --   function()
      --     require('flash').jump()
      --   end,
      --   desc = 'Flash',
      --   remap = true,
      -- },
      {
        'S',
        mode = { 'n', 'x', 'o' },
        function()
          require('flash').treesitter()
        end,
        desc = 'Flash Treesitter',
        remap = true,
      },
      -- {
      --   'r',
      --   mode = 'o',
      --   function()
      --     require('flash').remote()
      --   end,
      --   desc = 'Remote Flash',
      -- },
      -- {
      --   'R',
      --   mode = { 'o', 'x' },
      --   function()
      --     require('flash').treesitter_search()
      --   end,
      --   desc = 'Treesitter Search',
      -- },
      {
        '<c-s>',
        mode = { 'c' },
        function()
          require('flash').toggle()
        end,
        desc = 'Toggle Flash Search',
      },
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
    version = '^7',
    lazy = false, -- This plugin is already lazy
  },
  {
    'salkin-mada/openscad.nvim',
    config = function()
      vim.g.openscad_load_snippets = true
      require 'openscad'
    end,
    dependencies = { 'L3MON4D3/LuaSnip', 'junegunn/fzf.vim' },
  },
}
