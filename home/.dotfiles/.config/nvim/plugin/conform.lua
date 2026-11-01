vim.pack.add({
	gh("stevearc/conform.nvim"),
})

local conform = require("conform")

conform.setup({
	format_on_save = nil,
	-- Map of filetype to formatters
	formatters_by_ft = {
		jsx = { "prettier" },
		tsx = { "prettier" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		javascriptreact = { "prettier" },
		typescriptreact = { "prettier" },
		json = { "prettier" },
		css = { "prettier" },
		html = { "prettier" },
		markdown = { "prettier" },
		yaml = { "prettier" },

		cs = { "csharpier" },
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		go = { "goimports", "gofmt" },
		-- You can also customize some of the format options for the filetype
		rust = { "rustfmt", lsp_format = "fallback" },
		-- You can use a function here to determine the formatters dynamically
		python = function(bufnr)
			if conform.get_formatter_info("ruff_format", bufnr).available then
				return { "ruff_format" }
			else
				return { "isort", "black" }
			end
		end,

		-- Use the "*" filetype to run formatters on all filetypes.
		["*"] = { "codespell" },
		-- Use the "_" filetype to run formatters on filetypes that don't
		-- have other formatters configured.
		["_"] = { "trim_whitespace" },
	},
	-- Set this to change the default values when calling conform.format()
	-- This will also affect the default values for format_on_save/format_after_save
	-- default_format_opts = {
	-- 	lsp_format = "fallback",
	-- },
	formatters = {
		stylua = {
			prepend_args = { "--column-width", "120" },
		},
		black = {
			prepend_args = { "--line-length", "120" },
		},
		-- prettier = {
		-- 	prepend_args = { "--print-width", "120" },
		-- 	-- for markdown prose wrapping, also add: "--prose-wrap", "always"
		-- },
	},
})

vim.keymap.set("n", "<leader>f", function()
	conform.format({ async = true, lsp_fallback = true })
end, { desc = "[F]ormat buffer" })
-- vim.o.formatexpr = "v:lua.require'conform'.format_expr()"
