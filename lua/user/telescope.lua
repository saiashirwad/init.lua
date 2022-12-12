local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local actions = require("telescope.actions")
local themes = require("telescope.themes")
local tb = require("telescope.builtin")

local M = {}

M.search_vimrc = function()
	tb.find_files(themes.get_dropdown({
		prompt_title = "VIMVIMVIM",
		cwd = "~/.config/nvim/",
		previewer = false,
	}))
end

M.find_files = function()
	tb.find_files(({
		prompt_title = "where dat darned file at?",
	}))
end

M.switch_colorschemes = function()
	tb.colorscheme(themes.get_dropdown({
		enable_preview = true,
		previewer = false,
	}))
end

M.references = function()
	tb.lsp_references(themes.get_dropdown())
end

M.grep_vimrc = function()
	tb.live_grep({
		prompt_title = "VIMVIMVIM",
		cwd = "~/.config/nvim/",
	})
end

telescope.setup({
	pickers = {
		colorscheme = {
			enable_preview = true,
		},
	},
	defaults = {
		prompt_prefix = " ",
		selection_caret = " ",
		path_display = { "smart" },
		file_sorter = require("telescope.sorters").get_fzy_sorter,
		file_ignore_patterns = { ".git/", "node_modules" },
		mappings = {
			i = {
				["<Down>"] = actions.cycle_history_next,
				["<Up>"] = actions.cycle_history_prev,
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
			},
		},
	},
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_cursor({
				-- even more opts
			}),
			-- pseudo code / specification for writing custom displays, like the one
			-- for "codeactions"
			-- specific_opts = {
			--   [kind] = {
			--     make_indexed = function(items) -> indexed_items, width,
			--     make_displayer = function(widths) -> displayer
			--     make_display = function(displayer) -> function(e)
			--     make_ordinal = function(e) -> string
			--   },
			--   -- for example to disable the custom builtin "codeactions" display
			--      do the following
			--   codeactions = false,
			-- }
		},
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
		},
	},
})

telescope.load_extension("fzf")
telescope.load_extension("ui-select")

return M
