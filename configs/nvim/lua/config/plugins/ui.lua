return {
	{
		"folke/tokyonight.nvim",
		priority = 20,
		lazy = false,
		config = function ()
			require("tokyonight").setup({
				transparent = true
			})
		end
	}
}
