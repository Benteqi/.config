return{
	"nvim-telescope/telescope.nvim",
	dependencies = {"nvim-lua/plenary.nvim"},
	config = function()
		require("telescope").setup({
		})
		-- Binds
		vim.keymap.set("n", "<Leader>ff", require("telescope.builtin").find_files)
		vim.keymap.set("n", "<Leader>fg", require("telescope.builtin").live_grep)
		vim.keymap.set("n", "<Leader>fb", require("telescope.builtin").buffers)
		vim.keymap.set("n", "<Leader>fh", require("telescope.builtin").help_tags)
	end,
}
