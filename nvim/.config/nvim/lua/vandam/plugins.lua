local M = {}

local function preload_vimtex()
    local biber_cache_dir = vim.fn.expand("~/.cache/biber-par")

    vim.fn.mkdir(biber_cache_dir, "p")
    vim.env.PAR_GLOBAL_TMPDIR = biber_cache_dir

    vim.g.tex_flavor = "latex"
    vim.g.vimtex_view_method = "skim"
    vim.g.vimtex_view_skim_sync = 1
    vim.g.vimtex_view_skim_activate = 1
    vim.g.vimtex_compiler_method = "latexmk"
    vim.g.vimtex_compiler_latexmk = {
        out_dir = ".build",
        aux_dir = ".build",
        callback = 1,
        continuous = 1,
        executable = "/usr/local/texlive/2026basic/bin/universal-darwin/latexmk",
        options = {
            "-pdf",
            "-shell-escape",
            "-synctex=1",
            "-interaction=nonstopmode",
        },
    }
    vim.g.vimtex_compiler_progname = "nvr"
    vim.g.vimtex_compiler_clean_on_close = 1
end

local function preload_fff()
    vim.g.fff = {
        lazy_sync = true,
    }
end

local function setup_theme()
    vim.opt.background = "dark"
    vim.cmd("colorscheme sakura")
end

local function setup_oil()
    require("mini.icons").setup()

    require("oil").setup({
        default_file_explorer = true,
        columns = {
            "icon",
        },
        buf_options = {
            buflisted = false,
            bufhidden = "hide",
        },
        win_options = {
            wrap = false,
            signcolumn = "no",
            cursorcolumn = false,
            foldcolumn = "0",
            spell = false,
            list = false,
            conceallevel = 3,
            concealcursor = "nvic",
        },
        delete_to_trash = false,
        skip_confirm_for_simple_edits = false,
        prompt_save_on_select_new_entry = true,
        cleanup_delay_ms = 2000,
        lsp_file_methods = {
            enabled = true,
            timeout_ms = 1000,
            autosave_changes = false,
        },
        constrain_cursor = "editable",
        watch_for_changes = false,
        keymaps = {
            ["g?"] = { "actions.show_help", mode = "n" },
            ["<CR>"] = "actions.select",
            ["<C-s>"] = { "actions.select", opts = { vertical = true } },
            ["<C-h>"] = { "actions.select", opts = { horizontal = true } },
            ["<C-t>"] = { "actions.select", opts = { tab = true } },
            ["<C-p>"] = "actions.preview",
            ["<C-c>"] = { "actions.close", mode = "n" },
            ["<C-l>"] = "actions.refresh",
            ["-"] = { "actions.parent", mode = "n" },
            ["_"] = { "actions.open_cwd", mode = "n" },
            ["`"] = { "actions.cd", mode = "n" },
            ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
            ["gs"] = { "actions.change_sort", mode = "n" },
            ["gx"] = "actions.open_external",
            ["g."] = { "actions.toggle_hidden", mode = "n" },
            ["g\\"] = { "actions.toggle_trash", mode = "n" },
        },
        use_default_keymaps = true,
        view_options = {
            show_hidden = true,
            is_hidden_file = function(name)
                return name:match("^%.") ~= nil
            end,
            is_always_hidden = function(name)
                return name == ".DS_Store"
            end,
            natural_order = "fast",
            case_insensitive = false,
            sort = {
                { "type", "asc" },
                { "name", "asc" },
            },
            highlight_filename = function()
                return nil
            end,
        },
        extra_scp_args = {},
        git = {
            add = function()
                return false
            end,
            mv = function()
                return false
            end,
            rm = function()
                return false
            end,
        },
        float = {
            padding = 2,
            max_width = 0,
            max_height = 0,
            border = "rounded",
            win_options = {
                winblend = 0,
            },
            get_win_title = nil,
            preview_split = "auto",
            override = function(conf)
                return conf
            end,
        },
        preview_win = {
            update_on_cursor_moved = true,
            preview_method = "fast_scratch",
            disable_preview = function()
                return false
            end,
            win_options = {},
        },
        confirmation = {
            max_width = 0.9,
            min_width = { 40, 0.4 },
            width = nil,
            max_height = 0.9,
            min_height = { 5, 0.1 },
            height = nil,
            border = "rounded",
            win_options = {
                winblend = 0,
            },
        },
        progress = {
            max_width = 0.9,
            min_width = { 40, 0.4 },
            width = nil,
            max_height = { 10, 0.9 },
            min_height = { 5, 0.1 },
            height = nil,
            border = "rounded",
            minimized_border = "none",
            win_options = {
                winblend = 0,
            },
        },
        ssh = {
            border = "rounded",
        },
        keymaps_help = {
            border = "rounded",
        },
    })
end

local function setup_comment()
    require("Comment").setup()
end

local function setup_surround()
    require("mini.surround").setup({
        mappings = {
            add = "sa",
            delete = "sd",
            find = "sf",
            find_left = "sF",
            highlight = "sh",
            replace = "sr",
            update_n_lines = "sn",
            suffix_last = "l",
            suffix_next = "n",
        },
    })
end

local function setup_treesitter()
    require("nvim-treesitter.configs").setup({
        ensure_installed = { "javascript", "c", "lua", "rust", "c_sharp", "python" },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
    })
end

local function setup_completion()
    require("blink.cmp").setup({
        keymap = { preset = "default" },
        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = "mono",
        },
        signature = { enabled = true },
    })
end

local function setup_tabout()
    require("tabout").setup({
        tabkey = "<Tab>",
        backwards_tabkey = "<S-Tab>",
        act_as_tab = true,
        act_as_shift_tab = false,
        default_tab = "<C-t>",
        default_shift_tab = "<C-d>",
        enable_backwards = true,
        completion = false,
        tabouts = {
            { open = "'", close = "'" },
            { open = '"', close = '"' },
            { open = "`", close = "`" },
            { open = "(", close = ")" },
            { open = "[", close = "]" },
            { open = "{", close = "}" },
        },
        ignore_beginning = true,
        exclude = {},
    })
end

local function setup_autopairs()
    require("nvim-autopairs").setup()
end

local function setup_trouble()
    require("trouble").setup({})

    vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
    vim.keymap.set("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer Diagnostics (Trouble)" })
    vim.keymap.set("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Symbols (Trouble)" })
    vim.keymap.set("n", "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", { desc = "LSP Definitions / references / ... (Trouble)" })
    vim.keymap.set("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List (Trouble)" })
    vim.keymap.set("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)" })
end

local function setup_flash()
    require("flash").setup()

    vim.keymap.set({ "n", "x", "o" }, "<leader>k", function()
        require("flash").jump()
    end, { desc = "Flash" })
end

local function setup_harpoon()
    local harpoon = require("harpoon")
    harpoon:setup()

    vim.keymap.set("n", "<leader>a", function()
        harpoon:list():add()
    end)
    vim.keymap.set("n", "<leader>e", function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
    end)

    vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
    vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
    vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
    vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)
    vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end)
    vim.keymap.set("n", "<leader>6", function() harpoon:list():select(6) end)
    vim.keymap.set("n", "<leader>7", function() harpoon:list():select(7) end)
    vim.keymap.set("n", "<leader>8", function() harpoon:list():select(8) end)
    vim.keymap.set("n", "<leader>9", function() harpoon:list():select(9) end)
    vim.keymap.set("n", "<leader>0", function() harpoon:list():select(10) end)

    vim.keymap.set("n", "<C-S-K>", function() harpoon:list():prev() end)
    vim.keymap.set("n", "<C-S-J>", function() harpoon:list():next() end)
end

local function setup_lualine()
    require("lualine").setup({
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
            lualine_x = { "filename" },
        },
    })
end

local function setup_fff()
    vim.keymap.set("n", "<leader>pf", function()
        require("fff").find_files()
    end, { desc = "Find files" })

    vim.keymap.set("n", "<C-p>", function()
        require("fff").find_files()
    end, { desc = "Find files" })

    vim.keymap.set("n", "<leader>pg", function()
        require("fff").live_grep()
    end, { desc = "Live grep" })

    vim.keymap.set("n", "<leader>ps", vim.lsp.buf.document_symbol, { desc = "Document symbols" })
end

local function setup_gitsigns()
    require("gitsigns").setup({
        signs = {
            add = { text = "▌" },
            change = { text = "▌" },
            delete = { text = "_" },
            topdelete = { text = "‾" },
            changedelete = { text = "~" },
            untracked = { text = "┆" },
        },
        numhl = true,
    })

    vim.api.nvim_set_hl(0, "GitSignsAddNr", { fg = "#7fb370", bg = "#2d3d2f", bold = true })
    vim.api.nvim_set_hl(0, "GitSignsChangeNr", { fg = "#7fa9c4", bg = "#2d3a3d", bold = true })
    vim.api.nvim_set_hl(0, "GitSignsDeleteNr", { fg = "#d78787", bg = "#3d2d2f", bold = true })
end

local function setup_lsp()
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
end

local function setup_lint()
    local lint = require("lint")

    lint.linters.vale = vim.tbl_deep_extend("force", lint.linters.vale, {
        args = {
            "--config=" .. vim.fn.expand("~/.config/vale/.vale.ini"),
            "--output=JSON",
            "--no-exit",
            "--ext",
            function()
                return "." .. vim.fn.expand("%:e")
            end,
        },
        stdin = true,
    })

    lint.linters_by_ft = {}

    vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "BufEnter" }, {
        callback = function()
            lint.try_lint()
        end,
    })
end

local function setup_zotcite()
    require("zotcite").setup({})
end

local function setup_undotree()
    vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
end

function M.preload()
    preload_vimtex()
    preload_fff()
end

function M.setup()
    setup_theme()
    setup_oil()
    setup_comment()
    setup_surround()
    setup_treesitter()
    setup_completion()
    setup_tabout()
    setup_autopairs()
    setup_trouble()
    setup_flash()
    setup_harpoon()
    setup_lualine()
    setup_fff()
    setup_gitsigns()
    setup_lsp()
    setup_lint()
    setup_zotcite()
    setup_undotree()
end

return M
