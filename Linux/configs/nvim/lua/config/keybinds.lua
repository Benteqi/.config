vim.g.mapleader = " "
vim.keymap.set("n", "<C-j>", "i<CR><Esc>")
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")
vim.keymap.set("n", "<Up>", "<Nop>")
vim.keymap.set("n", "<Down>", "<Nop>")
vim.keymap.set("n", "<Right>", "<Nop>")
vim.keymap.set("n", "<Left>", "<Nop>")
local function is_in_style_tag()
	-- table.unpack = table.unpack or unpack -- Lua 5.1 compatibility, does not work
	local row, _ = unpack(vim.api.nvim_win_get_cursor(0))-- using the deprecated unpack() instead of table.unpack
	local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

	local before, after = 0, 0
	for i = 1, row do
		if lines[i]:find("<style[^>]*>") then
			before = i
		end
		if lines[i]:find("</style>") then
			after = i
			break
		end
	end
	return before > 0 and (after == 0 or row <= after)
end

local function smart_curly_brace()
	if is_in_style_tag() then
		return "{}<Esc>i<CR><CR><Esc>ki<C-i>"
	else
		return "{"
	end
end

vim.api.nvim_create_autocmd("FileType", {
	pattern = "html",
	callback = function()
		vim.keymap.set("i", "{", smart_curly_brace, { expr = true, buffer = true })
	end,
})
vim.api.nvim_create_autocmd("FileType",{
	pattern = {"css", "hyprlang"},
	callback = function()
		vim.keymap.set("i", "{", "{}<Esc>i<CR><Esc>O", {buffer = true})
	end
})
