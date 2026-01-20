vim.api.nvim_create_augroup("GoFormat", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
  group = "GoFormat",
  pattern = "*.go",
  callback = function()
    require("go.format").gofmt()
  end,
})

vim.api.nvim_create_augroup("DiagnosticFloat", { clear = true })

vim.api.nvim_create_autocmd("CursorHold", {
  group = "DiagnosticFloat",
  pattern = "*",
  callback = function()
    vim.diagnostic.open_float(nil, { focusable = false })
  end,
})
-- Set updatetime for CursorHold
-- 300ms of no cursor movement to trigger CursorHold
-- set updatetime=300, default 4000
vim.g.updatetime = 500

vim.api.nvim_create_augroup("GIT", { clear = true })

vim.api.nvim_create_autocmd("BufEnter", {
  group = "GIT",
  pattern = "COMMIT_EDITMSG",
  callback = function()
    vim.fn.setpos(".", { 0, 1, 1, 0 })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = "GIT",
  pattern = "gitcommit",
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.textwidth = 72
  end,
})

--  http://vim.wikia.com/wiki/Shebang_line_automatically_generated
vim.api.nvim_create_augroup("Shebang", { clear = true })

vim.api.nvim_create_autocmd("BufNewFile", {
  group = "Shebang",
  pattern = "*.sh",
  callback = function()
    vim.fn.append(0, {
      "#!/usr/bin/env bash",
      "# -*- coding: utf-8 -*-",
      "",
    })
    vim.cmd("normal! G")
  end,
})

vim.api.nvim_create_augroup("PANDOC", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = "PANDOC",
  pattern = "pandoc",
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = "en_us"
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
    vim.b.ale_fix_on_save = 0
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  group = "PANDOC",
  pattern = { "*.md", "*.markdown", "*.mkd" },
  callback = function()
    -- Configuration
    local scan_limit = 20
    local bufnr = vim.api.nvim_get_current_buf()

    -- 1. Pure Transformation Function
    -- Returns: new_lines (table), was_updated (bool)
    local function apply_timestamp(lines)
      local new_lines = {}
      local updated = false
      local current_time = os.date("%c")

      for _, line in ipairs(lines) do
        -- Capture the prefix: Start of line -> anything non-greedy -> "modified: "
        local prefix = line:match("^(.-modified: )")

        -- Mimic regex \{,10}: Check if prefix length is reasonable
        -- "modified: " is 10 chars + max 10 chars context = max 20 chars total
        if prefix and #prefix <= 20 then
          table.insert(new_lines, prefix .. current_time)
          updated = true
        else
          table.insert(new_lines, line)
        end
      end
      return new_lines, updated
    end

    -- 2. IO: Read Buffer
    local line_count = vim.api.nvim_buf_line_count(bufnr)
    local end_range = math.min(scan_limit, line_count)
    local lines = vim.api.nvim_buf_get_lines(bufnr, 0, end_range, false)

    -- 3. Logic: Transform
    local result_lines, changed = apply_timestamp(lines)

    -- 4. IO: Write Buffer (Only if needed)
    if changed then
      vim.api.nvim_buf_set_lines(bufnr, 0, end_range, false, result_lines)
      vim.api.nvim_echo({ { "updated last modified date", "None" } }, false, {})
    end
  end,
})

vim.api.nvim_create_augroup("Templates", { clear = true })

-- Construct the portable path: ~/.config/nvim/templates/bootstrap.html
local template_path = table.concat({ vim.fn.stdpath("config"), "templates", "bootstrap.html" }, "/")

vim.api.nvim_create_autocmd("BufNewFile", {
  group = "Templates",
  pattern = "*.html",
  -- Execute the Vim command '0r' to read the file into the buffer
  command = "0r " .. template_path,
})
