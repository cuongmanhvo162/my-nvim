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
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
	  require("telescope").setup({})
	end,
},
{
	"smartpde/telescope-recent-files",
	dependencies = { "nvim-telescope/telescope.nvim" },
	config = function()
	  require("telescope").load_extension("recent_files")
	end,
},
}, opts)

vim.wo.relativenumber = true
vim.wo.number = true
