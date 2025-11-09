vim.g.mapleader = " "
vim.keymap.set("n", "<C-j>", "i<CR><Esc>")
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")
vim.keymap.set("n", "<Up>", "<Nop>")
vim.keymap.set("n", "<Down>", "<Nop>")
vim.keymap.set("n", "<Right>", "<Nop>")
vim.keymap.set("n", "<Left>", "<Nop>")

---[=[
function auto_comment()
	local syntax_normal = {
		html = {"<!--", "-->"},
		css = {"/*", "*/"},
		c = {"//"},
		cpp = {"//"},
		javascript = {"//"},
		lua = {"--"},
		python = {"#"},
	}
	local comment_syntax = syntax_normal
	--[[
	if mode == "normal" then 
		print("")
	elseif mode == "visual" then
		comment_syntax = syntax_visual
	else 
		print("Unknown mode")
		return "<Nop>"
	end
	--]]
	local keys = ""
	local line = vim.fn.getline('.')
	local comment = syntax_normal[vim.bo.filetype]
	if comment == nil then
		comment = {"", ""}
	end
	if (string.sub(line:gsub("^%s*(.-)%s*$", "%1"), 1, #(comment[1]) + 1)) == comment[1] .. " " and (comment[2] == nil or ((string.sub(line:gsub("^%s*(.-)%s*$", "%1"), #line - #(comment[1]), #line)) == " " .. comment[2])) then

		print("Entered uncomment!")
		keys = "^" .. string.rep("x", #(comment[1])+1)
		if(comment[2]) then
			keys = keys .. "$" .. string.rep("x", #(comment[2])+1)
		end
	else
		print("Entered comment!")
		keys = "^i" .. comment[1] .. " <ESC>"
		if(comment[2]) then
			keys = keys .. "$a " .. comment[2] .. "<ESC>"
		end
	end
	print(keys)
	return keys
end
vim.keymap.set("n", "<C-/>", auto_comment, { expr = true})
--]=]

