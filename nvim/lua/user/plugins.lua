local fn = vim.fn

-- Automatically install lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Install your plugins here
require("lazy").setup({
  -- My plugins here
  "nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
  "nvim-lua/plenary.nvim", -- Useful lua functions used in lots of plugins
  "windwp/nvim-autopairs", -- Autopairs, integrates with both cmp and treesitter
  {
    "numToStr/Comment.nvim", -- Easily comment stuff
    version = "*"
  },
  "kyazdani42/nvim-web-devicons",
  {
    "kyazdani42/nvim-tree.lua",
    lazy = true
  },
  "akinsho/bufferline.nvim", -- Show buffers as tabs
  "moll/vim-bbye",
  "nvim-lualine/lualine.nvim", -- A basic status line
  {
    "akinsho/toggleterm.nvim",
    lazy = true
  },
  "ahmedkhalf/project.nvim",
  "lewis6991/impatient.nvim",
  "lukas-reineke/indent-blankline.nvim",
  "goolord/alpha-nvim",
  "antoinemadec/FixCursorHold.nvim", -- This is needed to fix lsp doc highlight
  "folke/which-key.nvim",
  "petertriho/nvim-scrollbar", -- A scrollbar for neovim
  "liuchengxu/vista.vim", -- LSP symbols view

  -- Smooth scrolling for C-f and C-b
  "psliwka/vim-smoothie",

  -- Colrschemes
  "navarasu/onedark.nvim", -- Very nice colorscheme
  'marko-cerovac/material.nvim', -- Provides darker, lighter, oceanic, palenight, deep ocean
  -- use "lunarvim/colorschemes" -- A bunch of neat colorschemes, includes the next two
  -- use "https://github.com/morhetz/gruvbox.git"
  -- use "lunarvim/darkplus.nvim"  -- Another cool theme
  -- use "lunarvim/onedarker.nvim" -- Default theme of Lunar vim

  -- cmp plugins
  "hrsh7th/nvim-cmp", -- The completion plugin
  "hrsh7th/cmp-buffer", -- buffer completions
  "hrsh7th/cmp-path", -- path completions
  "hrsh7th/cmp-cmdline", -- cmdline completions
  "saadparwaiz1/cmp_luasnip", -- snippet completions
  "hrsh7th/cmp-nvim-lsp",

  -- markdown previewer
  -- use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}

  -- snippets
  "L3MON4D3/LuaSnip", --snippet engine
  "rafamadriz/friendly-snippets", -- a bunch of snippets to use

  -- LSP
  "neovim/nvim-lspconfig", -- enable LSP
  "williamboman/nvim-lsp-installer", -- simple to use language server installer
  "tamago324/nlsp-settings.nvim", -- language server settings defined in json for
  "jose-elias-alvarez/null-ls.nvim", -- for formatters and linters

  -- Telescope
  "nvim-telescope/telescope.nvim",
  -- FZF for telescope
  { 
    "nvim-telescope/telescope-fzf-native.nvim", 
    build = "make" 
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
  "JoosepAlviste/nvim-ts-context-commentstring",

  -- Git
  "lewis6991/gitsigns.nvim",
})
