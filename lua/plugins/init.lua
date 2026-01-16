vim.pack.add({ "https://github.com/zuqini/zpack.nvim" })

require("zpack").setup({
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({ flavour = "mocha" })
            vim.cmd.colorscheme("catppuccin")
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter").setup({})
            require("nvim-treesitter").install({ "lua", "vim", "vimdoc", "markdown", "markdown_inline" })
        end,
    },

    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("plugins.lsp")
        end,
    },
})
