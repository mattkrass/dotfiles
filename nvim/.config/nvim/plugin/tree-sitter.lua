require("nvim-treesitter").install({
	"bash",
	"comment",
	"diff",
	"git_config",
	"git_rebase",
	"gitcommit",
	"gitignore",
	"html",
	"javascript",
	"json",
	"latex",
	"lua",
	"luadoc",
	"make",
	"markdown",
	"markdown_inline",
	"python",
	"query",
	"regex",
	"toml",
	"tsx",
	"typescript",
	"vim",
	"vimdoc",
	"xml",
}, {
	max_jobs = 8,
})

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
