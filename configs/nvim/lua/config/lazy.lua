local lazypath = vim.fn.stdpath("data") .. "lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		lazypath
	})
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
	{ import = "config/plugins"}
})
vim.cmd.colorscheme("tokyonight") --This is here, so the custom plugin themes can stay in plugin confs
