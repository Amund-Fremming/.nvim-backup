-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Ikke pin til en tag: 0.1.5 kaller nvim-treesitter sitt gamle API som er
	-- borte i main-branchen, master bruker vim.treesitter direkte.
	use {
		'nvim-telescope/telescope.nvim', branch = 'master',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use { "rose-pine/neovim", as = "rose-pine" }

	use('nvim-treesitter/nvim-treesitter', {branch = 'main', run = ':TSUpdate'})
	
	use('theprimeagen/harpoon')

	use('mbbill/undotree')
	
	use('tpope/vim-fugitive')

	use {
		'VonHeikemen/lsp-zero.nvim',
		requires = {
			{'neovim/nvim-lspconfig'},
			{'williamboman/mason.nvim'},
			{'williamboman/mason.lspconfig.nvim'},

			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'saadparwaiz1/cmp_luasnip'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-nvim-lua'},

			{'L3MON4D3/LuaSnip'},
			{'rafamadriz/friendly-snippets'},
		}
	}

end)
