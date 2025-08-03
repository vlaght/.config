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
        "linux-cultist/venv-selector.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
            "mfussenegger/nvim-dap",
            "mfussenegger/nvim-dap-python", --optional
            {
                "nvim-telescope/telescope.nvim",
                branch = "0.1.x",
                dependencies = { "nvim-lua/plenary.nvim" },
            },
        },
        lazy = false,
        branch = "regexp", -- This is the regexp branch, use this for the new version
        keys = {
            { ",v", "<cmd>VenvSelect<cr>" },
        },
        ---@type venv-selector.Config
        opts = {
            search = {
                anaconda_base = {
                    command = "fd '/python$' $CONDA_PREFIX/bin --full-path --color never",
                    type = "anaconda",
                },
                anaconda_envs = {
                    command = "fd 'bin/python$' $CONDA_PREFIX/envs --full-path --color never",
                    type = "anaconda",
                },
            },
            search_on_this_version = true,
            -- Your settings go here
        },
    },
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
}
