vim.opt.termguicolors = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
{
	"ray-x/go.nvim",
	dependencies = {   
	  "ray-x/guihua.lua",
	  "neovim/nvim-lspconfig",
	  "nvim-treesitter/nvim-treesitter",},
	config = function()
	require("go").setup()
	end,
	event = {"CmdlineEnter"},
	ft = {"go", 'gomod'},
	build = ':lua require("go.install").update_all_sync()'
}, 
{
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
	"nvim-tree/nvim-web-devicons",
	},
	config = function()
	require("nvim-tree").setup {
		view = {
			side = "left",
			width = 30,
		}
	}
	end,
}, 
{
	"judaew/ronny.nvim",
	priority = 1000,
	config = function()
	    vim.cmd.colorscheme("ronny")
	    require("ronny").setup()
	end
}, 
{
	'unblevable/quick-scope',
},
{
	'stevearc/conform.nvim',
	opts = {},
} 
}, opts)
require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    -- Conform will run multiple formatters sequentially
    python = { "isort", "black" },
    -- Use a sub-list to run only the first available formatter
    javascript = { { "prettierd", "prettier" } },
  },
})

require("go").setup()

vim.wo.relativenumber = true
vim.wo.number = true
