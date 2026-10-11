-- Safely try to require conform.
-- This prevents Neovim from crashing if you haven't cloned the repo yet.
local status, conform = pcall(require, "conform")
if not status then
  vim.notify("Conform.nvim not found", vim.log.levels.WARN)
  return
end

conform.setup({
  -- formatters = {
  --   vp_fmt = {
  --     command = "vp",
  --     args = { "fmt", "$FILENAME" },
  --     stdin = false,
  --   },
  -- },
  formatters_by_ft = {
    -- Python: Import sort first, then standard formatting
    python = { "ruff_organize_imports", "ruff_format" },

    -- Lua
    lua = { "stylua" },

    -- JavaScript / TypeScript
    javascript = { "oxfmt" },
    typescript = { "oxfmt" },
    javascriptreact = { "oxfmt" },
    typescriptreact = { "oxfmt" },

    -- Go
    go = { "goimports", "gofmt" },

    -- Rust
    rust = { "rustfmt" },

    -- C / C++
    c = { "clang-format" },
    cpp = { "clang-format" },

    -- Config / Data formats
    yaml = { "oxfmt" },
    json = { "oxfmt" },
    jsonc = { "oxfmt" },
    toml = { "oxfmt" },

    -- Fallback
    ["*"] = { "trim_whitespace" },
  },

  format_on_save = {
    -- Timeout in milliseconds. Increase if formatting large files fails.
    timeout_ms = 500,
    -- Use "fallback" to use LSP formatting if the specific formatter is missing
    lsp_format = "fallback",
  },
})
