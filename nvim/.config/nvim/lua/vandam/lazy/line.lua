return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('lualine').setup {
            options = {
                theme = "everforest",
                icons_enabled = false,
                component_separators = "",
                section_separators = "",
            },
            sections = {
                lualine_c = {
                    {
                        "harpoon2",
                        indicators = { "1", "2", "3", "4", "5", "6", "7", "8", "9", "0" },
                        active_indicators = { "[1]", "[2]", "[3]", "[4]", "[5]", "[6]", "[7]", "[8]", "[9]", "[0]" },
                    },
                },
                lualine_x = { 'filename' },
            },
        }
    end
}
