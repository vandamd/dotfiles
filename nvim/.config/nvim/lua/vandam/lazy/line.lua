return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        -- local function get_harpoon_indicator(harpoon_entry)
        --     return harpoon_entry.value
        -- end

        require('lualine').setup {
            options = {
                theme = "gruvbox_dark",
                icons_enabled = false,
                component_separators = "",
                section_separators = "",
            },
            sections = {
                lualine_c = {
                    {
                        "harpoon2",
                        indicators = { "1", "2", "3", "4", "5", "6", "7", "8" },
                        active_indicators = { "[1]", "[2]", "[3]", "[4]", "[5]", "[6]", "[7]", "[8]" },
                    },
                },
                lualine_x = { 'filename' },
            },
        }
    end
}
