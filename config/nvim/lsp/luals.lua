-- https://luals.github.io/wiki/settings/
-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/lua_ls.lua
return {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = {
    ".emmyrc.json",
    ".luarc.json",
    ".luarc.jsonc",
    ".luacheckrc",
    ".stylua.toml",
    "stylua.toml",
    "selene.toml",
    "selene.yml",
    ".git",
  },
  telemetry = { enabled = false },
  formatters = {
    ignoreComments = false,
  },
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      workspace = {
        checkThirdParty = false,
        library = vim.api.nvim_get_runtime_file("", true),
      },
      signatureHelp = { enabled = true },
      codeLens = { enable = true },
      hint = { enable = true, semicolon = "Disable" },
    },
  },
}
