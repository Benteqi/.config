vim.g.mapleader = " "
vim.keymap.set("n", "<C-j>", "i<CR><Esc>")
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")
vim.keymap.set("n", "<Up>", "<Nop>")
vim.keymap.set("n", "<Down>", "<Nop>")
vim.keymap.set("n", "<Right>", "<Nop>")
vim.keymap.set("n", "<Left>", "<Nop>")

---[=[
local function auto_comment()
	local keys = ""
	local syntax_normal = {
		html = {"<!--", "-->"},
		css = {"/*", "*/"},
		c = {"//"},
		cpp = {"//"},
		javascript = {"//"},
		lua = {"--"},
		python = {"#"},
	}
	local syntax_visual = {
		html = {"<!--", "-->"},
		css = {"/*", "*/"},
		c = {"/*", "*/"},
		cpp = {"/*", "*/"},
		javascript = {"/*", "*/"},
		lua = {"--[[", "--]]"},
	}
	if vim.fn.mode() == "n" then 
		local line = vim.fn.getline('.')
		if syntax_normal[vim.bo.filetype] == nil then
			print("Unsupported filetype!")
			return ""
		end
		local comment = syntax_normal[vim.bo.filetype]
		if (string.sub(line:gsub("^%s*(.-)%s*$", "%1"), 1, #(comment[1]) + 1)) == comment[1] .. " " and (comment[2] == nil or ((string.sub(line:gsub("^%s*(.-)%s*$", "%1"), #line - #(comment[1]), #line)) == " " .. comment[2])) then
			keys = "^" .. string.rep("x", #(comment[1])+1)
			if(comment[2]) then
				keys = keys .. "$" .. string.rep("x", #(comment[2])+1)
			end
		else
			keys = "^i" .. comment[1] .. " <ESC>"
			if(comment[2]) then
				keys = keys .. "$a " .. comment[2] .. "<ESC>"
			end
		end
	elseif vim.fn.mode() == "v" or vim.fn.mode() == "V" then
		if syntax_visual[vim.bo.filetype] == nil then
			print("Unsupported filetype!")
			return ""
		end
		local start = vim.fn.getline(vim.fn.line("'<") - 1)
		local finish = vim.fn.getline(vim.fn.line("'>") + 1)
		local comment = syntax_visual[vim.bo.filetype]
		if (start:gsub("%s", "") == comment[1] and (comment[2] == nil or finish:gsub("%s", "") == comment[2])) then
			keys = "<ESC>\'<kdd" 
			if(comment[2]) then
				keys = keys .. "\'>jdd"
			end
		else
			keys = "<ESC>\'<O" .. comment[1] .. " <ESC>"
			if(comment[2]) then
				keys = keys .. "\'>o" .. comment[2] .. "<ESC>"
			end
		end
	else 
		print("Unknown mode:", vim.fn.mode())
		return ""
	end
	print("Keys returned!")
	print(keys)
	return keys
end

vim.keymap.set("x", "<C-/>", auto_comment, { expr = true})
--]=]

