-- Daily note automation
-- local daily_note_group = vim.api.nvim_create_augroup("DailyNote", { clear = true })

local function get_previous_daily_file()
	local today = os.date("*t") --[[@as osdate]]
	local day_of_week = today.wday

	-- Calculate days to subtract (1 for Mon-Sat, 3 for Monday)
	local days_back = (day_of_week == 2) and 3 or 1

	-- Calculate previous day timestamp
	local prev_time = os.time(today) - (days_back * 24 * 60 * 60)
	local prev_date = os.date("*t", prev_time) --[[@as osdate]]
	local prev_filename = string.format("%02d%02d.md", prev_date.month, prev_date.day)

	return vim.fn.expand("~") .. "/Documents/daily/" .. prev_filename
end

local function migrate_todos()
	local prev_file = get_previous_daily_file()

	-- Check if previous file exists
	if vim.fn.filereadable(prev_file) == 0 then
		return
	end

	-- Read previous file
	local prev_lines = vim.fn.readfile(prev_file)
	local todos_to_migrate = {}
	local modified_prev_lines = {}

	-- Find TODO [ ] lines and prepare migration
	for _, line in ipairs(prev_lines) do
		if line:match("^TODO %[ %]") then
			-- Extract migration counter or start at 1
			local counter = line:match("{M(%d+)}")
			local new_counter = counter and (tonumber(counter) + 1) or 1

			-- Create migrated line with incremented counter
			local migrated_line = line:gsub("{M%d+}", ""):gsub("TODO %[ %]", "TODO [ ] {M" .. new_counter .. "}", 1)
			if not counter then
				migrated_line = line:gsub("TODO %[ %]", "TODO [ ] {M" .. new_counter .. "}", 1)
			end

			table.insert(todos_to_migrate, migrated_line)

			-- Mark original as migrated
			table.insert(modified_prev_lines, line:gsub("TODO %[ %]", "TODO [>]", 1))
		else
			table.insert(modified_prev_lines, line)
		end
	end

	-- If no TODOs found, notify and return
	if #todos_to_migrate == 0 then
		vim.notify("No uncompleted TODOs from previous day", vim.log.levels.INFO)
		return
	end

	-- Insert migrated TODOs into current buffer at line 3
	local bufnr = vim.api.nvim_get_current_buf()
	vim.api.nvim_buf_set_lines(bufnr, 2, 2, false, todos_to_migrate)

	-- Save current file
	vim.cmd.write()

	-- Write modified previous file
	vim.fn.writefile(modified_prev_lines, prev_file)

	vim.notify(string.format("Migrated %d TODO(s) from previous day", #todos_to_migrate), vim.log.levels.INFO)
end

-- local function insert_daily_header()
--   local bufnr = vim.api.nvim_get_current_buf()
--   local first_line = vim.api.nvim_buf_get_lines(bufnr, 0, 1, false)[1]
--
--   -- Only insert if first line is nil or empty
--   if not first_line or first_line == "" then
--     local timestamp = os.date("%Y-%m-%d %H:%M:%S %A") --[[@as string]]
--     vim.api.nvim_buf_set_lines(bufnr, 0, 0, false, { timestamp, "", "" })
--     -- Position cursor on line 3
--     vim.api.nvim_win_set_cursor(0, { 3, 0 })
--
--     -- Migrate TODOs from previous day
--     migrate_todos()
--   end
-- end

-- vim.api.nvim_create_autocmd({ "BufNewFile", "BufReadPost" }, {
--   group = daily_note_group,
--   pattern = vim.fn.expand("~") .. "/Documents/daily/*.md",
--   callback = insert_daily_header,
--   desc = "Insert timestamp header in daily notes",
-- })
