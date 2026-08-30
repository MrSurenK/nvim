return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
	require("nvim-treesitter").setup()
	require("nvim-treesitter").install({
		-- Backend
		"java",
		"go",
		"gomod",
		"python",

		-- Frontend / React
		"javascript",
		"jsx",
		"typescript",
		"tsx",
		"html",
		"css",

		-- Config / data
		"json",
		"yaml",
		"properties",

		-- Documentation
		"markdown",
		"markdown_inline",

		-- Neovim
		"lua",
		"vim",
		"vimdoc",
		"query",
 	})
    end,
}
