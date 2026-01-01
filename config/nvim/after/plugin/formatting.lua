-- Safely try to require conform. 
-- This prevents Neovim from crashing if you haven't cloned the repo yet.
local status, conform = pcall(require, "conform")
if not status then
  vim.notify("Conform.nvim not found", vim.log.levels.WARN)
  return
end

conform.setup({
  formatters_by_ft = {
    -- Python: Import sort first, then standard formatting
    python = { "ruff_organize_imports", "ruff_format" },

    -- Lua
    lua = { "stylua" },

    -- JavaScript / TypeScript
    javascript = { "prettierd", "prettier", stop_after_first = true },
    typescript = { "prettierd", "prettier", stop_after_first = true },
    javascriptreact = { "prettierd", "prettier", stop_after_first = true },
    typescriptreact = { "prettierd", "prettier", stop_after_first = true },

    -- Go
    go = { "goimports", "gofmt" },

    -- Rust
    rust = { "rustfmt" },

    -- C / C++
    c = { "clang-format" },
    cpp = { "clang-format" },

    -- Config / Data formats
    yaml = { "prettierd", "prettier", stop_after_first = true },
    json = { "prettierd", "prettier", stop_after_first = true },
    toml = { "taplo" },

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
