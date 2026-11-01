vim.pack.add({
	{ src = gh("nvim-mini/mini.icons"), version = "stable" },
	-- { src = gh("nvim-mini/mini.statusline"), version = "stable" },
	gh("stevearc/oil.nvim"),
})

require("mini.icons").setup()
-- require("mini.statusline").setup({ use_icons = vim.g.have_nerd_font })

local oil = require("oil")
oil.setup({
	default_file_explorer = true,
	delete_to_trash = true,
	skip_confirm_for_simple_edits = true,
	view_options = {
		show_hidden = true,
	},
	keymaps = {
		["<C-l>"] = false,
		["<C-h>"] = false,
		["<leader>sf"] = {
			-- function()
			-- 	require("telescope.builtin").find_files({
			-- 		cwd = oil.get_current_dir(),
			-- 	})
			-- end,
			mode = "n",
			nowait = true,
			desc = "Find files in the current directory",
		},
		["<C-p>"] = {
			callback = function()
				oil.open_preview({ vertical = true, split = "botright" }, function(err)
					if not err then
						vim.api.nvim_command("vertical resize 40")
					end
				end)
			end,
		},
	},
})

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
