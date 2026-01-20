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
    local save_cursor = vim.fn.getpos(".")
    local n = math.min(20, vim.fn.line("$"))

    -- Execute the substitution command
    vim.cmd(string.format("keepjump 1,%d s#^\\(.\\{,10}modified: \\).*#\\1%s#e", n, vim.fn.strftime("%c")))

    vim.fn.histdel("search", -1)
    vim.fn.setpos(".", save_cursor)
    vim.api.nvim_echo({ { "updated last modified date", "None" } }, false, {})
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
