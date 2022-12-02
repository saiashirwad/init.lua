local Remap = require("user.keymap")
local nnoremap = Remap.nnoremap
local MyTelescope = require("user.telescope")
local themes = require("telescope.themes")
local tb = require("telescope.builtin")

local keymap = vim.keymap.set
local opts = { silent = true }

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "n", "nzz", opts)

keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Close buffers
keymap("n", "<leader>bq", "<cmd>Bdelete!<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Insert --
-- Press jk fast to enter
-- keymap("i", "", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Plugins --

-- NvimTree
keymap("n", "<C-b>", ":NvimTreeToggle<CR>", opts)
keymap("n", "<leader>ef", ":NvimTreeFindFile<CR>", opts)

-- Git
keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

-- Trouble
keymap("n", "<leader>vi", ":edit $MYVIMRC<CR>", opts)

keymap("n", "<leader>xx", "<cmd>TroubleToggle<cr>", opts)
keymap("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", opts)
keymap("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", opts)
keymap("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", opts)
keymap("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", opts)
keymap("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", opts)

-- nnoremap("<leader>vff", function()
-- 	MyTelescope.search_vimrc()
-- end)

-- nnoremap("<leader>vrr", function()
-- 	MyTelescope.grep_vimrc()
-- end)

-- nnoremap("gr", function()
-- 	MyTelescope.references()
-- end)

vim.api.nvim_set_keymap("n", "<F2>", "<cmd>lua ReloadConfig()<CR>", { noremap = true, silent = false })

nnoremap("<leader>vff", function()
	MyTelescope.search_vimrc()
end)

nnoremap("<leader>vrr", function()
	MyTelescope.grep_vimrc()
end)

nnoremap("gr", function()
	MyTelescope.references()
end)

nnoremap("<leader>ff", function()
	MyTelescope.find_files()
end)


nnoremap("<leader>tr", function()
	tb.resume()
end)


nnoremap("<leader>tc", function()
	MyTelescope.switch_colorschemes()
end)

nnoremap("<leader>rr", function()
	tb.live_grep(themes.get_ivy())
end)

nnoremap("<leader>fp", ":Telescope projects<CR>")

nnoremap("<leader>bb", function()
	tb.buffers(themes.get_dropdown({
		previewer = false,
	}))
end)

nnoremap("<leader>hh", function()
	tb.help_tags(themes.get_dropdown({
		previewer = false,
	}))
end)
