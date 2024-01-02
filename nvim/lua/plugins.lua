-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use 'github/copilot.vim'
	use 'ray-x/go.nvim'
	use({
		'navarasu/onedark.nvim',
		as = 'onedark',
		config = function()
			vim.g.onedark_termcolors = 16;
			vim.cmd('colorscheme onedark');
			local c = require('onedark.colors');

			vim.api.nvim_command(string.format("highlight NvimTreeNormal guifg=%s guibg=%s guisp=none gui=none",
				c.fg,
				c.bg1));
			vim.api.nvim_command(string.format("highlight NvimTreeEndOfBuffer guifg=%s guibg=%s guisp=none gui=none",
				c.fg,
				c.bg1));
		end
	});
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" });
	use("tpope/vim-fugitive");
	use("nvim-treesitter/nvim-treesitter-context");
	use("sbdchd/neoformat");
	use("editorconfig/editorconfig-vim");
	use("nvim-tree/nvim-tree.lua");
	use("nvim-lua/plenary.nvim");

	use {
		'nvim-telescope/telescope.nvim',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
	use("rust-lang/rust.vim");
	use("hrsh7th/cmp-cmdline");
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' },
			{ 'williamboman/mason.nvim' },
			{ 'williamboman/mason-lspconfig.nvim' },

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },
			{ 'hrsh7th/cmp-buffer' },
			{ 'hrsh7th/cmp-path' },
			{ 'saadparwaiz1/cmp_luasnip' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'hrsh7th/cmp-nvim-lua' },

			-- Snippets
			{ 'L3MON4D3/LuaSnip' },
			{ 'rafamadriz/friendly-snippets' },
		}
	}
end)
