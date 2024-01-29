--- Plugin configuration ---

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})

-- Treesitter
local configs = require("nvim-treesitter.configs")
configs.setup({
    ensure_installed = {
        "c",
        "cpp",
        "python",
        "ocaml",
        "rust",
        "java",
        "go",
        "lua",
        "javascript",
        "typescript",
        "css",
        "html",
        "dockerfile"
    },
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },
})

-- LSP-zero
local lsp = require("lsp-zero").preset({})
lsp.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp.default_keymaps({ buffer = bufnr })
end)
lsp.setup()

local cmp = require("cmp")
cmp.setup({
    mapping = cmp.mapping.preset.insert {
        ["<tab>"] = cmp.mapping.select_next_item(),
        ["<S-tab>"] = cmp.mapping.select_prev_item(),
        ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
    }
})

local lspconfig = require("lspconfig").lua_ls.setup {
    settings = {
        Lua = {
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
        },
    },
}

require("aerial").setup({
    -- optionally use on_attach to set keymaps when aerial has attached to a buffer
    on_attach = function(bufnr)
        -- Jump forwards/backwards with '{' and '}'
        vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
        vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
    end,
})
-- You probably also want to set a keymap to toggle aerial
vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")

-- Autoclose
require("autoclose").setup()

-- Comment
require("Comment").setup()

-- Lualine
require("lualine").setup()

-- Nvim-tree
require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {
        width = 30,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = false,
    },
    actions = {
        open_file = {
            quit_on_open = true,
        },
    },
})

-- Nvim web-devicons
require("nvim-web-devicons").setup()

-- Autotags
require 'nvim-treesitter.configs'.setup {
    autotag = {
        enable = true,
    }
}
