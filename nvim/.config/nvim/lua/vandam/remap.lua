vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Oil)

local function get_visual_selection_text()
    local mode = vim.fn.mode()
    local start_pos = vim.fn.getpos("v")
    local end_pos = vim.fn.getpos(".")
    local srow, scol = start_pos[2], start_pos[3]
    local erow, ecol = end_pos[2], end_pos[3]

    if srow > erow or (srow == erow and scol > ecol) then
        srow, erow = erow, srow
        scol, ecol = ecol, scol
    end

    if mode == "V" then
        local lines = vim.api.nvim_buf_get_lines(0, srow - 1, erow, false)
        return table.concat(lines, "\n")
    end

    local lines = vim.api.nvim_buf_get_text(0, srow - 1, scol - 1, erow - 1, ecol, {})
    if #lines == 0 then
        return ""
    end

    return table.concat(lines, "\n")
end

local function extract_url(text)
    local markdown_url = text:match("%b[]%((https?://[^)%s]+)%)")
    if markdown_url then
        return markdown_url
    end

    local bare_url = text:match("https?://[%w%-%._~:/%?#%[%]@!$&'()*+,;=%%]+")
    if bare_url then
        return (bare_url:gsub("[%)%]%}%,%.%;%!%?]+$", ""))
    end

    local www_url = text:match("www%.[%w%-%._~:/%?#%[%]@!$&'()*+,;=%%]+")
    if www_url then
        return "https://" .. (www_url:gsub("[%)%]%}%,%.%;%!%?]+$", ""))
    end

    return nil
end

local function open_url(url)
    if vim.ui and vim.ui.open then
        local ok = pcall(vim.ui.open, url)
        if ok then
            return true
        end
    end

    local cmd
    if vim.fn.has("mac") == 1 then
        cmd = { "open", url }
    elseif vim.fn.has("win32") == 1 then
        cmd = { "cmd", "/c", "start", url }
    else
        cmd = { "xdg-open", url }
    end

    return vim.fn.jobstart(cmd, { detach = true }) > 0
end

vim.keymap.set("x", "<leader>a", function()
    local selection = get_visual_selection_text()
    local url = extract_url(selection)

    if not url then
        vim.notify("No URL found in selection", vim.log.levels.WARN)
        return
    end

    if not open_url(url) then
        vim.notify("Failed to open URL", vim.log.levels.ERROR)
        return
    end

    vim.notify("Opened URL", vim.log.levels.INFO)
end, { desc = "Open URL from visual selection" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>fo", vim.lsp.buf.format, { desc = "Format buffer" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show diagnostic" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
vim.keymap.set("n", "<leader>D", function()
    local diags = vim.diagnostic.get(0)
    if #diags == 0 then
        vim.notify("No diagnostics", vim.log.levels.INFO)
        return
    end
    local lines = {}
    for _, d in ipairs(diags) do
        table.insert(lines, string.format("L%d: [%s] %s", d.lnum + 1, d.source or "?", d.message))
    end
    local text = table.concat(lines, "\n")
    vim.fn.setreg("+", text)
    vim.notify(string.format("Copied %d diagnostics", #diags), vim.log.levels.INFO)
end, { desc = "Copy all diagnostics" })

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
