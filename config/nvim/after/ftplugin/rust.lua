-- this file is loaded after runtime files in /usr/local/share/nvim/runtime/ftplugin
-- Do not set vim.g.rustaceanvim in after/ftplugin/rust.lua,
-- as the file is sourced after the plugin is initialized.

-- https://github.com/mrcjkb/rustaceanvim#quick-setup
local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set("n", "<leader>a", function()
  vim.cmd.RustLsp("codeAction") -- supports rust-analyzer's grouping
  -- or vim.lsp.buf.codeAction() if you don't want grouping.
end, { silent = true, buffer = bufnr })
vim.keymap.set(
  "n",
  "K", -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
  function()
    vim.cmd.RustLsp({ "hover", "actions" })
  end,
  { silent = true, buffer = bufnr }
)
