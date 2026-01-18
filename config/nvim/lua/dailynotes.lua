-- Daily note automation
local daily_note_group = vim.api.nvim_create_augroup("DailyNote", { clear = true })
-- writes to ~/.local/state/nvim
-- local log = require("plenary.log").new({
--   plugin = "daily_notes",
--   level = "debug",
--   use_console = false, -- false writes only to file
-- })

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
      local migrated_todo = line:gsub("TODO %[ %]", "TODO [>]", 1)
      table.insert(modified_prev_lines, migrated_todo)
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

local function insert_daily_header()
  local bufnr = vim.api.nvim_get_current_buf()
  local first_line = vim.api.nvim_buf_get_lines(bufnr, 0, 1, false)[1]

  -- Only insert if first line is nil or empty
  if not first_line or first_line == "" then
    local timestamp = os.date("%Y-%m-%d %H:%M:%S %A") --[[@as string]]
    vim.api.nvim_buf_set_lines(bufnr, 0, 0, false, { timestamp, "", "" })
    -- Position cursor on line 3
    vim.api.nvim_win_set_cursor(0, { 3, 0 })

    -- Migrate TODOs from previous day
    migrate_todos()
  end
end

vim.api.nvim_create_autocmd({ "BufNewFile", "BufReadPost" }, {
  group = daily_note_group,
  pattern = vim.fn.expand("~") .. "/Documents/daily/*.md",
  callback = insert_daily_header,
  desc = "Insert timestamp header in daily notes",
})

-- Command to open today's daily note
vim.api.nvim_create_user_command("DailyNote", function()
  local daily_dir = vim.fn.expand("~/Documents/daily")
  local filename = os.date("%m%d") .. ".md"
  local filepath = daily_dir .. "/" .. filename

  -- Ensure directory exists
  vim.fn.mkdir(daily_dir, "p")

  -- Open the file
  vim.cmd.edit(filepath)
end, { desc = "Open today's daily note" })

-- Insert TODO checkbox (works in normal and insert mode)
local function insert_todo()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local current_line = vim.api.nvim_get_current_line()

  -- Check if line has content (non-whitespace)
  local has_content = current_line:match("%S") ~= nil

  if has_content or col > 0 then
    -- Insert new line below and add TODO
    vim.api.nvim_buf_set_lines(0, row, row, false, { "TODO [ ] " })
    vim.api.nvim_win_set_cursor(0, { row + 1, 9 })
  else
    -- Current line is empty, insert TODO here
    vim.api.nvim_buf_set_lines(0, row - 1, row, false, { "TODO [ ] " })
    vim.api.nvim_win_set_cursor(0, { row, 9 })
  end

  -- Ensure we're in insert mode at the end
  local mode = vim.api.nvim_get_mode().mode
  if mode ~= "i" then
    vim.cmd.startinsert({ bang = true })
  end
end

vim.keymap.set("n", "<leader>td", insert_todo, { desc = "Insert TODO checkbox" })
-- TODO this causes delays when hitting space key in insert mode
-- vim.keymap.set("i", "<leader>td", insert_todo, { desc = "Insert TODO checkbox" })

-- Mark TODO as done
vim.keymap.set("n", "<leader>tx", function()
  local row = vim.api.nvim_win_get_cursor(0)[1]
  local line = vim.api.nvim_buf_get_lines(0, row - 1, row, false)[1]

  -- Check if line starts with TODO [ ]
  local new_line = line:gsub("^TODO %[ %]", "DONE [X]")

  -- Only update if substitution happened
  if new_line ~= line then
    vim.api.nvim_buf_set_lines(0, row - 1, row, false, { new_line })
    vim.cmd.write()
  end
end, { desc = "Mark TODO as done" })
