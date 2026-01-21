return {
    "anAcc22/sakura.nvim",
    dependencies = {
        "xiyaowong/transparent.nvim",
        "rktjmp/lush.nvim"
    },

    config = function()
        vim.opt.background = "dark"
        vim.cmd("colorscheme sakura")
    end
}
