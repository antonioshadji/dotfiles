-- =============================================================================
-- General Key Mappings
-- =============================================================================

-- Clear search highlighting with <CR> (Enter)
-- Note: This overrides default Enter behavior in Normal mode
vim.keymap.set("n", "<CR>", ":noh<CR>", {
  silent = true,
  desc = "Clear search highlighting",
})

-- Date Timestamp: "2025-12-31 14:30:45 Tuesday"
vim.keymap.set("ia", "dts", function()
  return vim.fn.strftime("%F %T %A")
end, { expr = true, desc = "Insert date timestamp" })

-- Save file with sudo (useful for editing system config files)
vim.keymap.set("c", "w!!", "w !sudo tee %", { desc = "Save file with sudo" })

-- =============================================================================
-- Insert Mode Tweaks
-- =============================================================================

-- Map <C-c> to <Esc> so autocmds (like InsertLeave) trigger correctly
vim.keymap.set("i", "<C-c>", "<Esc>", { desc = "Exit insert mode (triggers InsertLeave)" })

-- Exit insert mode when moving up/down (prevents accidental edits while navigating)
vim.keymap.set("i", "<Up>", "<Esc><Up>")
vim.keymap.set("i", "<Down>", "<Esc><Down>")

-- =============================================================================
-- Window Navigation
-- =============================================================================

-- Easy window navigation using Ctrl + hjkl
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to window below" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to window above" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Window navigation using Ctrl + Arrow keys
vim.keymap.set("n", "<C-left>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-down>", "<C-w>j", { desc = "Move to window below" })
vim.keymap.set("n", "<C-up>", "<C-w>k", { desc = "Move to window above" })
vim.keymap.set("n", "<C-right>", "<C-w>l", { desc = "Move to right window" })

-- =============================================================================
-- Terminal Navigation
-- =============================================================================

-- Easy escape from Terminal mode
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

-- Window navigation directly from Terminal mode
vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]], { desc = "Move to left window" })
vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]], { desc = "Move to window below" })
vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]], { desc = "Move to window above" })
vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]], { desc = "Move to right window" })

-- =============================================================================
-- Diagnostics
-- =============================================================================

-- Jump to Diagnostics
-- Note: 'count' is required for vim.diagnostic.jump in newer Neovim versions
vim.keymap.set("n", "[d", function()
  vim.diagnostic.jump({ count = -1, float = true })
end, { silent = true, desc = "Go to previous diagnostic" })

vim.keymap.set("n", "]d", function()
  vim.diagnostic.jump({ count = 1, float = true })
end, { silent = true, desc = "Go to next diagnostic" })

-- Diagnostic UI
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, {
  silent = true,
  desc = "Show diagnostic error message",
})
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, {
  silent = true,
  desc = "Open diagnostic quickfix list",
})

-- =============================================================================
-- LSP (Language Server Protocol)
-- =============================================================================
-- Note: These are global mappings. In advanced configs, these are often moved
-- to an LspAttach autocommand, but they work perfectly fine here as well.

vim.keymap.set("n", "ga", vim.lsp.buf.code_action, {
  silent = true,
  desc = "LSP code action",
})
vim.keymap.set("n", "K", vim.lsp.buf.hover, {
  silent = true,
  desc = "LSP hover documentation",
})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {
  silent = true,
  desc = "LSP go to definition",
})
vim.keymap.set("n", "gD", vim.lsp.buf.implementation, {
  silent = true,
  desc = "LSP go to implementation",
})
vim.keymap.set("n", "1gD", vim.lsp.buf.type_definition, {
  silent = true,
  desc = "LSP type definition",
})
vim.keymap.set("n", "gr", vim.lsp.buf.references, {
  silent = true,
  desc = "LSP references",
})
vim.keymap.set("n", "<C-s>", vim.lsp.buf.signature_help, {
  silent = true,
  desc = "LSP signature help",
})

-- Symbol Navigation
vim.keymap.set("n", "g0", vim.lsp.buf.document_symbol, {
  silent = true,
  desc = "LSP document symbols",
})
vim.keymap.set("n", "gW", vim.lsp.buf.workspace_symbol, {
  silent = true,
  desc = "LSP workspace symbols",
})
