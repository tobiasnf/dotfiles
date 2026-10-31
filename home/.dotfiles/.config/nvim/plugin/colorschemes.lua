vim.pack.add({
	-- gh("/ellisonleao/gruvbox.nvim"),
	gh("folke/tokyonight.nvim"),
})

-- Colorschemes: tokyonight-night tokyonight-storm tokyonight-day tokyonight-moon
require("tokyonight")

-- Colorschemes: gruvbox
-- require("gruvbox").setup({
-- 	terminal_colors = true, -- add neovim terminal colors
-- 	undercurl = false,
-- 	underline = false,
-- 	bold = true,
-- 	italic = {
-- 		strings = true,
-- 		emphasis = true,
-- 		comments = true,
-- 		operators = false,
-- 		folds = true,
-- 	},
-- 	strikethrough = true,
-- 	invert_selection = false,
-- 	invert_signs = false,
-- 	invert_tabline = false,
-- 	inverse = true, -- invert background for search, diffs, statuslines and errors
-- 	contrast = "", -- can be "hard", "soft" or empty string
-- 	palette_overrides = {},
-- 	overrides = {},
-- 	dim_inactive = false,
-- 	transparent_mode = false,
-- })

vim.cmd("colorscheme tokyonight-night")
