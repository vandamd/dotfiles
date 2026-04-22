local gh = function(repo)
    return "https://github.com/" .. repo
end

local plugins = require("vandam.plugins")
local pack_group = vim.api.nvim_create_augroup("vandam-pack", { clear = true })

vim.api.nvim_create_autocmd("PackChanged", {
    group = pack_group,
    callback = function(ev)
        local spec = ev.data.spec
        if ev.data.kind ~= "install" and ev.data.kind ~= "update" then
            return
        end

        if spec.name == "nvim-treesitter" then
            if not ev.data.active then
                vim.cmd.packadd("nvim-treesitter")
            end

            vim.cmd("TSUpdate")
            return
        end

        if spec.name ~= "fff.nvim" then
            return
        end

        if not ev.data.active then
            vim.cmd.packadd("fff.nvim")
        end

        require("fff.download").download_or_build_binary()
    end,
})

plugins.preload()

vim.pack.add({
    gh("anAcc22/sakura.nvim"),
    gh("xiyaowong/transparent.nvim"),
    gh("rktjmp/lush.nvim"),
    gh("stevearc/oil.nvim"),
    gh("echasnovski/mini.icons"),
    gh("numToStr/Comment.nvim"),
    gh("echasnovski/mini.surround"),
    { src = gh("nvim-treesitter/nvim-treesitter"), version = "master" },
    gh("L3MON4D3/LuaSnip"),
    gh("hrsh7th/nvim-cmp"),
    gh("abecodes/tabout.nvim"),
    { src = gh("saghen/blink.cmp"), version = vim.version.range("1.x") },
    gh("rafamadriz/friendly-snippets"),
    gh("windwp/nvim-autopairs"),
    gh("folke/flash.nvim"),
    gh("folke/trouble.nvim"),
    gh("nvim-lua/plenary.nvim"),
    { src = gh("ThePrimeagen/harpoon"), version = "harpoon2" },
    gh("letieu/harpoon-lualine"),
    gh("nvim-tree/nvim-web-devicons"),
    gh("nvim-lualine/lualine.nvim"),
    gh("dmtrKovalenko/fff.nvim"),
    gh("lewis6991/gitsigns.nvim"),
    gh("mason-org/mason.nvim"),
    gh("mason-org/mason-lspconfig.nvim"),
    gh("neovim/nvim-lspconfig"),
    gh("mfussenegger/nvim-lint"),
    gh("lervag/vimtex"),
    gh("jalvesaq/zotcite"),
    { src = gh("github/copilot.vim"), version = "release" },
    gh("mbbill/undotree"),
}, {
    confirm = false,
    load = true,
})

plugins.setup()
