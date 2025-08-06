return {
    "echasnovski/mini.nvim",
    version = false,
    config = function()
        require('mini.move').setup({
            mappings = {
                -- visual mode
                left = '˙', -- alt-h on mac
                right = '¬', -- alt-l on mac
                down = '∆', -- alt-j on mac
                up = '˚', -- alt-k on mac

                -- normal mode
                line_left = '˙', -- alt-h on mac
                line_right = '¬', -- alt-l on mac
                line_down = '∆', -- alt-j on mac
                line_up = '˚', -- alt-k on mac
            }
        })
    end,
}
