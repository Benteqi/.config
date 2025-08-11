function ReloadTheme()
vim.cmd.colorscheme("tokyonight")
vim.api.nvim_set_hl(0, "TelescopePromptTitle", {bg = "none", fg = "#ff966c"})
vim.api.nvim_set_hl(0, "TelescopePromptBorder", {bg = "none", fg = "#ff966c"})
vim.api.nvim_set_hl(0, "TelescopeBorder", {bg = "none", fg = "#589ed7"})
vim.api.nvim_set_hl(0, "TelescopeNormal", {bg = "none"})
end
ReloadTheme()
