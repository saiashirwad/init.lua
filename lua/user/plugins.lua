local fn = vim.fn

-- Automatically install packer
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

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
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
	-- use({
	-- 	"tamton-aquib/duck.nvim",
	-- 	config = function()
	-- 		vim.keymap.set("n", "<leader>dd", function()
	-- 			require("duck").hatch()
	-- 		end, {})
	-- 		vim.keymap.set("n", "<leader>dk", function()
	-- 			require("duck").cook()
	-- 		end, {})
	-- 	end,
	-- })
	use 'shaunsingh/nord.nvim'
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
	})
  use("neanias/everforest-nvim")
	use({
		"folke/noice.nvim",
		requires = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	})
  use { "ellisonleao/gruvbox.nvim" }
	-- use("morhetz/gruvbox")
	use("windwp/windline.nvim")
	use("theniceboy/nvim-deus")
	use("simrat39/rust-tools.nvim")
	use({ "tamton-aquib/keys.nvim" })
	use("B4mbus/oxocarbon-lua.nvim")
	use({ "nvim-telescope/telescope-ui-select.nvim" })
	use("jose-elias-alvarez/typescript.nvim")
	use("jbyuki/one-small-step-for-vimkind")
	use("AndrewRadev/bufferize.vim")
	use({ "smartpde/debuglog" })
	use("bfredl/nvim-luadev")
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
	use({ "phaazon/hop.nvim", branch = "v2" })
	use({'mg979/vim-visual-multi', {branch = 'master'}})
	use({ "kylechui/nvim-surround", tag = "*" })
	use("gelguy/wilder.nvim")
	use({ "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons" })
	use({ "zbirenbaum/copilot.lua" })
	use({ "zbirenbaum/copilot-cmp", after = { "copilot.lua" } })
	use("Mofiqul/vscode.nvim")
	use({ "wbthomason/packer.nvim" })
	use({ "nvim-lua/plenary.nvim" })
	use({ "windwp/nvim-autopairs" })
	use({ "numToStr/Comment.nvim" })
	use("pantharshit00/vim-prisma")
	use({ "JoosepAlviste/nvim-ts-context-commentstring" })
	use({ "kyazdani42/nvim-web-devicons" })
	use({ "kyazdani42/nvim-tree.lua" })
	use({ "akinsho/bufferline.nvim" })
	use({ "moll/vim-bbye" })
	use({ "nvim-lualine/lualine.nvim" })
	use({ "akinsho/toggleterm.nvim" })
	use({ "ahmedkhalf/project.nvim" })
	use({ "lewis6991/impatient.nvim" })
	use({ "lukas-reineke/indent-blankline.nvim" })
	use({ "goolord/alpha-nvim" })

	use({ "folke/tokyonight.nvim" })
	use({ "lunarvim/darkplus.nvim" })

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

	use({ "mfussenegger/nvim-dap" })
	use({ "rcarriga/nvim-dap-ui" })
	use({ "ravenxrz/DAPInstall.nvim" })
  use 'Mofiqul/dracula.nvim'
	use "lunarvim/templeos.nvim"
	use 'altercation/vim-colors-solarized'
	use 'overcache/NeoSolarized'
	use { "catppuccin/nvim", as = "catppuccin" }
	use "ggandor/lightspeed.nvim"
	use "tanvirtin/monokai.nvim"
	use	"RRethy/nvim-base16"
	use 'marko-cerovac/material.nvim'
	--#region
	--
	--overcache/NeoSolarized
	--
  --packages
	-- use("haringsrob/nvim_context_vt")
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
