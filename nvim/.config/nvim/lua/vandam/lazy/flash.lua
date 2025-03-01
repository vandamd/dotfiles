return {
    "folke/flash.nvim",
    event = "VeryLazy",
    keys = {
        { "zk", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    },
}
