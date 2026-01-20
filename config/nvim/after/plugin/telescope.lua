local telescope = require("telescope")

telescope.setup({
  defaults = {
    -- Use ripgrep with smart case matching
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--trim",
    },
    -- UI improvements
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        preview_width = 0.55,
      },
    },
    -- File ignore patterns
    file_ignore_patterns = {
      "node_modules",
      ".git/",
      "dist/",
      "build/",
    },
    -- Faster sorting
    sorting_strategy = "ascending",
    -- Better UI
    prompt_prefix = "🔍 ",
    selection_caret = "➜ ",
  },
  pickers = {
    find_files = {
      hidden = true,
      find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*" },
    },
    live_grep = {
      additional_args = function()
        return { "--hidden", "--glob", "!.git/*" }
      end,
    },
    buffers = {
      sort_lastused = true,
      sort_mru = true,
      mappings = {
        i = {
          ["<c-d>"] = "delete_buffer",
        },
        n = {
          ["dd"] = "delete_buffer",
        },
      },
    },
    oldfiles = {
      only_cwd = true, -- Only show recent files from current directory
    },
  },
  extensions = {
    -- fzf extension configuration (if installed)
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
  },
})

-- Load extensions
pcall(telescope.load_extension, "fzf")

return {}
