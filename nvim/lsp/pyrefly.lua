return {
  cmd = { "pyrefly", "lsp" },
  filetypes = { "python" },
  settings = {
     python = {
       pythonPath = vim.fn.exepath('python3.12'),
     },
  },
  on_exit = function(code, _, _)
    vim.notify("Closing Pyrefly LSP exited with code: " .. code, vim.log.levels.INFO)
  end,
}
