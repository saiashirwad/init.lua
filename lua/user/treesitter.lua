local configs = require("nvim-treesitter.configs")

configs.setup({
	ensure_installed = { "lua", "markdown", "markdown_inline", "bash", "python", "typescript", "tsx" },
	ignore_install = { "" },
	sync_install = false,
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<CR>",
			node_incremental = "<CR>",
			scope_incremental = "<TAB>",
			node_decremental = "<C-CR>",
		},
	},
	highlight = {
		enable = true,
	},
	autopairs = {
		enable = true,
	},
	autotag = {
		enable = true,
	},
	context_commentstring = {
		enable = true,
    disable = { "help"}
	},
})

