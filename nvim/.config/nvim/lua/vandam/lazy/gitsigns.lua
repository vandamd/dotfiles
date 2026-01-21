return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require('gitsigns').setup({
            signs = {
                add          = { text = '▌' },
                change       = { text = '▌' },
                delete       = { text = '_' },
                topdelete    = { text = '‾' },
                changedelete = { text = '~' },
                untracked    = { text = '┆' },
            },
            numhl = true,
        })

        -- Custom highlight groups with muted colors and backgrounds
        vim.api.nvim_set_hl(0, 'GitSignsAddNr', { fg = '#7fb370', bg = '#2d3d2f', bold = true })
        vim.api.nvim_set_hl(0, 'GitSignsChangeNr', { fg = '#7fa9c4', bg = '#2d3a3d', bold = true })
        vim.api.nvim_set_hl(0, 'GitSignsDeleteNr', { fg = '#d78787', bg = '#3d2d2f', bold = true })
    end
}
