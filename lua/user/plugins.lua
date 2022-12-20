local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
	git = {
		clone_timeout = 300, -- Timeout, in seconds, for git clones
	},
})

return packer.startup(function(use)
	use("simrat39/rust-tools.nvim")
  use 'ionide/Ionide-vim'
	use({ "nvim-telescope/telescope-ui-select.nvim" })
	use("jose-elias-alvarez/typescript.nvim")
	use("AndrewRadev/bufferize.vim")
	use({ "smartpde/debuglog" })
	use("rose-pine/neovim")
	use("windwp/nvim-ts-autotag")
	use({
		"nmac427/guess-indent.nvim",
		config = function()
			require("guess-indent").setup({})
		end,
	})
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	})
  use ({ 'projekt0n/github-nvim-theme' })
	use({'mg979/vim-visual-multi', {branch = 'master'}})
	use({ "kylechui/nvim-surround", tag = "*" })
	use("gelguy/wilder.nvim")
	use({ "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons" })
	use({ "wbthomason/packer.nvim" })
	use({ "nvim-lua/plenary.nvim" })
	use({ "windwp/nvim-autopairs" })
	use({ "numToStr/Comment.nvim" })
	use("pantharshit00/vim-prisma")
	use({ "JoosepAlviste/nvim-ts-context-commentstring" })
	use({ "kyazdani42/nvim-web-devicons" })
	use({ "kyazdani42/nvim-tree.lua" })
	use({ "nvim-lualine/lualine.nvim" })
	use({ "akinsho/toggleterm.nvim" })
	use({ "ahmedkhalf/project.nvim" })
	use({ "lewis6991/impatient.nvim" })
	use({ "hrsh7th/nvim-cmp" })
	use({ "hrsh7th/cmp-buffer" })
	use({ "hrsh7th/cmp-path" })
	use({ "saadparwaiz1/cmp_luasnip" })
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-nvim-lua" })
	use({ "L3MON4D3/LuaSnip" })
	use({ "rafamadriz/friendly-snippets" })
	use({ "neovim/nvim-lspconfig" })
	use({ "williamboman/mason.nvim" })
	use({ "williamboman/mason-lspconfig.nvim" })
	use({ "jose-elias-alvarez/null-ls.nvim" })
	use({ "RRethy/vim-illuminate" })
	use({ "nvim-telescope/telescope.nvim" })
	use({ "nvim-treesitter/nvim-treesitter" })
	use({ "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" })
	use({ "lewis6991/gitsigns.nvim" })
  use("Soares/base16.nvim")
  use "NTBBloodbath/doom-one.nvim"
  use("kvrohit/rasmus.nvim")
  use("kdheepak/monochrome.nvim")
  use("Shatur/neovim-ayu")
  use("fenetikm/falcon")
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
