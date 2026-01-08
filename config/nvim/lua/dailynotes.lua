-- Daily note automation
local daily_note_group = vim.api.nvim_create_augroup("DailyNote", { clear = true })

local function insert_daily_header()
  local bufnr = vim.api.nvim_get_current_buf()
  local first_line = vim.api.nvim_buf_get_lines(bufnr, 0, 1, false)[1]

  -- Only insert if first line is nil or empty
  if not first_line or first_line == "" then
    local timestamp = os.date("%Y-%m-%d %H:%M:%S %A") --[[@as string]]
    vim.api.nvim_buf_set_lines(bufnr, 0, 0, false, { timestamp, "", "" })
    -- Position cursor on line 3
    vim.api.nvim_win_set_cursor(0, { 3, 0 })
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
