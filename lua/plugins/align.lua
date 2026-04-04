return {
	dir = "./.", -- inline plugin
	config = function ()
		local function alignLinesLeft(alignchar, lines)
			local index_of_align_char = {};
			local max_index = 0
			for k, line in ipairs(lines) do
				local index = string.find(line, alignchar)
				if index ~= nil then
					max_index = math.max(index, max_index)
				else
					index = 0;
				end
				table.insert(index_of_align_char, index)
			end

			if (max_index == 0) then return end -- safety

			local aligned_lines = {}
			for k, line in ipairs(lines) do
				local align_index = index_of_align_char[k]
				local newline     = line
				if align_index ~= 0  then
					newline     = line:sub(1, align_index - 1) .. (" "):rep(max_index - align_index, '') .. line:sub(align_index)
				end
				aligned_lines[#aligned_lines+1] = newline;
			end
			return aligned_lines
		end

		vim.api.nvim_create_user_command('AlignBy', function (args)
			if args.args == nil then
				return
			end
			local buf_lines     = vim.api.nvim_buf_get_lines(0, args.line1 - 1, args.line2, true)
			local aligned_lines = alignLinesLeft(args.args, buf_lines)
			if aligned_lines ~= nil then
				vim.api.nvim_buf_set_lines(0, args.line1 - 1, args.line2, true, aligned_lines)
			end
		end, { range = true, nargs = '?'})
	end
}
