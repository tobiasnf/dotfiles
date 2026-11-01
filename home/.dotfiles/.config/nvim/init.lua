vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

function gh(x)
	return "https://github.com/" .. x
end

require("remap")
require("set")
