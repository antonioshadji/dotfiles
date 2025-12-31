-- Translate viml highlights to lua highlihts
vim.api.nvim_create_user_command("TranslateHL", function()
  local current_line = vim.api.nvim_get_current_line()
  local row, _ = unpack(vim.api.nvim_win_get_cursor(0))
  local new_line = ""
  local t = {}
  local s = current_line
  for k, v in string.gmatch(s, "([^%s]+)=([^%s]+)") do
    t[k] = v
  end
  for k in string.gmatch(s, "hi!* ([^%s]+) ") do
    t.key = k
  end
  if t.key ~= "link" then
    new_line = string.format('vim.api.nvim_set_hl(0, "%s", { fg = "%s", bg = "%s"', t.key, t.guifg, t.guibg)

    if t.guisp then
      new_line = new_line .. string.format(', sp="%s"', t.guisp)
    end
    if t.gui and t.gui ~= "NONE" then
      new_line = new_line .. string.format(", %s = true", t.gui)
    end
    if t.cterm and t.cterm ~= "NONE" then
      new_line = new_line .. string.format(", cterm = { %s = true }", t.cterm)
    end
    new_line = new_line .. "})"
  else
    -- loop over 1 item because gmatch returns an iterator
    for name, link in string.gmatch(current_line, "hi! link (%w+) (%w+)") do
      new_line = string.format('vim.api.nvim_set_hl(0, "%s", { link = "%s"})', name, link)
    end
  end

  -- new_line = string.gsub(current_line, "hi", "highlight", 1)
  local new_row = vim.fn.search("vim.cmd", "b")
  vim.api.nvim_buf_set_lines(0, new_row - 2, new_row - 1, true, { new_line })
  vim.api.nvim_win_set_cursor(0, { new_row - 1, 0 })
  vim.cmd([[ call append(line('.'), '') ]])
  vim.api.nvim_win_set_cursor(0, { row + 1, 0 })
  vim.api.nvim_del_current_line()
end, {})

vim.keymap.set("n", "t", vim.cmd.TranslateHL)

vim.cmd.packadd("nvim-highlight-colors")
require("nvim-highlight-colors").setup({})
require("nvim-highlight-colors").turnOn()
