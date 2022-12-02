local tsHandlers = {
	["textDocument/definition"] = function(_, result, params)
		local util = require("vim.lsp.util")

		if result == nil or vim.tbl_isempty(result) then
			return nil
		end

		if vim.tbl_islist(result) then
			if #result > 1 then
				for key, value in pairs(result) do
					if string.match(value.targetUri, "react/index.d.ts") then
						table.remove(result, key)
					end
				end
			end
		end

		util.jump_to_location(result[1], "utf-8", true)
	end,
}

local on_attach = require("user.lsp.handlers").on_attach
local capabilities = require("user.lsp.handlers").capabilities

require("typescript").setup({
	disable_commands = false, -- prevent the plugin from creating Vim commands
	debug = false,
	go_to_source_definition = {
		fallback = true,
	},
	server = {
		on_attach = on_attach,
		capabilities = capabilities,
		handlers = tsHandlers,
	},
})
