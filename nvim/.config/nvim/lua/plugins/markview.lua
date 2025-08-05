return {
    "OXY2DEV/markview.nvim",
    lazy = true,
    config = function()
        local presets = require("markview.presets");

        require("markview").setup({
            markdown = {
                headings = presets.headings.slanted
            }
        });
    end,
}
