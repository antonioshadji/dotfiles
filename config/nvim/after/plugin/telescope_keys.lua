local builtin = require("telescope.builtin")

-- Helper function for custom pickers
local M = {}

-- === File Navigation ===
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Grep word under cursor" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Recent files" })
vim.keymap.set("n", "<leader>f.", builtin.resume, { desc = "Resume last picker" })

-- === Git Integration ===
vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "Git commits" })
vim.keymap.set("n", "<leader>gb", builtin.git_branches, { desc = "Git branches" })
vim.keymap.set("n", "<leader>gs", builtin.git_status, { desc = "Git status" })
vim.keymap.set("n", "<leader>gf", builtin.git_files, { desc = "Git files" })

-- === LSP / Code Navigation ===
vim.keymap.set("n", "<leader>lr", builtin.lsp_references, { desc = "LSP references" })
vim.keymap.set("n", "<leader>ld", builtin.lsp_definitions, { desc = "LSP definitions" })
vim.keymap.set("n", "<leader>li", builtin.lsp_implementations, { desc = "LSP implementations" })
vim.keymap.set("n", "<leader>ls", builtin.lsp_document_symbols, { desc = "Document symbols" })
vim.keymap.set("n", "<leader>lS", builtin.lsp_workspace_symbols, { desc = "Workspace symbols" })
vim.keymap.set("n", "<leader>le", builtin.diagnostics, { desc = "Diagnostics" })

-- === Vim Internals ===
vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Keymaps" })
vim.keymap.set("n", "<leader>fC", builtin.commands, { desc = "Commands" })
vim.keymap.set("n", "<leader>fq", builtin.quickfix, { desc = "Quickfix list" })
vim.keymap.set("n", "<leader>fL", builtin.loclist, { desc = "Location list" })
vim.keymap.set("n", "<leader>fj", builtin.jumplist, { desc = "Jump list" })
vim.keymap.set("n", "<leader>fm", builtin.marks, { desc = "Marks" })
vim.keymap.set("n", "<leader>fR", builtin.registers, { desc = "Registers" })

-- === Search History ===
vim.keymap.set("n", "<leader>f/", builtin.search_history, { desc = "Search history" })
vim.keymap.set("n", "<leader>f:", builtin.command_history, { desc = "Command history" })

-- === Current Buffer ===
vim.keymap.set("n", "<leader>/", builtin.current_buffer_fuzzy_find, { desc = "Fuzzy find in buffer" })

-- === Custom Pickers ===

-- Search in open buffers only
M.grep_open_buffers = function()
  builtin.live_grep({
    grep_open_files = true,
    prompt_title = "Live Grep in Open Files",
  })
end
vim.keymap.set("n", "<leader>fB", M.grep_open_buffers, { desc = "Grep in open buffers" })

-- Find files in current file's directory
M.find_in_current_dir = function()
  builtin.find_files({ cwd = vim.fn.expand("%:p:h") })
end
vim.keymap.set("n", "<leader>fD", M.find_in_current_dir, { desc = "Find files in current directory" })

-- Search for files by extension
M.find_by_extension = function()
  vim.ui.input({ prompt = "File extension (e.g., lua, py): " }, function(ext)
    if ext then
      builtin.find_files({
        find_command = { "rg", "--files", "--type", ext },
      })
    end
  end)
end
vim.keymap.set("n", "<leader>fE", M.find_by_extension, { desc = "Find by extension" })

-- Grep with custom search path
M.grep_custom_path = function()
  vim.ui.input({ prompt = "Search path: ", default = "./" }, function(path)
    if path then
      builtin.live_grep({ cwd = path })
    end
  end)
end
vim.keymap.set("n", "<leader>fP", M.grep_custom_path, { desc = "Grep in custom path" })

return M
