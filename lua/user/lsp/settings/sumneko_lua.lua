local util = require("vim.lsp.util")

return {
	handlers = {
		---@diagnostic disable-next-line: unused-local
		["textDocument/definition"] = function(_, result, params)
			if result == nil or vim.tbl_isempty(result) then
				return nil
			end

			util.jump_to_location(result[1], "utf-8", true)
		end,
	},
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
			telemetry = {
				enable = false,
			},
		},
	},
}
