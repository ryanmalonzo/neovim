local M = {}

local function format_relative(loc, args)
	local filepath = nil
	if type(loc) == "number" then
		if vim.api.nvim_get_option_value("buftype", { buf = loc }) ~= "" then
			return nil
		end
		filepath = vim.api.nvim_buf_get_name(loc)
	elseif type(loc) == "string" and loc ~= "" then
		filepath = loc
	end

	if not filepath or filepath == "" then
		return nil
	end

	local relative_path = vim.fn.fnamemodify(filepath, ":p:.")
	local result = "@" .. relative_path

	if args and args.start_line then
		if args.end_line and args.start_line > args.end_line then
			args.start_line, args.end_line = args.end_line, args.start_line
			if args.start_col and args.end_col then
				args.start_col, args.end_col = args.end_col, args.start_col
			end
		end

		result = result .. ":"
		result = result .. string.format("L%d", args.start_line)
		if args.start_col then
			result = result .. string.format(":C%d", args.start_col)
		end
		if args.end_line then
			result = result .. string.format("-L%d", args.end_line)
			if args.end_col then
				result = result .. string.format(":C%d", args.end_col)
			end
		end
	end

	return result
end

function M.setup()
	vim.g.opencode_opts = {
		events = {
			reload = true,
		},
		contexts = {
			["@this"] = function(context)
				if context.range then
					return format_relative(context.buf, {
						start_line = context.range.from[1],
						start_col = (context.range.kind ~= "line") and context.range.from[2] or nil,
						end_line = context.range.to[1],
						end_col = (context.range.kind ~= "line") and context.range.to[2] or nil,
					})
				end

				return format_relative(context.buf, {
					start_line = context.cursor[1],
					start_col = context.cursor[2] + 1,
				})
			end,
			["@buffer"] = function(context)
				return format_relative(context.buf)
			end,
		},
	}

	vim.o.autoread = true
end

return M
