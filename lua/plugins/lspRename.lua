local M = {}

M.PLUGIN_NAME = "float-rename"
M.GROUP       = vim.api.nvim_create_augroup(M.PLUGIN_NAME .. "-group", { clear = true})

---@param buf number|nil
---@return vim.lsp.Client|nil
--- Get the first client who can rename
M.getLSPClient = function (buf)
	local active_clients = vim.lsp.get_clients({ bufnr = buf or 0, method = "textDocument/rename" })
	if #active_clients >= 1 then
		return active_clients[1]
	else
		return nil
	end
end

---@param client vim.lsp.Client
---@param params lsp.TextDocumentPositionParams
M.performRename = function (client, params)
	if client == nil then
		vim.notify("[" ..M.PLUGIN_NAME .. "] No lsp client", vim.lsp.log_levels.WARN)
		return
	end

	---@type lsp.Handler
	---Credits: https://github.com/smjonas/inc-rename.nvim
	local basic_handler = function (err, result, _)
		if err and err.message then
			vim.notify("[" ..M.PLUGIN_NAME .. "] Error while renaming: " .. err.message, vim.lsp.log_levels.ERROR)
			return
		end

		if not result or vim.tbl_isempty(result) then
			vim.notify("[" ..M.PLUGIN_NAME .. "] Nothing renamed", vim.lsp.log_levels.WARN)
			return
		end

		vim.lsp.util.apply_workspace_edit(result, client.offset_encoding)
	end

	client:request("textDocument/rename", params, basic_handler)
end

---@param win number
---@param buf number
M.close = function (win, buf)
	vim.api.nvim_win_close(win, true)
	vim.api.nvim_buf_delete(buf, {force = true})
end

---@param float_win number
---@param ctx_win number
---@param float_buf number
---@param ctx_buf number
M.setupAutocmd = function (float_win, ctx_win, float_buf, ctx_buf)

	vim.api.nvim_create_autocmd("WinLeave", {
		buffer = float_buf,
		group = M.GROUP,
		callback = function ()
			M.close(float_win, float_buf)
		end
	})

	vim.api.nvim_create_autocmd("BufWriteCmd", {
		buffer = float_buf,
		group = M.GROUP,
		callback = function ()
			local client = M.getLSPClient(ctx_buf);
			if client == nil then
				vim.notify("[" ..M.PLUGIN_NAME .. "] No lsp client", vim.lsp.log_levels.WARN)
				return
			end

			local new_name = vim.api.nvim_buf_get_text(float_buf, 0, 0, -1, -1, {})
			local params   = vim.lsp.util.make_position_params(ctx_win, client.offset_encoding)

			---@type lsp.RenameParams
			local opts   = params
			opts.newName = vim.trim(new_name[1])

			M.performRename(client, opts)
			M.close(float_win, float_buf)
		end
	})

end

---@param float_buf number
M.setBufOptions = function (float_buf)
	vim.api.nvim_set_option_value("buftype",  "acwrite",  { buf = float_buf })
	vim.api.nvim_buf_set_name(float_buf, "renaming" .. math.random(1000000))
	vim.api.nvim_buf_set_keymap(float_buf, "n", "q", "<cmd>q<cr>", {})
end

---@return number, number
M.createFloatWinAndBuf = function ()
	local word = vim.fn.expand("<cword>");
	local MIN_SIZE = 20
	local floatwidth = math.max(#word + 2, MIN_SIZE)

	local params = vim.lsp.util.make_floating_popup_options(floatwidth, 2, {
		title = "renaming",
		border =  "single",
	})

	local float_buf = vim.api.nvim_create_buf(false, true)
	vim.api.nvim_buf_set_lines(float_buf, 0, 1, false, { word })
	M.setBufOptions(float_buf)

	local float_win = vim.api.nvim_open_win(float_buf, true, params)

	return float_buf, float_win
end

M.rename = function ()
	local ctx_win  = vim.api.nvim_get_current_win();
	local ctx_buf  = vim.api.nvim_get_current_buf();

	local float_buf, float_win = M.createFloatWinAndBuf()

	M.setupAutocmd(float_win, ctx_win, float_buf, ctx_buf)
end

vim.api.nvim_create_user_command("LspRename", M.rename, {})


return {}

