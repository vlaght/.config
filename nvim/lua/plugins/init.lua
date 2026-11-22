return {
    {
        "stevearc/conform.nvim",
        event = "BufWritePre", -- uncomment for format on save
        opts = require "configs.conform",
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "configs.lspconfig"
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            indent = { enable = true },
            ensure_installed = {
                "lua",
                "python",
                "typescript",
                "javascript",
                "go",
            },
        },
    },
    { "echasnovski/mini.nvim", branch = "stable" },
    {
        "kdheepak/lazygit.nvim",
        lazy = true,
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        -- setting the keybinding for LazyGit with 'keys' is recommended in
        -- order to load the plugin when the command is run for the first time
        keys = {
            { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
        },
    },
    { "akinsho/git-conflict.nvim", version = "*", config = true },
    {
        "mrjones2014/legendary.nvim",
        priority = 10000,
        lazy = false,
        dependencies = { "nvim-telescope/telescope-ui-select.nvim" },
        keys = {
            {
                "<leader>p",
                function()
                    require("configs.legendary").find()
                end,
                desc = "Command palette",
            },
        },
        config = function()
            require("legendary").setup {
                extensions = { lazy_nvim = true },
            }
            local telescope = require "telescope"
            telescope.setup {
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {},
                    },
                },
            }
            telescope.load_extension "ui-select"
        end,
    },
}
