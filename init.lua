-- vim.cmd("language en_US")

require("vim._core.ui2").enable {
	enable = true,
}

require("config.lazy")
require("config.lsp")

require("config.remap")

