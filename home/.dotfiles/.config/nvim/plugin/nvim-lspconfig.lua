vim.pack.add({
	gh("neovim/nvim-lspconfig"),
	gh("williamboman/mason.nvim"),
	gh("williamboman/mason-lspconfig.nvim"),
	gh("WhoIsSethDaniel/mason-tool-installer.nvim"),
	gh("j-hui/fidget.nvim"),
	gh("folke/neodev.nvim"),
})

vim.lsp.config["lua_ls"] = {
	-- Command and arguments to start the server.
	cmd = { "lua-language-server" },
	-- Filetypes to automatically attach to.
	filetypes = { "lua" },
	-- Sets the "workspace" to the directory where any of these files is found.
	-- Files that share a root directory will reuse the LSP server connection.
	-- Nested lists indicate equal priority, see |vim.lsp.Config|.
	root_markers = { { ".luarc.json", ".luarc.jsonc" }, ".git" },
	-- Specific settings to send to the server. The schema is server-defined.
	-- Example: https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
		},
	},
}
vim.lsp.enable("lua_ls")
vim.lsp.enable("vtsls")

require("mason").setup({
	registries = {
		"github:mason-org/mason-registry",
		"github:Crashdummyy/mason-registry",
	},
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
	firewall = {
		enabled = true,
	},
})

require("mason-tool-installer").setup({
	ensure_installed = {
		"lua-language-server", -- lua
		"stylua", -- lua (formatter)
		"pyright", -- python
		"black", -- python (formatter)
		"css-lsp", -- css
		"html-lsp", -- html
		"vtsls", -- javascript/typescript
		"roslyn-language-server", -- C#
		"csharpier",
		"bash-language-server", -- bash
		"tree-sitter-cli",
	},
})
