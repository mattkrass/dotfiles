return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        vim.api.nvim_create_autocmd("FileType", {
          callback = function(ev)
            if pcall(vim.treesitter.start) then
              -- if you want ts folds...
              if vim.treesitter.query.get(ev.match, "folds") then
                vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
                vim.wo[0][0].foldmethod = "expr"
              end
            end
          end,
        })
    end,
}
