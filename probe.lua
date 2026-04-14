local M = {}

local active_clients = vim.lsp.get_clients({ bufnr = 0})

---@return vim.lsp.Client|nil
--- Get the first client who can rename
M.getClient = function ()
	for _, client in ipairs(active_clients) do
		if client:supports_method('textDocument/rename') then
			return client
		end
	end
	return nil
end

---@param new_name string
M.performRename = function (new_name, win_id)
	local client = M.getClient();

	if client ~= nil then
		local params = vim.lsp.util.make_position_params(win_id, client.offset_encoding)
		---@type lsp.RenameParams
		local opts = params
		opts.newName = new_name

		---@type lsp.Handler
		---Credits: https://github.com/smjonas/inc-rename.nvim/tree/main?tab=MIT-1-ov-file
		local basic_handler = function (err, result, _)
			if err and err.message then
				vim.notify("[my-plugin] Error while renaming: " .. err.message, vim.lsp.log_levels.ERROR)
				return
			end

			if not result or vim.tbl_isempty(result) then
				vim.notify("[my-plugin] Nothing renamed", vim.lsp.log_levels.WARN)
				return
			end

			vim.lsp.util.apply_workspace_edit(result, client.offset_encoding)
		end

		client:request("textDocument/rename", opts, basic_handler)
	end
end

vim.api.nvim_create_user_command("RENAME", function ()
	local new_name = vim.fn.prompt_setprompt(0, "Nem name: ")
	M.performRename(new_name, 0)
end, {})
