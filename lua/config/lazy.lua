-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
-- TODO: set this in a better place
vim.g.mapleader        = " "
vim.g.maplocalleader   = "\\"
vim.opt.number         = true;
vim.opt.relativenumber = true;
vim.opt.tabstop        = 4
vim.opt.shiftwidth     = 0;
vim.wo.signcolumn      = "yes:1"
vim.opt.smartcase      = true; -- switch to case sensitive search when typing a capital letter
vim.opt.shell 		   = "fish"

local space  = "·"
vim.opt.list = true
vim.opt.listchars:append {
	tab        = "→  ",
	multispace = space,
	lead       = space,
	trail      = space,
	nbsp       = space,
}

-- Setup lazy.nvim
local bootstrapLazy = function ()
	-- Bootstrap lazy.nvim
	local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
	if not (vim.uv or vim.loop).fs_stat(lazypath) then
		local lazyrepo = "https://github.com/folke/lazy.nvim.git"
		local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
		if vim.v.shell_error ~= 0 then
			vim.api.nvim_echo({
				{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
				{ out, "WarningMsg" },
				{ "\nPress any key to exit..." },
			}, true, {})
			vim.fn.getchar()
			os.exit(1)
		end
	end
	vim.opt.rtp:prepend(lazypath)
end
bootstrapLazy()
require("lazy").setup({
	spec = {
		-- import your plugins
		{ import = "plugins" },
	},
	checker = { enabled = true },
})
