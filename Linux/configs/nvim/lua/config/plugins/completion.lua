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

		require("lspconfig").lua_ls.setup{
			capabilities = capabilities,
			settings = {
			Lua = {
			diagnostics ={
				enable = true,
				globals = { "vim" }
			}
			}
			}
		}
		require("lspconfig").clang.setup{
			capabilities = capabilities,
		}
	end,
	}
}
