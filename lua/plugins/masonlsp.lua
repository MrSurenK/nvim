return {
    {
	"mason-org/mason-lspconfig.nvim",
	opts = { 
	    ensure_installed = {
		"lua_ls",
		"gopls",
		"pyright",
		"vtsls",
		"eslint",
		"html",
		"cssls",
		"dockerls",
		"yamlls",

	    }
	},
	dependencies = {
	    { "mason-org/mason.nvim",opts = {} },
	    "neovim/nvim-lspconfig",
	},
    },
}
