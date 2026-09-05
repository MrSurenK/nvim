-- ~/.config/nvim/lua/plugins/masonlsp.lua
return {
    -- 1. MASON: Correct repository
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        },
    },

    -- 2. MASON-LSPCONFIG: Still uses the mason-org repository (this is correct)
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim", -- UPDATED dependency
            "neovim/nvim-lspconfig",
        },
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
            },
            automatic_installation = true,
        },
        config = function(_, opts)
            require("mason-lspconfig").setup(opts)
        end,
    },

    -- 3. nvim-cmp (unchanged)
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "L3MON4D3/LuaSnip",
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }),
                sources = {
                    { name = "nvim_lsp" },
                    { name = "buffer" },
                    { name = "path" },
                },
            })
        end,
    },

    -- 4. LuaSnip
    {
        "L3MON4D3/LuaSnip",
        build = "make install_jsregexp",
        config = function()
            require("luasnip").config.setup({})
        end,
    },
}
