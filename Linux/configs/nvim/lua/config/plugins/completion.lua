return {
	{
	"saghen/blink.cmp",
	dependencies =  "rafamadriz/friendly-snippets",
	version = "1.*",
	---@module "blink.cmp"
	---@type blink.cmp.Config
	opts = {
		appearance = { nerd_font_variant = "mono" },
		completion = { documentation = {auto_show = true} },
		sources = { default = { "lsp", "path", "snippets", "buffer" },
},
fuzzy = { implementation = "prefer_rust_with_warning" },
	}
	},
	{
	"neovim/nvim-lspconfig",
	dependencies = "saghen/blink.cmp",
	config = function()
		vim.keymap.set("n", "gd", vim.lsp.buf.definition)
		vim.keymap.set("n", "K", vim.diagnostic.open_float)

		local capabilities = require("blink.cmp").get_lsp_capabilities()
		---[[
		vim.lsp.config("lua_ls", {
			filetypes={"lua"},
			capabilities = capabilities,
			settings = {
			Lua = {
			runtime = {
				version = 'LuaJIT'
			},
			diagnostics ={
				enable = true,
				globals = { "vim" }
			}
			}
			}
		})
		--]]
		---[[
		vim.lsp.config("clang", {
			filetypes={"c, cpp"},
			capabilities = capabilities,
		})
		--]]

--		local html_capabilites = capabilities
--		html_capabilities.textDocument.completion.completionItem.snippetSupport = false
		vim.lsp.config("html", {
			capabilities = capabilities,
			cmd={"vscode-html-language-server", "--stdio"},
			filetypes={"html"},
			init_options = {
				embeddedLanguages = {css = true, javascript = true},
				configurationSections = {'html', 'css', 'javascript'}
			}
		})
		vim.lsp.config("cssls", {
			filetypes={"css"},
			capabilities = capabilities,
			cmd={"vscode-css-language-server", "--stdio"},
		})
		vim.lsp.config("emmet_language_server", {
			filetypes={"html"},
			capabilities = capabilities,
		})

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
				pattern = "css",
				callback = function()
				vim.keymap.set("i", "{", "{}<Esc>i<CR><CR><Esc>ki<C-i>", {buffer = true})
				end
		})

		vim.lsp.enable({"emmet_language_server", "cssls", "html", "tsserver"})

	end,
	},
}
