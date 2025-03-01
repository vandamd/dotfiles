return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            'saghen/blink.cmp',
            {
                "folke/lazydev.nvim",
                opts = {
                    library = {
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            },
        },

        opts = {
            servers = {
                lua_ls = {},
                basedpyright = {},
                zls = {},
                ruff = {},
            }
        },
        config = function(_, opts)
            local lspconfig = require('lspconfig')
            for server, config in pairs(opts.servers) do
                config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
                lspconfig[server].setup(config)
            end

            vim.api.nvim_create_autocmd('LspAttach', {
                callback = function(args)
                    local c = vim.lsp.get_client_by_id(args.data.client_id)
                    if not c then return end

                    if vim.bo.filetype == "lua" then
                        vim.api.nvim_create_autocmd('BufWritePre', {
                            buffer = args.buf,
                            callback = function()
                                vim.lsp.buf.format({ bufnr = args.buf, id = c.id })
                            end,
                        })
                    elseif vim.bo.filetype == "python" then
                        vim.api.nvim_create_autocmd('BufWritePre', {
                            buffer = args.buf,
                            callback = function()
                                local ruff_client = vim.lsp.get_active_clients({ name = "ruff", bufnr = args.buf })[1]
                                if ruff_client then
                                    vim.lsp.buf.format({ bufnr = args.buf, name = "ruff" })
                                end
                            end,
                        })
                    end
                end,
            })
        end,
    }
}
