-- =============================================================================
-- General Key Mappings
-- =============================================================================
-- When you have a problem about vim mappings.
-- Check :verbose inoremap at the first.
-- If you know the keys which have problem,
-- then do it with specified key, for example :verbose inoremap <esc>.
-- -----------------------------------------------------------------------------

-- Clear search highlighting with <Esc> (avoids breaking Enter in Quickfix/Help/Loclist)
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR><Esc>", {
  desc = "Clear search highlighting and send Esc",
})

-- Date Timestamp: "2025-12-31 14:30:45 Tuesday"
vim.keymap.set("ia", "dts", function()
  return vim.fn.strftime("%F %T %A")
end, { expr = true, desc = "Insert date timestamp" })

-- Command-line abbreviations (only trigger on word boundaries, won't mangle paths)
vim.cmd.cabbrev("w!! w !sudo tee % >/dev/null")
vim.cmd.cabbrev("vt vertical terminal")
vim.cmd.cabbrev("tt tab terminal")

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
-- =============================================================================
-- LSP (Language Server Protocol) - Scoped to LspAttach
-- =============================================================================
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
  callback = function(event)
    local bufnr = event.buf
    local map = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
    end

    map("n", "ga", vim.lsp.buf.code_action, "LSP code action")
    map("n", "K", vim.lsp.buf.hover, "LSP hover documentation")
    map("n", "gd", vim.lsp.buf.definition, "LSP go to definition")
    map("n", "gD", vim.lsp.buf.implementation, "LSP go to implementation")
    map("n", "1gD", vim.lsp.buf.type_definition, "LSP type definition")
    map("n", "gr", vim.lsp.buf.references, "LSP references")
    map("n", "<C-s>", vim.lsp.buf.signature_help, "LSP signature help")
    map("i", "<C-s>", vim.lsp.buf.signature_help, "LSP signature help")
    map("n", "<leader>rn", vim.lsp.buf.rename, "LSP rename")

    -- Symbol Navigation
    map("n", "g0", vim.lsp.buf.document_symbol, "LSP document symbols")
    map("n", "gW", vim.lsp.buf.workspace_symbol, "LSP workspace symbols")
  end,
})
