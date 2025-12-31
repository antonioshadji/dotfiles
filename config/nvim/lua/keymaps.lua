-- Key Mappings:
-- When you have a problem about vim mappings.
-- Check :verbose inoremap at the first.
-- If you know the keys which have problem,
-- then do it with specified key, for example :verbose inoremap <esc>.
-- by default, keymap.set includes { noremap = true}

-- Diagnostic keymaps
-- to only goto specific severity
-- vim.keymap.set('n', '[e', function() vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR }) end, { silent = true, desc = 'Go to previous error' })
-- vim.keymap.set('n', ']e', function() vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR }) end, { silent = true, desc = 'Go to next error' })
vim.keymap.set("n", "[d", function()
  vim.diagnostic.jump({ float = true, next = false })
end, { silent = true, desc = "Go to previous diagnostic" })
vim.keymap.set("n", "]d", function()
  vim.diagnostic.jump({ float = true })
end, { silent = true, desc = "Go to next diagnostic" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { silent = true, desc = "Show diagnostic error message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { silent = true, desc = "Open diagnostic quickfix list" })

-- Weekday at the end: "2025-12-31 14:30:45 Tuesday"
vim.keymap.set("ia", "dts", function()
  return vim.fn.strftime("%F %T %A")
end, { expr = true })

-- http://vim.wikia.com/wiki/Avoid_the_escape_key
-- ** alt + any key will exit insert mode and execute key action hl jk etc
-- <C-c> is an alternative to Esc but does not run autocmd by default
-- this mapping makes <C-c> execute Esc so autocmd runs
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Leave insert mode when moving between lines
vim.keymap.set("i", "<Up>", "<Esc><Up>")
vim.keymap.set("i", "<Down>", "<Esc><Down>")

-- Easy window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to window below" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to window above" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
vim.keymap.set("n", "<C-left>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-down>", "<C-w>j", { desc = "Move to window below" })
vim.keymap.set("n", "<C-up>", "<C-w>k", { desc = "Move to window above" })
vim.keymap.set("n", "<C-right>", "<C-w>l", { desc = "Move to right window" })

-- Note: This remaps Enter in normal mode, so it won't work for its default behavior (moving down a line).
-- Most people find this trade-off worth it since clearing search highlights is very common, and j still moves down one line.
vim.keymap.set("n", "<CR>", ":noh<CR>", { silent = true, desc = "Clear search highlighting" })

vim.keymap.set("c", "w!!", "w !sudo tee %", { desc = "Save file with sudo" })

-- for Terminal windows  (double square brackets do not require extra escaping)
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])
vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]])
vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]])
vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]])
vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]])

-- Quick-fix
vim.keymap.set("n", "ga", vim.lsp.buf.code_action, { silent = true, desc = "LSP code action" })
-- What it does:
-- Pressing ga in normal mode triggers LSP code actions (like auto-imports, quick fixes, refactorings) at the cursor position.
-- This is a global mapping, so it will be available everywhere (it just won't do anything if no LSP is attached to the buffer).
-- Note: Since you chose Option 1 (global keymaps) earlier, this is fine.
-- However, if you ever want LSP keymaps to only be active when an LSP is attached,
-- you'd move this to an on_attach function in your LSP configuration instead.

-- Code navigation shortcuts
vim.keymap.set("n", "K", vim.lsp.buf.hover, { silent = true, desc = "LSP hover documentation" })
vim.keymap.set("n", "gD", vim.lsp.buf.implementation, { silent = true, desc = "LSP go to implementation" })
vim.keymap.set("n", "<C-s>", vim.lsp.buf.signature_help, { silent = true, desc = "LSP signature help" })
vim.keymap.set("n", "1gD", vim.lsp.buf.type_definition, { silent = true, desc = "LSP type definition" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { silent = true, desc = "LSP references" })
vim.keymap.set("n", "g0", vim.lsp.buf.document_symbol, { silent = true, desc = "LSP document symbols" })
vim.keymap.set("n", "gW", vim.lsp.buf.workspace_symbol, { silent = true, desc = "LSP workspace symbols" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { silent = true, desc = "LSP go to definition" })
