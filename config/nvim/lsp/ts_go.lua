---@brief
---
--- Native Language Server Protocol implementation in TypeScript 7+ (`typescript-go`).
---
--- Starts native LSP via:
--- ```sh
--- tsc --lsp --stdio
--- ```
---
--- Provides diagnostics, completions, hover, definition, formatting, and source code actions.

return {
  cmd = { "tsc", "--lsp", "--stdio" },
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },
  root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
  on_attach = function(client, bufnr)
    -- Native TypeScript 7 provides source actions (e.g. source.organizeImports)
    if client.server_capabilities.codeActionProvider then
      vim.api.nvim_buf_create_user_command(bufnr, "LspTypescriptSourceAction", function()
        local source_actions = vim.tbl_filter(function(action)
          return vim.startswith(action, "source.")
        end, client.server_capabilities.codeActionProvider.codeActionKinds or {})

        vim.lsp.buf.code_action({
          context = {
            only = source_actions,
          },
        })
      end, {})
    end
  end,
}
