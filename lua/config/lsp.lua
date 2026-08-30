return {
    "neovim/nvim-lspconfig",

    config = function()
        vim.lsp.enable({
            "lua_ls",
            "gopls",
            "jdtls",
            "pyright",
            "vtsls",
            "eslint",
            "html",
            "cssls",
            "yamlls",
            "dockerls",
        })
    end,
}
