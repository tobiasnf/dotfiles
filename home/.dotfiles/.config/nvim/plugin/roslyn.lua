vim.pack.add({
	gh("seblyng/roslyn.nvim"),
})

vim.env.ROSLYN_LANGUAGE_SERVER_DAEMON_KEEPALIVE = "1800" -- 30 minutes

require("roslyn").setup()

vim.lsp.config("roslyn", {
    on_attach = function()
        print("This will run when the server attaches!")
    end,
    settings = {
        ["csharp|inlay_hints"] = {
            csharp_enable_inlay_hints_for_implicit_object_creation = true,
            csharp_enable_inlay_hints_for_implicit_variable_types = true,
        },
        ["csharp|code_lens"] = {
            dotnet_enable_references_code_lens = true,
        },
    },
})
