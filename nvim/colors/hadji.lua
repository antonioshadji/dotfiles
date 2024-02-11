vim.cmd.highlight("clear")

vim.g.colors_name = "hadji"

vim.api.nvim_set_hl(0, "Normal", { fg = "#93a1a1", bg = "#002b36" })
-- this is a comment
--
vim.api.nvim_set_hl(0, "Comment", { link = "Normal" })
