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
		sources = {
			default = { "lsp", "path", "buffer"},
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
		vim.lsp.config('lua_ls', {
			on_init = function(client)
				if client.workspace_folders then
					local path = client.workspace_folders[1].name
					if
						path ~= vim.fn.stdpath('config')
						and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
						then
							return
						end
					end

					client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
						runtime = {
							-- Tell the language server which version of Lua you're using (most
							-- likely LuaJIT in the case of Neovim)
							version = 'LuaJIT',
							-- Tell the language server how to find Lua modules same way as Neovim
							-- (see `:h lua-module-load`)
							path = {
								'lua/?.lua',
								'lua/?/init.lua',
							},
						},
						-- Make the server aware of Neovim runtime files
						workspace = {
							checkThirdParty = false,
							library = {
								vim.env.VIMRUNTIME
								-- Depending on the usage, you might want to add additional paths
								-- here.
								-- '${3rd}/luv/library'
								-- '${3rd}/busted/library'
							}
							-- Or pull in all of 'runtimepath'.
							-- NOTE: this is a lot slower and will cause issues when working on
							-- your own configuration.
							-- See https://github.com/neovim/nvim-lspconfig/issues/3189
							-- library = {
								--   vim.api.nvim_get_runtime_file('', true),
								-- }
							}
						})
					end,
					settings = {
						Lua = {}
					}
				})
		--]]
		---[[
		vim.lsp.config("clang", {
			filetypes={"c, cpp"},
			capabilities = capabilities,
		})
		--]]

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
		vim.lsp.config("tsserver", {
			cmd={"typescript-language-server", "--stdio"},
			filetypes={"javascript", "typescript"},
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
				vim.keymap.set("i", "{", "{}<Esc>i<CR><Esc>O", {buffer = true})
				end
		})

		vim.lsp.enable({"emmet_language_server", "cssls", "tsserver", "html", "lua_ls"})

	end,
	},
}
