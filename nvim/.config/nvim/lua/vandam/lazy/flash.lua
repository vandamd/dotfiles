return {
    "folke/flash.nvim",
    event = "VeryLazy",
    keys = {
        { "<leader>k", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    },
}
