-- uv tool install basedpyright
-- https://docs.basedpyright.com/latest/configuration/language-server-settings/#neovim
return {
  settings = {
    basedpyright = {
      analysis = {
        diagnosticMode = "openFilesOnly",
        inlayHints = {
          callArgumentNames = true,
        },
      },
    },
  },
}
