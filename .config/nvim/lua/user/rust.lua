local rt = require("rust-tools")

local on_attach = require("user.lsp.handlers").on_attach
local capabilities = require("user.lsp.handlers").capabilities

rt.setup({
	server = {
		capabilities = capabilities,
		on_attach = on_attach,
	},
})
