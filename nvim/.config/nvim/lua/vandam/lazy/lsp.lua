return {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup()

        vim.lsp.config("vale_ls", {
            cmd = { vim.fn.expand("~/.local/share/nvim/mason/bin/vale-ls") },
            filetypes = { "tex", "markdown", "text" },
            root_markers = { ".vale.ini" },
            init_options = {
                configPath = vim.fn.expand("~/.config/vale/.vale.ini"),
            },
        })
        vim.lsp.enable("vale_ls")
    end,
}
