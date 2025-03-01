return {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.6",

    dependencies = {
        "nvim-lua/plenary.nvim"
    },

    config = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>pg', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>ps', builtin.lsp_document_symbols, {})
        vim.keymap.set('n', '<leader>pc', builtin.colorscheme, {})

        require("telescope").setup({
            defaults = {
                layout_config = {
                    horizontal = {
                        preview_cutoff = 20,
                    },
                },
            },
        })
    end
}
