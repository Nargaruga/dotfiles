-- Plugins

-- Install the lazy.nvim package manager
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

-- Plugins to install
local plugins = {
    -- Fuzzy finder
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.2',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    -- Parsing
    'nvim-treesitter/nvim-treesitter',

    -- LSP Zero
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        }
    },

    -- LSP progress indicator
    {
        "j-hui/fidget.nvim",
        tag = "legacy",
        event = "LspAttach",
        opts = {}
    },

    -- Container developement
    'jamestthompson3/nvim-remote-containers',

    -- Better undo
    'mbbill/undotree',

    -- Autoclose parentheses
    'm4xshen/autoclose.nvim',

    -- Autoclose tags
    'windwp/nvim-ts-autotag',

    -- Comment toggle
    'numToStr/Comment.nvim',

    -- Status line
    'nvim-lualine/lualine.nvim',

    -- File tree
    'nvim-tree/nvim-tree.lua',

    -- Icons
    'nvim-tree/nvim-web-devicons',

    -- Syntax highlighting for Rofi configuration files
    'Fymyte/rasi.vim',

    -- Tokyo Night colorscheme
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {}
    }
}


-- Additional options
local opts = {}

-- Configure lazy.nvim
require("lazy").setup(plugins, opts)
