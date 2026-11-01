vim.pack.add({
	gh("nvim-treesitter/nvim-treesitter"),
})

local treesitter = require("nvim-treesitter")

treesitter.setup({
	-- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
	install_dir = vim.fn.stdpath("data") .. "/site",
	indent = { enable = true },
})

treesitter.install({
	"bash",
	"c",
	"diff",
	"html",
	"lua",
	"luadoc",
	"markdown",
	"vim",
	"vimdoc",
})
