---@brief
---
--- https://github.com/astral-sh/ty
---
--- `ty`, an extremely fast Python type checker and language server written in Rust by Astral.

---@type vim.lsp.Config
return {
  cmd = { "ty", "server" },
  filetypes = { "python" },
  root_markers = {
    "pyproject.toml",
    "ty.toml",
    ".ty.toml",
    "setup.py",
    "setup.cfg",
    "requirements.txt",
    "Pipfile",
    ".git",
  },
  settings = {},
}
