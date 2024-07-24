vim.cmd.highlight("clear")

vim.g.colors_name = "solarized_lua"
-- vim.g.colors_name = "soluarized"

-- NOTE: show colors and enbale TranslateHL function
-- lua require("highlights")

-- Background: dark
-- Color: base0    #839496   246     12
-- Color: base00   #657b83   66      11
-- Color: base01   #586e75   242     10
-- Color: base02   #073642   236      0
-- Color: base03   #002b36   235      8
-- Color: base1    #93a1a1   247     14
-- Color: base2    #eee8d5   254      7
-- Color: base3    #fdf6e3   230     15
-- Color: black    #002b36   235      8

-- light
-- Color: base0    #657b83   66        11
-- Color: base00   #839496   246       12
-- Color: base01   #93a1a1   247       14
-- Color: base02   #eee8d5   254        7
-- Color: base03   #fdf6e3   230       15
-- Color: base1    #586e75   242       10
-- Color: base2    #073642   236        0
-- Color: base3    #002b36   235        8
-- Color: black    #fdf6e3   230       15

-- Color: blue     #268bd2   32         4
-- Color: cyan     #2aa198   37         6
-- Color: green    #859900   106        2
-- Color: magenta  #d33682   162        5
-- Color: orange   #cb4b16   166        9
-- Color: red      #dc322f   160        1
-- Color: violet   #6c71c4   61        13
-- Color: yellow   #b58900   136        3

-- base03 == black
local c = {
	blue = "#268bd2",
	cyan = "#2aa198",
	green = "#859900",
	magenta = "#d33682",
	orange = "#cb4b16",
	red = "#dc322f",
	violet = "#6c71c4",
	yellow = "#b58900",
	d = {
		base0 = "#839496",
		base00 = "#657b83",
		base01 = "#586e75",
		base02 = "#073642",
		base03 = "#002b36",
		base1 = "#93a1a1",
		base2 = "#eee8d5",
		base3 = "#fdf6e3",
		black = "#002b36",
	},
	l = {
		base0 = "#657b83",
		base00 = "#839496",
		base01 = "#93a1a1",
		base02 = "#eee8d5",
		base03 = "#fdf6e3",
		base1 = "#586e75",
		base2 = "#073642",
		base3 = "#002b36",
		black = "#fdf6e3",
	},
}

-- fzf settings :h terminal_color_0   dark/light
vim.g.terminal_color_0 = "#073642" -- base02/base2
vim.g.terminal_color_1 = c.red
vim.g.terminal_color_2 = c.green
vim.g.terminal_color_3 = c.yellow
vim.g.terminal_color_4 = c.blue
vim.g.terminal_color_5 = c.magenta
vim.g.terminal_color_6 = c.cyan
vim.g.terminal_color_7 = "#eee8d5" -- base2/base02
vim.g.terminal_color_8 = "#002b36" -- base03/base3
vim.g.terminal_color_9 = c.orange
vim.g.terminal_color_10 = "#586e75" --base01/base1
vim.g.terminal_color_11 = "#657b83" -- base00/base0
vim.g.terminal_color_12 = "#839496" -- base0/base00
vim.g.terminal_color_13 = c.violet
vim.g.terminal_color_14 = "#93a1a1" -- base1/base01
vim.g.terminal_color_15 = "#fdf6e3" -- base3/base03

-- https://neovim.io/doc/user/api.html#nvim_set_hl()
vim.api.nvim_set_hl(0, "Boolean", { link = "Constant" })
vim.api.nvim_set_hl(0, "Character", { link = "Constant" })
vim.api.nvim_set_hl(0, "Conditional", { link = "Statement" })
vim.api.nvim_set_hl(0, "CurSearch", { link = "Search" })
vim.api.nvim_set_hl(0, "CursorLineFold", { link = "FoldColumn" })
vim.api.nvim_set_hl(0, "CursorLineSign", { link = "SignColumn" })
vim.api.nvim_set_hl(0, "Debug", { link = "Special" })
vim.api.nvim_set_hl(0, "Define", { link = "PreProc" })
vim.api.nvim_set_hl(0, "Delimiter", { link = "Special" })
vim.api.nvim_set_hl(0, "Exception", { link = "Statement" })
vim.api.nvim_set_hl(0, "Float", { link = "Constant" })
vim.api.nvim_set_hl(0, "Function", { link = "Identifier" })
vim.api.nvim_set_hl(0, "Include", { link = "PreProc" })
vim.api.nvim_set_hl(0, "Keyword", { link = "Statement" })
vim.api.nvim_set_hl(0, "Label", { link = "Statement" })
vim.api.nvim_set_hl(0, "LineNrAbove", { link = "LineNr" })
vim.api.nvim_set_hl(0, "LineNrBelow", { link = "LineNr" })
vim.api.nvim_set_hl(0, "Macro", { link = "PreProc" })
vim.api.nvim_set_hl(0, "Number", { link = "Constant" })
vim.api.nvim_set_hl(0, "Operator", { link = "Statement" })
vim.api.nvim_set_hl(0, "PreCondit", { link = "PreProc" })
vim.api.nvim_set_hl(0, "QuickFixLine", { link = "Search" })
vim.api.nvim_set_hl(0, "Repeat", { link = "Statement" })
vim.api.nvim_set_hl(0, "SpecialChar", { link = "Special" })
vim.api.nvim_set_hl(0, "SpecialComment", { link = "Special" })
vim.api.nvim_set_hl(0, "StatusLineTerm", { link = "StatusLine" })
vim.api.nvim_set_hl(0, "StatusLineTermNC", { link = "StatusLineNC" })
vim.api.nvim_set_hl(0, "StorageClass", { link = "Type" })
vim.api.nvim_set_hl(0, "String", { link = "Constant" })
vim.api.nvim_set_hl(0, "Structure", { link = "Type" })
vim.api.nvim_set_hl(0, "Tag", { link = "Special" })
vim.api.nvim_set_hl(0, "Typedef", { link = "Type" })
vim.api.nvim_set_hl(0, "debugBreakpoint", { link = "SignColumn" })
vim.api.nvim_set_hl(0, "debugPC", { link = "SignColumn" })
vim.api.nvim_set_hl(0, "lCursor", { link = "Cursor" })
vim.api.nvim_set_hl(0, "TermCursor", { link = "Cursor" })
vim.api.nvim_set_hl(0, "vimVar", { link = "Identifier" })
vim.api.nvim_set_hl(0, "vimFunc", { link = "Function" })
vim.api.nvim_set_hl(0, "vimUserFunc", { link = "Function" })
vim.api.nvim_set_hl(0, "helpSpecial", { link = "Special" })
vim.api.nvim_set_hl(0, "diffAdded", { link = "Statement" })
vim.api.nvim_set_hl(0, "diffLine", { link = "Identifier" })
vim.api.nvim_set_hl(0, "gitcommitUntracked", { link = "gitcommitComment" })
vim.api.nvim_set_hl(0, "gitcommitDiscarded", { link = "gitcommitComment" })
vim.api.nvim_set_hl(0, "gitcommitSelected", { link = "gitcommitComment" })
vim.api.nvim_set_hl(0, "gitcommitNoBranch", { link = "gitcommitBranch" })
vim.api.nvim_set_hl(0, "gitcommitDiscardedArrow", { link = "gitcommitDiscardedFile" })
vim.api.nvim_set_hl(0, "gitcommitSelectedArrow", { link = "gitcommitSelectedFile" })
vim.api.nvim_set_hl(0, "gitcommitUnmergedArrow", { link = "gitcommitUnmergedFile" })
vim.api.nvim_set_hl(0, "jsFuncCall", { link = "Function" })
vim.api.nvim_set_hl(0, "rubySymbol", { link = "Type" })
vim.api.nvim_set_hl(0, "hsImportParams", { link = "Delimiter" })
vim.api.nvim_set_hl(0, "hsDelimTypeExport", { link = "Delimiter" })
vim.api.nvim_set_hl(0, "hsModuleStartLabel", { link = "hsStructure" })
vim.api.nvim_set_hl(0, "hsModuleWhereLabel", { link = "hsModuleStartLabel" })
vim.api.nvim_set_hl(0, "pandocVerbatimBlockDeep", { link = "pandocVerbatimBlock" })
vim.api.nvim_set_hl(0, "pandocCodeBlock", { link = "pandocVerbatimBlock" })
vim.api.nvim_set_hl(0, "pandocCodeBlockDelim", { link = "pandocVerbatimBlock" })
vim.api.nvim_set_hl(0, "pandocTableStructureTop", { link = "pandocTableStructre" })
vim.api.nvim_set_hl(0, "pandocTableStructureEnd", { link = "pandocTableStructre" })
vim.api.nvim_set_hl(0, "pandocEscapedCharacter", { link = "pandocEscapePair" })
vim.api.nvim_set_hl(0, "pandocLineBreak", { link = "pandocEscapePair" })
vim.api.nvim_set_hl(0, "pandocMetadataTitle", { link = "pandocMetadata" })
vim.api.nvim_set_hl(0, "ALEStyleError", { link = "ALEError" })
vim.api.nvim_set_hl(0, "ALEStyleErrorSign", { link = "ALEErrorSign" })
vim.api.nvim_set_hl(0, "ALEStyleErrorSignLineNr", { link = "ALEErrorSignLineNr" })
vim.api.nvim_set_hl(0, "ALEStyleWarning", { link = "ALEWarning" })
vim.api.nvim_set_hl(0, "ALEStyleWarningSign", { link = "ALEWarningSign" })
vim.api.nvim_set_hl(0, "ALEStyleWarningSignLineNr", { link = "ALEWarningSignLineNr" })
vim.api.nvim_set_hl(0, "CocMenuSel", { link = "PmenuSel" })

-- custom colors I chose
vim.api.nvim_set_hl(0, "@variable", { fg = "NONE", bg = "NONE" })

-- same colors for dark and light
vim.api.nvim_set_hl(0, "vimCommentString", { fg = "#6c71c4", bg = "NONE" })
vim.api.nvim_set_hl(0, "vimCommand", { fg = "#b58900", bg = "NONE" })
vim.api.nvim_set_hl(0, "vimCmdSep", { fg = "#268bd2", bg = "NONE", bold = true, cterm = { bold = true } })

if vim.opt.background:get() == "dark" then
	-- from solarized8
	vim.api.nvim_set_hl(0, "Normal", { fg = "#93a1a1", bg = "#002b36" })
	vim.api.nvim_set_hl(0, "FoldColumn", { fg = "#839496", bg = "#073642" })
	vim.api.nvim_set_hl(0, "Folded", { fg = "#839496", bg = "#073642", bold = true })
	vim.api.nvim_set_hl(0, "Terminal", { fg = "NONE", bg = "NONE" })
	vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#839496", bg = "#073642", bold = true })
	vim.api.nvim_set_hl(0, "ToolbarButton", { fg = "#93a1a1", bg = "#073642", bold = true })
	vim.api.nvim_set_hl(0, "ToolbarLine", { fg = "NONE", bg = "#073642" })
	vim.api.nvim_set_hl(0, "LineNr", { fg = "#657b83", bg = "#073642" })
	vim.api.nvim_set_hl(0, "NonText", { fg = "#657b83", bg = "NONE", bold = true, cterm = { bold = true } })
	vim.api.nvim_set_hl(0, "SpecialKey", { fg = "#657b83", bg = "#073642", bold = true, cterm = { bold = true } })
	vim.api.nvim_set_hl(
		0,
		"SpellBad",
		{ fg = "#6c71c4", bg = "NONE", sp = "#6c71c4", undercurl = true, cterm = { underline = true } }
	)
	vim.api.nvim_set_hl(
		0,
		"SpellCap",
		{ fg = "#6c71c4", bg = "NONE", sp = "#6c71c4", undercurl = true, cterm = { underline = true } }
	)
	vim.api.nvim_set_hl(
		0,
		"SpellLocal",
		{ fg = "#b58900", bg = "NONE", sp = "#b58900", undercurl = true, cterm = { underline = true } }
	)
	vim.api.nvim_set_hl(
		0,
		"SpellRare",
		{ fg = "#2aa198", bg = "NONE", sp = "#2aa198", undercurl = true, cterm = { underline = true } }
	)
	vim.api.nvim_set_hl(0, "Title", { fg = "#cb4b16", bg = "NONE", bold = true, cterm = { bold = true } })
	vim.api.nvim_set_hl(0, "Cursor", { fg = "#fdf6e3", bg = "#268bd2" })
	vim.api.nvim_set_hl(0, "DiffAdd", { fg = "#859900", bg = "#073642", sp = "#859900" })
	vim.api.nvim_set_hl(0, "DiffChange", { fg = "#b58900", bg = "#073642", sp = "#b58900" })
	vim.api.nvim_set_hl(0, "DiffDelete", { fg = "#dc322f", bg = "#073642", bold = true, cterm = { bold = true } })
	vim.api.nvim_set_hl(0, "DiffText", { fg = "#268bd2", bg = "#073642", sp = "#268bd2" })
	vim.api.nvim_set_hl(0, "StatusLine", { fg = "#839496", bg = "#073642", reverse = true, cterm = { reverse = true } })
	vim.api.nvim_set_hl(
		0,
		"StatusLineNC",
		{ fg = "#586e75", bg = "#073642", reverse = true, cterm = { reverse = true } }
	)
	vim.api.nvim_set_hl(0, "TabLine", { fg = "#586e75", bg = "#073642", reverse = true, cterm = { reverse = true } })
	vim.api.nvim_set_hl(
		0,
		"TabLineFill",
		{ fg = "#586e75", bg = "#073642", reverse = true, cterm = { reverse = true } }
	)
	vim.api.nvim_set_hl(0, "TabLineSel", { fg = "#839496", bg = "#073642", reverse = true, cterm = { reverse = true } })
	vim.api.nvim_set_hl(0, "VertSplit", { fg = "#073642", bg = "#586e75" })
	vim.api.nvim_set_hl(0, "ColorColumn", { fg = "NONE", bg = "#073642" })
	vim.api.nvim_set_hl(0, "Conceal", { fg = "#268bd2", bg = "NONE" })
	vim.api.nvim_set_hl(0, "CursorColumn", { fg = "NONE", bg = "#073642" })
	vim.api.nvim_set_hl(0, "CursorLine", { fg = "NONE", bg = "#073642" })
	vim.api.nvim_set_hl(0, "Directory", { fg = "#268bd2", bg = "NONE" })
	vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = "NONE", bg = "NONE" })
	vim.api.nvim_set_hl(0, "ErrorMsg", { fg = "#dc322f", bg = "#fdf6e3", reverse = true, cterm = { reverse = true } })
	vim.api.nvim_set_hl(0, "IncSearch", { fg = "#cb4b16", bg = "NONE", standout = true, cterm = { standout = true } })
	vim.api.nvim_set_hl(0, "MatchParen", { fg = "#fdf6e3", bg = "#073642", bold = true, cterm = { bold = true } })
	vim.api.nvim_set_hl(0, "ModeMsg", { fg = "#268bd2", bg = "NONE" })
	vim.api.nvim_set_hl(0, "MoreMsg", { fg = "#268bd2", bg = "NONE" })
	vim.api.nvim_set_hl(0, "Pmenu", { fg = "#93a1a1", bg = "#073642" })
	vim.api.nvim_set_hl(0, "PmenuSbar", { fg = "NONE", bg = "#586e75" })
	vim.api.nvim_set_hl(0, "PmenuSel", { fg = "#eee8d5", bg = "#657b83" })
	vim.api.nvim_set_hl(0, "PmenuThumb", { fg = "NONE", bg = "#839496" })
	vim.api.nvim_set_hl(0, "Question", { fg = "#2aa198", bg = "NONE", bold = true, cterm = { bold = true } })
	vim.api.nvim_set_hl(0, "Search", { fg = "#b58900", bg = "NONE", reverse = true, cterm = { reverse = true } })
	vim.api.nvim_set_hl(0, "SignColumn", { fg = "#839496", bg = "#073642" })
	vim.api.nvim_set_hl(0, "Visual", { fg = "#586e75", bg = "#002b36", reverse = true, cterm = { reverse = true } })
	vim.api.nvim_set_hl(0, "VisualNOS", { fg = "NONE", bg = "#073642", reverse = true, cterm = { reverse = true } })
	vim.api.nvim_set_hl(0, "WarningMsg", { fg = "#cb4b16", bg = "NONE", bold = true, cterm = { bold = true } })
	vim.api.nvim_set_hl(0, "WildMenu", { fg = "#eee8d5", bg = "#073642", reverse = true, cterm = { reverse = true } })
	vim.api.nvim_set_hl(0, "Comment", { fg = "#586e75", bg = "NONE", italic = true, cterm = { italic = true } })
	vim.api.nvim_set_hl(0, "Constant", { fg = "#2aa198", bg = "NONE" })
	vim.api.nvim_set_hl(0, "CursorIM", { fg = "NONE", bg = "fg" })
	vim.api.nvim_set_hl(
		0,
		"Error",
		{ fg = "#dc322f", bg = "#fdf6e3", bold=true, reverse = true, cterm = { bold = true, reverse = true } }
	)
	vim.api.nvim_set_hl(0, "Identifier", { fg = "#268bd2", bg = "NONE" })
	vim.api.nvim_set_hl(0, "Ignore", { fg = "NONE", bg = "NONE" })
	vim.api.nvim_set_hl(0, "PreProc", { fg = "#cb4b16", bg = "NONE" })
	vim.api.nvim_set_hl(0, "Special", { fg = "#cb4b16", bg = "NONE" })
	vim.api.nvim_set_hl(0, "Statement", { fg = "#859900", bg = "NONE" })
	vim.api.nvim_set_hl(0, "Todo", { fg = "#d33682", bg = "NONE", bold = true, cterm = { bold = true } })
	vim.api.nvim_set_hl(0, "Type", { fg = "#b58900", bg = "NONE" })
	vim.api.nvim_set_hl(0, "Underlined", { fg = "#6c71c4", bg = "NONE" })
	vim.api.nvim_set_hl(0, "NormalMode", { fg = "#839496", bg = "#fdf6e3", reverse = true, cterm = { reverse = true } })
	vim.api.nvim_set_hl(0, "InsertMode", { fg = "#2aa198", bg = "#fdf6e3", reverse = true, cterm = { reverse = true } })
	vim.api.nvim_set_hl(
		0,
		"ReplaceMode",
		{ fg = "#cb4b16", bg = "#fdf6e3", reverse = true, cterm = { reverse = true } }
	)
	vim.api.nvim_set_hl(0, "VisualMode", { fg = "#d33682", bg = "#fdf6e3", reverse = true, cterm = { reverse = true } })
	vim.api.nvim_set_hl(
		0,
		"CommandMode",
		{ fg = "#d33682", bg = "#fdf6e3", reverse = true, cterm = { reverse = true } }
	)
	vim.api.nvim_set_hl(0, "@markup.strong", { fg = "fg", bg = "NONE", bold = true, cterm = { bold = true } })
	vim.api.nvim_set_hl(0, "@markup.emphasis", { fg = "fg", bg = "NONE", italic = true, cterm = { italic = true } })
	vim.api.nvim_set_hl(0, "TermCursorNC", { fg = "#002b36", bg = "#586e75" })
	vim.api.nvim_set_hl(0, "helpExample", { fg = "#93a1a1", bg = "NONE" })
	vim.api.nvim_set_hl(0, "helpOption", { fg = "#2aa198", bg = "NONE" })
	vim.api.nvim_set_hl(0, "helpNote", { fg = "#d33682", bg = "NONE" })
	vim.api.nvim_set_hl(0, "helpVim", { fg = "#d33682", bg = "NONE" })
	vim.api.nvim_set_hl(0, "helpHyperTextJump", { fg = "#268bd2", bg = "NONE" })
	vim.api.nvim_set_hl(0, "helpHyperTextEntry", { fg = "#859900", bg = "NONE" })
	vim.api.nvim_set_hl(0, "vimIsCommand", { fg = "#657b83", bg = "NONE" })
	vim.api.nvim_set_hl(0, "vimSynMtchOpt", { fg = "#b58900", bg = "NONE" })
	vim.api.nvim_set_hl(0, "vimSynType", { fg = "#2aa198", bg = "NONE" })
	vim.api.nvim_set_hl(0, "vimHiLink", { fg = "#268bd2", bg = "NONE" })
	vim.api.nvim_set_hl(0, "vimHiGroup", { fg = "#268bd2", bg = "NONE" })
	vim.api.nvim_set_hl(0, "vimGroup", { fg = "#268bd2", bg = "NONE", bold = true, cterm = { bold = true } })
	vim.api.nvim_set_hl(
		0,
		"gitcommitComment",
		{ fg = "#586e75", bg = "NONE", italic = true, cterm = { italic = true } }
	)
	vim.api.nvim_set_hl(0, "gitcommitUnmerged", { fg = "#859900", bg = "NONE", bold = true, cterm = { bold = true } })
	vim.api.nvim_set_hl(0, "gitcommitOnBranch", { fg = "#586e75", bg = "NONE", bold = true, cterm = { bold = true } })
	vim.api.nvim_set_hl(0, "gitcommitBranch", { fg = "#d33682", bg = "NONE", bold = true, cterm = { bold = true } })
	vim.api.nvim_set_hl(0, "gitcommitdiscardedtype", { fg = "#dc322f", bg = "NONE" })
	vim.api.nvim_set_hl(0, "gitcommitselectedtype", { fg = "#859900", bg = "NONE" })
	vim.api.nvim_set_hl(0, "gitcommitHeader", { fg = "#586e75", bg = "NONE" })
	vim.api.nvim_set_hl(
		0,
		"gitcommitUntrackedFile",
		{ fg = "#2aa198", bg = "NONE", bold = true, cterm = { bold = true } }
	)
	vim.api.nvim_set_hl(
		0,
		"gitcommitDiscardedFile",
		{ fg = "#dc322f", bg = "NONE", bold = true, cterm = { bold = true } }
	)
	vim.api.nvim_set_hl(
		0,
		"gitcommitSelectedFile",
		{ fg = "#859900", bg = "NONE", bold = true, cterm = { bold = true } }
	)
	vim.api.nvim_set_hl(
		0,
		"gitcommitUnmergedFile",
		{ fg = "#b58900", bg = "NONE", bold = true, cterm = { bold = true } }
	)
	vim.api.nvim_set_hl(0, "gitcommitFile", { fg = "#839496", bg = "NONE", bold = true, cterm = { bold = true } })
	vim.api.nvim_set_hl(0, "htmlTag", { fg = "#586e75", bg = "NONE" })
	vim.api.nvim_set_hl(0, "htmlEndTag", { fg = "#586e75", bg = "NONE" })
	vim.api.nvim_set_hl(0, "htmlTagN", { fg = "#93a1a1", bg = "NONE", bold = true, cterm = { bold = true } })
	vim.api.nvim_set_hl(0, "htmlTagName", { fg = "#268bd2", bg = "NONE", bold = true, cterm = { bold = true } })
	vim.api.nvim_set_hl(
		0,
		"htmlSpecialTagName",
		{ fg = "#268bd2", bg = "NONE", italic = true, cterm = { italic = true } }
	)
	vim.api.nvim_set_hl(0, "htmlArg", { fg = "#657b83", bg = "NONE" })
	vim.api.nvim_set_hl(0, "javaScript", { fg = "#b58900", bg = "NONE" })
	vim.api.nvim_set_hl(0, "perlHereDoc", { fg = "#93a1a1", bg = "NONE" })
	vim.api.nvim_set_hl(0, "perlVarPlain", { fg = "#b58900", bg = "NONE" })
	vim.api.nvim_set_hl(0, "perlStatementFileDesc", { fg = "#2aa198", bg = "NONE" })
	vim.api.nvim_set_hl(0, "texstatement", { fg = "#2aa198", bg = "NONE" })
	vim.api.nvim_set_hl(0, "texmathzonex", { fg = "#b58900", bg = "NONE" })
	vim.api.nvim_set_hl(0, "texmathmatcher", { fg = "#b58900", bg = "NONE" })
	vim.api.nvim_set_hl(0, "texreflabel", { fg = "#b58900", bg = "NONE" })
	vim.api.nvim_set_hl(0, "rubyDefine", { fg = "#93a1a1", bg = "NONE", bold = true, cterm = { bold = true } })
	vim.api.nvim_set_hl(0, "rubyBoolean", { fg = "#d33682", bg = "NONE" })
	vim.api.nvim_set_hl(0, "cPreCondit", { fg = "#cb4b16", bg = "NONE" })
	vim.api.nvim_set_hl(0, "VarId", { fg = "#268bd2", bg = "NONE" })
	vim.api.nvim_set_hl(0, "ConId", { fg = "#b58900", bg = "NONE" })
	vim.api.nvim_set_hl(0, "hsImport", { fg = "#d33682", bg = "NONE" })
	vim.api.nvim_set_hl(0, "hsString", { fg = "#657b83", bg = "NONE" })
	vim.api.nvim_set_hl(0, "hsStructure", { fg = "#2aa198", bg = "NONE" })
	vim.api.nvim_set_hl(0, "hs_hlFunctionName", { fg = "#268bd2", bg = "NONE" })
	vim.api.nvim_set_hl(0, "hsStatement", { fg = "#2aa198", bg = "NONE" })
	vim.api.nvim_set_hl(0, "hsImportLabel", { fg = "#2aa198", bg = "NONE" })
	vim.api.nvim_set_hl(0, "hs_OpFunctionName", { fg = "#b58900", bg = "NONE" })
	vim.api.nvim_set_hl(0, "hs_DeclareFunction", { fg = "#cb4b16", bg = "NONE" })
	vim.api.nvim_set_hl(0, "hsVarSym", { fg = "#2aa198", bg = "NONE" })
	vim.api.nvim_set_hl(0, "hsType", { fg = "#b58900", bg = "NONE" })
	vim.api.nvim_set_hl(0, "hsTypedef", { fg = "#2aa198", bg = "NONE" })
	vim.api.nvim_set_hl(0, "hsModuleName", { fg = "#859900", bg = "NONE" })
	vim.api.nvim_set_hl(0, "hsNiceOperator", { fg = "#2aa198", bg = "NONE" })
	vim.api.nvim_set_hl(0, "hsniceoperator", { fg = "#2aa198", bg = "NONE" })
	vim.api.nvim_set_hl(0, "pandocTitleBlock", { fg = "#268bd2", bg = "NONE" })
	vim.api.nvim_set_hl(
		0,
		"pandocTitleBlockTitle",
		{ fg = "#268bd2", bg = "NONE", bold = true, cterm = { bold = true } }
	)
	vim.api.nvim_set_hl(0, "pandocTitleComment", { fg = "#268bd2", bg = "NONE", bold = true, cterm = { bold = true } })
	vim.api.nvim_set_hl(0, "pandocComment", { fg = "#586e75", bg = "NONE", italic = true, cterm = { italic = true } })
	vim.api.nvim_set_hl(0, "pandocVerbatimBlock", { fg = "#b58900", bg = "NONE" })
	vim.api.nvim_set_hl(0, "pandocBlockQuote", { fg = "#268bd2", bg = "NONE" })
	vim.api.nvim_set_hl(0, "pandocBlockQuoteLeader1", { fg = "#268bd2", bg = "NONE" })
	vim.api.nvim_set_hl(0, "pandocBlockQuoteLeader2", { fg = "#2aa198", bg = "NONE" })
	vim.api.nvim_set_hl(0, "pandocBlockQuoteLeader3", { fg = "#b58900", bg = "NONE" })
	vim.api.nvim_set_hl(0, "pandocBlockQuoteLeader4", { fg = "#dc322f", bg = "NONE" })
	vim.api.nvim_set_hl(0, "pandocBlockQuoteLeader5", { fg = "#839496", bg = "NONE" })
	vim.api.nvim_set_hl(0, "pandocBlockQuoteLeader6", { fg = "#586e75", bg = "NONE" })
	vim.api.nvim_set_hl(0, "pandocListMarker", { fg = "#d33682", bg = "NONE" })
	vim.api.nvim_set_hl(0, "pandocListReference", { fg = "#d33682", bg = "NONE" })
	vim.api.nvim_set_hl(0, "pandocDefinitionBlock", { fg = "#6c71c4", bg = "NONE" })
	vim.api.nvim_set_hl(
		0,
		"pandocDefinitionTerm",
		{ fg = "#6c71c4", bg = "NONE", standout = true, cterm = { standout = true } }
	)
	vim.api.nvim_set_hl(
		0,
		"pandocDefinitionIndctr",
		{ fg = "#6c71c4", bg = "NONE", bold = true, cterm = { bold = true } }
	)
	vim.api.nvim_set_hl(
		0,
		"pandocEmphasisDefinition",
		{ fg = "#6c71c4", bg = "NONE", italic = true, cterm = { italic = true } }
	)
	vim.api.nvim_set_hl(
		0,
		"pandocEmphasisNestedDefinition",
		{ fg = "#6c71c4", bg = "NONE", bold = true, cterm = { bold = true } }
	)
	vim.api.nvim_set_hl(
		0,
		"pandocStrongEmphasisDefinition",
		{ fg = "#6c71c4", bg = "NONE", bold = true, cterm = { bold = true } }
	)
	vim.api.nvim_set_hl(
		0,
		"pandocStrongEmphasisNestedDefinition",
		{ fg = "#6c71c4", bg = "NONE", bold = true, cterm = { bold = true } }
	)
	vim.api.nvim_set_hl(
		0,
		"pandocStrongEmphasisEmphasisDefinition",
		{ fg = "#6c71c4", bg = "NONE", bold = true, cterm = { bold = true } }
	)
	vim.api.nvim_set_hl(
		0,
		"pandocStrikeoutDefinition",
		{ fg = "#6c71c4", bg = "NONE", reverse = true, cterm = { reverse = true } }
	)
	vim.api.nvim_set_hl(0, "pandocVerbatimInlineDefinition", { fg = "#6c71c4", bg = "NONE" })
	vim.api.nvim_set_hl(0, "pandocSuperscriptDefinition", { fg = "#6c71c4", bg = "NONE" })
	vim.api.nvim_set_hl(0, "pandocSubscriptDefinition", { fg = "#6c71c4", bg = "NONE" })
	vim.api.nvim_set_hl(0, "pandocTable", { fg = "#268bd2", bg = "NONE" })
	vim.api.nvim_set_hl(0, "pandocTableStructure", { fg = "#268bd2", bg = "NONE" })
	vim.api.nvim_set_hl(0, "pandocTableZebraLight", { fg = "#268bd2", bg = "#002b36" })
	vim.api.nvim_set_hl(0, "pandocTableZebraDark", { fg = "#268bd2", bg = "#073642" })
	vim.api.nvim_set_hl(
		0,
		"pandocEmphasisTable",
		{ fg = "#268bd2", bg = "NONE", italic = true, cterm = { italic = true } }
	)
	vim.api.nvim_set_hl(
		0,
		"pandocEmphasisNestedTable",
		{ fg = "#268bd2", bg = "NONE", bold = true, cterm = { bold = true } }
	)
	vim.api.nvim_set_hl(
		0,
		"pandocStrongEmphasisTable",
		{ fg = "#268bd2", bg = "NONE", bold = true, cterm = { bold = true } }
	)
	vim.api.nvim_set_hl(
		0,
		"pandocStrongEmphasisNestedTable",
		{ fg = "#268bd2", bg = "NONE", bold = true, cterm = { bold = true } }
	)
	vim.api.nvim_set_hl(
		0,
		"pandocStrongEmphasisEmphasisTable",
		{ fg = "#268bd2", bg = "NONE", bold = true, cterm = { bold = true } }
	)
	vim.api.nvim_set_hl(
		0,
		"pandocStrikeoutTable",
		{ fg = "#268bd2", bg = "NONE", reverse = true, cterm = { reverse = true } }
	)
	vim.api.nvim_set_hl(0, "pandocVerbatimInlineTable", { fg = "#268bd2", bg = "NONE" })
	vim.api.nvim_set_hl(0, "pandocSuperscriptTable", { fg = "#268bd2", bg = "NONE" })
	vim.api.nvim_set_hl(0, "pandocSubscriptTable", { fg = "#268bd2", bg = "NONE" })
	vim.api.nvim_set_hl(0, "pandocHeading", { fg = "#cb4b16", bg = "NONE", bold = true, cterm = { bold = true } })
	vim.api.nvim_set_hl(0, "pandocHeadingMarker", { fg = "#cb4b16", bg = "NONE", bold = true, cterm = { bold = true } })
	vim.api.nvim_set_hl(
		0,
		"pandocEmphasisHeading",
		{ fg = "#cb4b16", bg = "NONE", bold = true, cterm = { bold = true } }
	)
	vim.api.nvim_set_hl(
		0,
		"pandocEmphasisNestedHeading",
		{ fg = "#cb4b16", bg = "NONE", bold = true, cterm = { bold = true } }
	)
	vim.api.nvim_set_hl(
		0,
		"pandocStrongEmphasisHeading",
		{ fg = "#cb4b16", bg = "NONE", bold = true, cterm = { bold = true } }
	)
	vim.api.nvim_set_hl(
		0,
		"pandocStrongEmphasisNestedHeading",
		{ fg = "#cb4b16", bg = "NONE", bold = true, cterm = { bold = true } }
	)
	vim.api.nvim_set_hl(
		0,
		"pandocStrongEmphasisEmphasisHeading",
		{ fg = "#cb4b16", bg = "NONE", bold = true, cterm = { bold = true } }
	)
	vim.api.nvim_set_hl(
		0,
		"pandocStrikeoutHeading",
		{ fg = "#cb4b16", bg = "NONE", reverse = true, cterm = { reverse = true } }
	)
	vim.api.nvim_set_hl(
		0,
		"pandocVerbatimInlineHeading",
		{ fg = "#cb4b16", bg = "NONE", bold = true, cterm = { bold = true } }
	)
	vim.api.nvim_set_hl(
		0,
		"pandocSuperscriptHeading",
		{ fg = "#cb4b16", bg = "NONE", bold = true, cterm = { bold = true } }
	)
	vim.api.nvim_set_hl(
		0,
		"pandocSubscriptHeading",
		{ fg = "#cb4b16", bg = "NONE", bold = true, cterm = { bold = true } }
	)
	vim.api.nvim_set_hl(0, "pandocLinkDelim", { fg = "#586e75", bg = "NONE" })
	vim.api.nvim_set_hl(0, "pandocLinkLabel", { fg = "#268bd2", bg = "NONE" })
	vim.api.nvim_set_hl(0, "pandocLinkText", { fg = "#268bd2", bg = "NONE" })
	vim.api.nvim_set_hl(0, "pandocLinkURL", { fg = "#657b83", bg = "NONE" })
	vim.api.nvim_set_hl(0, "pandocLinkTitle", { fg = "#657b83", bg = "NONE" })
	vim.api.nvim_set_hl(0, "pandocLinkTitleDelim", { fg = "#586e75", bg = "NONE", sp = "#657b83" })
	vim.api.nvim_set_hl(0, "pandocLinkDefinition", { fg = "#2aa198", bg = "NONE", sp = "#657b83" })
	vim.api.nvim_set_hl(
		0,
		"pandocLinkDefinitionID",
		{ fg = "#268bd2", bg = "NONE", bold = true, cterm = { bold = true } }
	)
	vim.api.nvim_set_hl(0, "pandocImageCaption", { fg = "#6c71c4", bg = "NONE", bold = true, cterm = { bold = true } })
	vim.api.nvim_set_hl(0, "pandocFootnoteLink", { fg = "#859900", bg = "NONE" })
	vim.api.nvim_set_hl(
		0,
		"pandocFootnoteDefLink",
		{ fg = "#859900", bg = "NONE", bold = true, cterm = { bold = true } }
	)
	vim.api.nvim_set_hl(
		0,
		"pandocFootnoteInline",
		{ fg = "#859900", bg = "NONE", bold = true, cterm = { bold = true } }
	)
	vim.api.nvim_set_hl(0, "pandocFootnote", { fg = "#859900", bg = "NONE" })
	vim.api.nvim_set_hl(0, "pandocCitationDelim", { fg = "#d33682", bg = "NONE" })
	vim.api.nvim_set_hl(0, "pandocCitation", { fg = "#d33682", bg = "NONE" })
	vim.api.nvim_set_hl(0, "pandocCitationID", { fg = "#d33682", bg = "NONE" })
	vim.api.nvim_set_hl(0, "pandocCitationRef", { fg = "#d33682", bg = "NONE" })
	vim.api.nvim_set_hl(0, "pandocStyleDelim", { fg = "#586e75", bg = "NONE" })
	vim.api.nvim_set_hl(0, "pandocEmphasis", { fg = "#839496", bg = "NONE", italic = true, cterm = { italic = true } })
	vim.api.nvim_set_hl(
		0,
		"pandocEmphasisNested",
		{ fg = "#839496", bg = "NONE", bold = true, cterm = { bold = true } }
	)
	vim.api.nvim_set_hl(
		0,
		"pandocStrongEmphasis",
		{ fg = "#839496", bg = "NONE", bold = true, cterm = { bold = true } }
	)
	vim.api.nvim_set_hl(
		0,
		"pandocStrongEmphasisNested",
		{ fg = "#839496", bg = "NONE", bold = true, cterm = { bold = true } }
	)
	vim.api.nvim_set_hl(
		0,
		"pandocStrongEmphasisEmphasis",
		{ fg = "#839496", bg = "NONE", bold = true, cterm = { bold = true } }
	)
	vim.api.nvim_set_hl(
		0,
		"pandocStrikeout",
		{ fg = "#586e75", bg = "NONE", reverse = true, cterm = { reverse = true } }
	)
	vim.api.nvim_set_hl(0, "pandocVerbatimInline", { fg = "#b58900", bg = "NONE" })
	vim.api.nvim_set_hl(0, "pandocSuperscript", { fg = "#6c71c4", bg = "NONE" })
	vim.api.nvim_set_hl(0, "pandocSubscript", { fg = "#6c71c4", bg = "NONE" })
	vim.api.nvim_set_hl(0, "pandocRule", { fg = "#268bd2", bg = "NONE", bold = true, cterm = { bold = true } })
	vim.api.nvim_set_hl(0, "pandocRuleLine", { fg = "#268bd2", bg = "NONE", bold = true, cterm = { bold = true } })
	vim.api.nvim_set_hl(0, "pandocEscapePair", { fg = "#dc322f", bg = "NONE", bold = true, cterm = { bold = true } })
	vim.api.nvim_set_hl(0, "pandocCitationRef", { fg = "#d33682", bg = "NONE" })
	vim.api.nvim_set_hl(
		0,
		"pandocNonBreakingSpace",
		{ fg = "#dc322f", bg = "NONE", reverse = true, cterm = { reverse = true } }
	)
	vim.api.nvim_set_hl(0, "pandocMetadataDelim", { fg = "#586e75", bg = "NONE" })
	vim.api.nvim_set_hl(0, "pandocMetadata", { fg = "#268bd2", bg = "NONE" })
	vim.api.nvim_set_hl(0, "pandocMetadataKey", { fg = "#268bd2", bg = "NONE" })
	vim.api.nvim_set_hl(0, "pandocMetadata", { fg = "#268bd2", bg = "NONE", bold = true, cterm = { bold = true } })
	vim.api.nvim_set_hl(0, "ALEErrorSign", { fg = "#dc322f", bg = "#073642", bold = true, cterm = { bold = true } })
	vim.api.nvim_set_hl(0, "ALEInfoSign", { fg = "#2aa198", bg = "#073642", bold = true, cterm = { bold = true } })
	vim.api.nvim_set_hl(0, "ALEWarningSign", { fg = "#b58900", bg = "#073642", bold = true, cterm = { bold = true } })
	vim.api.nvim_set_hl(0, "ALEErrorSignLineNr", { fg = "#073642", bg = "#dc322f" })
	vim.api.nvim_set_hl(0, "ALEInfoSignLineNr", { fg = "#073642", bg = "#2aa198" })
	vim.api.nvim_set_hl(0, "ALEWarningSignLineNr", { fg = "#073642", bg = "#b58900" })
	vim.api.nvim_set_hl(
		0,
		"ALEError",
		{ fg = "#dc322f", bg = "NONE", sp = "#dc322f", undercurl = true, cterm = { undercurl = true } }
	)
	vim.api.nvim_set_hl(0, "ALEErrorLine", { fg = "NONE", bg = "NONE" })
	vim.api.nvim_set_hl(
		0,
		"ALEInfo",
		{ fg = "#2aa198", bg = "NONE", sp = "#2aa198", undercurl = true, cterm = { undercurl = true } }
	)
	vim.api.nvim_set_hl(0, "ALEInfoLine", { fg = "NONE", bg = "NONE" })
	vim.api.nvim_set_hl(
		0,
		"ALEWarning",
		{ fg = "#b58900", bg = "NONE", sp = "#b58900", undercurl = true, cterm = { undercurl = true } }
	)
	vim.api.nvim_set_hl(0, "ALEWarningLine", { fg = "NONE", bg = "NONE" })
elseif vim.opt.background:get() == "light" then
	vim.api.nvim_set_hl(0, "Normal", { fg = "#586e75", bg = "#fdf6e3" })
	vim.api.nvim_set_hl(0, "FoldColumn", { fg = "#657b83", bg = "#eee8d5" })
	vim.api.nvim_set_hl(
		0,
		"Folded",
		{ fg = "#657b83", bg = "#eee8d5", sp = "#fdf6e3", bold = true, cterm = { bold = true } }
	)
	vim.api.nvim_set_hl(0, "Terminal", { fg = "fg", bg = "#fdf6e3" })
	vim.api.nvim_set_hl(0, "ToolbarButton", { fg = "#586e75", bg = "#eee8d5", bold = true, cterm = { bold = true } })
	vim.api.nvim_set_hl(0, "ToolbarLine", { fg = "NONE", bg = "#eee8d5" })
	vim.api.nvim_set_hl(0, "Cursor", { fg = "#fdf6e3", bg = "#cb4b16" })
	vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#657b83", bg = "#eee8d5", bold = true, cterm = { bold = true } })
	vim.api.nvim_set_hl(0, "LineNr", { fg = "#839496", bg = "#eee8d5" })
	vim.api.nvim_set_hl(
		0,
		"MatchParen",
		{ fg = "#dc322f", bg = "#eee8d5", bold, underline = true, cterm = { bold, underline = true } }
	)
	vim.api.nvim_set_hl(0, "NonText", { fg = "#839496", bg = "NONE", bold = true, cterm = { bold = true } })
	vim.api.nvim_set_hl(0, "SpecialKey", { fg = "#839496", bg = "#eee8d5", bold = true, cterm = { bold = true } })
	vim.api.nvim_set_hl(
		0,
		"SpellBad",
		{ fg = "#d33682", bg = "NONE", sp = "#6c71c4", undercurl = true, cterm = { underline = true } }
	)
	vim.api.nvim_set_hl(
		0,
		"SpellCap",
		{ fg = "#d33682", bg = "NONE", sp = "#6c71c4", undercurl = true, cterm = { underline = true } }
	)
	vim.api.nvim_set_hl(
		0,
		"SpellLocal",
		{ fg = "#b58900", bg = "NONE", sp = "#b58900", undercurl = true, cterm = { underline = true } }
	)
	vim.api.nvim_set_hl(
		0,
		"SpellRare",
		{ fg = "#2aa198", bg = "NONE", sp = "#2aa198", undercurl = true, cterm = { underline = true } }
	)
	vim.api.nvim_set_hl(0, "Title", { fg = "#cb4b16", bg = "NONE", bold = true, cterm = { bold = true } })
	vim.api.nvim_set_hl(0, "DiffAdd", { fg = "#859900", bg = "#eee8d5", sp = "#859900" })
	vim.api.nvim_set_hl(0, "DiffChange", { fg = "#b58900", bg = "#eee8d5", sp = "#b58900" })
	vim.api.nvim_set_hl(0, "DiffDelete", { fg = "#dc322f", bg = "#eee8d5", bold = true, cterm = { bold = true } })
	vim.api.nvim_set_hl(0, "DiffText", { fg = "#268bd2", bg = "#eee8d5", sp = "#268bd2" })
	vim.api.nvim_set_hl(0, "StatusLine", { fg = "#586e75", bg = "#eee8d5", reverse = true, cterm = { reverse = true } })
	vim.api.nvim_set_hl(
		0,
		"StatusLineNC",
		{ fg = "#839496", bg = "#eee8d5", reverse = true, cterm = { reverse = true } }
	)
	vim.api.nvim_set_hl(0, "TabLine", { fg = "#839496", bg = "#eee8d5", reverse = true, cterm = { reverse = true } })
	vim.api.nvim_set_hl(
		0,
		"TabLineFill",
		{ fg = "#839496", bg = "#eee8d5", reverse = true, cterm = { reverse = true } }
	)
	vim.api.nvim_set_hl(0, "TabLineSel", { fg = "#586e75", bg = "#eee8d5", reverse = true, cterm = { reverse = true } })
	vim.api.nvim_set_hl(0, "VertSplit", { fg = "#586e75", bg = "#93a1a1" })
	vim.api.nvim_set_hl(0, "WildMenu", { fg = "#073642", bg = "#eee8d5", reverse = true, cterm = { reverse = true } })
	vim.api.nvim_set_hl(0, "ColorColumn", { fg = "NONE", bg = "#eee8d5" })
	vim.api.nvim_set_hl(0, "Conceal", { fg = "#268bd2", bg = "NONE" })
	vim.api.nvim_set_hl(0, "CursorColumn", { fg = "NONE", bg = "#eee8d5" })
	vim.api.nvim_set_hl(0, "CursorLine", { fg = "NONE", bg = "#eee8d5" })
	vim.api.nvim_set_hl(0, "Directory", { fg = "#268bd2", bg = "NONE" })
	vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = "NONE", bg = "NONE" })
	vim.api.nvim_set_hl(0, "ErrorMsg", { fg = "#dc322f", bg = "#fdf6e3", reverse = true, cterm = { reverse = true } })
	vim.api.nvim_set_hl(0, "IncSearch", { fg = "#cb4b16", bg = "NONE", standout = true, cterm = { standout = true } })
	vim.api.nvim_set_hl(0, "ModeMsg", { fg = "#268bd2", bg = "NONE" })
	vim.api.nvim_set_hl(0, "MoreMsg", { fg = "#268bd2", bg = "NONE" })
	vim.api.nvim_set_hl(0, "Pmenu", { fg = "#586e75", bg = "#eee8d5" })
	vim.api.nvim_set_hl(0, "PmenuSbar", { fg = "NONE", bg = "#93a1a1" })
	vim.api.nvim_set_hl(0, "PmenuSel", { fg = "#eee8d5", bg = "#839496" })
	vim.api.nvim_set_hl(0, "PmenuThumb", { fg = "NONE", bg = "#657b83" })
	vim.api.nvim_set_hl(0, "Question", { fg = "#2aa198", bg = "NONE", bold = true, cterm = { bold = true } })
	vim.api.nvim_set_hl(0, "Search", { fg = "#b58900", bg = "NONE", reverse = true, cterm = { reverse = true } })
	vim.api.nvim_set_hl(0, "SignColumn", { fg = "#657b83", bg = "#eee8d5" })
	vim.api.nvim_set_hl(0, "Visual", { fg = "#93a1a1", bg = "#fdf6e3", reverse = true, cterm = { reverse = true } })
	vim.api.nvim_set_hl(0, "VisualNOS", { fg = "NONE", bg = "#eee8d5", reverse = true, cterm = { reverse = true } })
	vim.api.nvim_set_hl(0, "WarningMsg", { fg = "#cb4b16", bg = "NONE", bold = true, cterm = { bold = true } })
	vim.api.nvim_set_hl(0, "Comment", { fg = "#93a1a1", bg = "NONE", italic = true, cterm = { italic = true } })
	vim.api.nvim_set_hl(0, "Constant", { fg = "#2aa198", bg = "NONE" })
	vim.api.nvim_set_hl(0, "CursorIM", { fg = "NONE", bg = "fg" })
	vim.api.nvim_set_hl(
		0,
		"Error",
		{ fg = "#dc322f", bg = "#fdf6e3", bold, reverse = true, cterm = { bold, reverse = true } }
	)
	vim.api.nvim_set_hl(0, "Identifier", { fg = "#268bd2", bg = "NONE" })
	vim.api.nvim_set_hl(0, "Ignore", { fg = "NONE", bg = "NONE" })
	vim.api.nvim_set_hl(0, "PreProc", { fg = "#cb4b16", bg = "NONE" })
	vim.api.nvim_set_hl(0, "Special", { fg = "#cb4b16", bg = "NONE" })
	vim.api.nvim_set_hl(0, "Statement", { fg = "#859900", bg = "NONE" })
	vim.api.nvim_set_hl(0, "Todo", { fg = "#d33682", bg = "NONE", bold = true, cterm = { bold = true } })
	vim.api.nvim_set_hl(0, "Type", { fg = "#b58900", bg = "NONE" })
	vim.api.nvim_set_hl(0, "Underlined", { fg = "#6c71c4", bg = "NONE" })
	vim.api.nvim_set_hl(0, "NormalMode", { fg = "#586e75", bg = "#fdf6e3", reverse = true, cterm = { reverse = true } })
	vim.api.nvim_set_hl(0, "InsertMode", { fg = "#2aa198", bg = "#fdf6e3", reverse = true, cterm = { reverse = true } })
	vim.api.nvim_set_hl(
		0,
		"ReplaceMode",
		{ fg = "#cb4b16", bg = "#fdf6e3", reverse = true, cterm = { reverse = true } }
	)
	vim.api.nvim_set_hl(0, "VisualMode", { fg = "#d33682", bg = "#fdf6e3", reverse = true, cterm = { reverse = true } })
	vim.api.nvim_set_hl(
		0,
		"CommandMode",
		{ fg = "#d33682", bg = "#fdf6e3", reverse = true, cterm = { reverse = true } }
	)
	vim.api.nvim_set_hl(0, "@markup.strong", { fg = "fg", bg = "NONE", bold = true, cterm = { bold = true } })
	vim.api.nvim_set_hl(0, "@markup.emphasis", { fg = "fg", bg = "NONE", italic = true, cterm = { italic = true } })
	vim.api.nvim_set_hl(0, "TermCursorNC", { fg = "#fdf6e3", bg = "#93a1a1" })
	vim.api.nvim_set_hl(0, "helpExample", { fg = "#586e75", bg = "NONE" })
	vim.api.nvim_set_hl(0, "helpOption", { fg = "#2aa198", bg = "NONE" })
	vim.api.nvim_set_hl(0, "helpNote", { fg = "#d33682", bg = "NONE" })
	vim.api.nvim_set_hl(0, "helpVim", { fg = "#d33682", bg = "NONE" })
	vim.api.nvim_set_hl(0, "helpHyperTextJump", { fg = "#268bd2", bg = "NONE" })
	vim.api.nvim_set_hl(0, "helpHyperTextEntry", { fg = "#859900", bg = "NONE" })
	vim.api.nvim_set_hl(0, "vimIsCommand", { fg = "#839496", bg = "NONE" })
	vim.api.nvim_set_hl(0, "vimSynMtchOpt", { fg = "#b58900", bg = "NONE" })
	vim.api.nvim_set_hl(0, "vimSynType", { fg = "#2aa198", bg = "NONE" })
	vim.api.nvim_set_hl(0, "vimHiLink", { fg = "#268bd2", bg = "NONE" })
	vim.api.nvim_set_hl(0, "vimHiGroup", { fg = "#268bd2", bg = "NONE" })
	vim.api.nvim_set_hl(0, "vimGroup", { fg = "#268bd2", bg = "NONE", bold = true, cterm = { bold = true } })
	vim.api.nvim_set_hl(
		0,
		"gitcommitComment",
		{ fg = "#93a1a1", bg = "NONE", italic = true, cterm = { italic = true } }
	)
	vim.api.nvim_set_hl(0, "gitcommitUnmerged", { fg = "#859900", bg = "NONE", bold = true, cterm = { bold = true } })
	vim.api.nvim_set_hl(0, "gitcommitOnBranch", { fg = "#93a1a1", bg = "NONE", bold = true, cterm = { bold = true } })
	vim.api.nvim_set_hl(0, "gitcommitBranch", { fg = "#d33682", bg = "NONE", bold = true, cterm = { bold = true } })
	vim.api.nvim_set_hl(0, "gitcommitdiscardedtype", { fg = "#dc322f", bg = "NONE" })
	vim.api.nvim_set_hl(0, "gitcommitselectedtype", { fg = "#859900", bg = "NONE" })
	vim.api.nvim_set_hl(0, "gitcommitHeader", { fg = "#93a1a1", bg = "NONE" })
	vim.api.nvim_set_hl(
		0,
		"gitcommitUntrackedFile",
		{ fg = "#2aa198", bg = "NONE", bold = true, cterm = { bold = true } }
	)
	vim.api.nvim_set_hl(
		0,
		"gitcommitDiscardedFile",
		{ fg = "#dc322f", bg = "NONE", bold = true, cterm = { bold = true } }
	)
	vim.api.nvim_set_hl(
		0,
		"gitcommitSelectedFile",
		{ fg = "#859900", bg = "NONE", bold = true, cterm = { bold = true } }
	)
	vim.api.nvim_set_hl(
		0,
		"gitcommitUnmergedFile",
		{ fg = "#b58900", bg = "NONE", bold = true, cterm = { bold = true } }
	)
	vim.api.nvim_set_hl(0, "gitcommitFile", { fg = "#657b83", bg = "NONE", bold = true, cterm = { bold = true } })
	vim.api.nvim_set_hl(0, "htmlTag", { fg = "#93a1a1", bg = "NONE" })
	vim.api.nvim_set_hl(0, "htmlEndTag", { fg = "#93a1a1", bg = "NONE" })
	vim.api.nvim_set_hl(0, "htmlTagN", { fg = "#586e75", bg = "NONE", bold = true, cterm = { bold = true } })
	vim.api.nvim_set_hl(0, "htmlTagName", { fg = "#268bd2", bg = "NONE", bold = true, cterm = { bold = true } })
	vim.api.nvim_set_hl(
		0,
		"htmlSpecialTagName",
		{ fg = "#268bd2", bg = "NONE", italic = true, cterm = { italic = true } }
	)
	vim.api.nvim_set_hl(0, "htmlArg", { fg = "#839496", bg = "NONE" })
	vim.api.nvim_set_hl(0, "javaScript", { fg = "#b58900", bg = "NONE" })
	vim.api.nvim_set_hl(0, "perlHereDoc", { fg = "#586e75", bg = "NONE" })
	vim.api.nvim_set_hl(0, "perlVarPlain", { fg = "#b58900", bg = "NONE" })
	vim.api.nvim_set_hl(0, "perlStatementFileDesc", { fg = "#2aa198", bg = "NONE" })
	vim.api.nvim_set_hl(0, "texstatement", { fg = "#2aa198", bg = "NONE" })
	vim.api.nvim_set_hl(0, "texmathzonex", { fg = "#b58900", bg = "NONE" })
	vim.api.nvim_set_hl(0, "texmathmatcher", { fg = "#b58900", bg = "NONE" })
	vim.api.nvim_set_hl(0, "texreflabel", { fg = "#b58900", bg = "NONE" })
	vim.api.nvim_set_hl(0, "rubyDefine", { fg = "#586e75", bg = "NONE", bold = true, cterm = { bold = true } })
	vim.api.nvim_set_hl(0, "rubyBoolean", { fg = "#d33682", bg = "NONE" })
	vim.api.nvim_set_hl(0, "cPreCondit", { fg = "#cb4b16", bg = "NONE" })
	vim.api.nvim_set_hl(0, "VarId", { fg = "#268bd2", bg = "NONE" })
	vim.api.nvim_set_hl(0, "ConId", { fg = "#b58900", bg = "NONE" })
	vim.api.nvim_set_hl(0, "hsImport", { fg = "#d33682", bg = "NONE" })
	vim.api.nvim_set_hl(0, "hsString", { fg = "#839496", bg = "NONE" })
	vim.api.nvim_set_hl(0, "hsStructure", { fg = "#2aa198", bg = "NONE" })
	vim.api.nvim_set_hl(0, "hs_hlFunctionName", { fg = "#268bd2", bg = "NONE" })
	vim.api.nvim_set_hl(0, "hsStatement", { fg = "#2aa198", bg = "NONE" })
	vim.api.nvim_set_hl(0, "hsImportLabel", { fg = "#2aa198", bg = "NONE" })
	vim.api.nvim_set_hl(0, "hs_OpFunctionName", { fg = "#b58900", bg = "NONE" })
	vim.api.nvim_set_hl(0, "hs_DeclareFunction", { fg = "#cb4b16", bg = "NONE" })
	vim.api.nvim_set_hl(0, "hsVarSym", { fg = "#2aa198", bg = "NONE" })
	vim.api.nvim_set_hl(0, "hsType", { fg = "#b58900", bg = "NONE" })
	vim.api.nvim_set_hl(0, "hsTypedef", { fg = "#2aa198", bg = "NONE" })
	vim.api.nvim_set_hl(0, "hsModuleName", { fg = "#859900", bg = "NONE" })
	vim.api.nvim_set_hl(0, "hsNiceOperator", { fg = "#2aa198", bg = "NONE" })
	vim.api.nvim_set_hl(0, "hsniceoperator", { fg = "#2aa198", bg = "NONE" })
	vim.api.nvim_set_hl(0, "pandocTitleBlock", { fg = "#268bd2", bg = "NONE" })
	vim.api.nvim_set_hl(
		0,
		"pandocTitleBlockTitle",
		{ fg = "#268bd2", bg = "NONE", bold = true, cterm = { bold = true } }
	)
	vim.api.nvim_set_hl(0, "pandocTitleComment", { fg = "#268bd2", bg = "NONE", bold = true, cterm = { bold = true } })
	vim.api.nvim_set_hl(0, "pandocComment", { fg = "#93a1a1", bg = "NONE", italic = true, cterm = { italic = true } })
	vim.api.nvim_set_hl(0, "pandocVerbatimBlock", { fg = "#b58900", bg = "NONE" })
	vim.api.nvim_set_hl(0, "pandocBlockQuote", { fg = "#268bd2", bg = "NONE" })
	vim.api.nvim_set_hl(0, "pandocBlockQuoteLeader1", { fg = "#268bd2", bg = "NONE" })
	vim.api.nvim_set_hl(0, "pandocBlockQuoteLeader2", { fg = "#2aa198", bg = "NONE" })
	vim.api.nvim_set_hl(0, "pandocBlockQuoteLeader3", { fg = "#b58900", bg = "NONE" })
	vim.api.nvim_set_hl(0, "pandocBlockQuoteLeader4", { fg = "#dc322f", bg = "NONE" })
	vim.api.nvim_set_hl(0, "pandocBlockQuoteLeader5", { fg = "#657b83", bg = "NONE" })
	vim.api.nvim_set_hl(0, "pandocBlockQuoteLeader6", { fg = "#93a1a1", bg = "NONE" })
	vim.api.nvim_set_hl(0, "pandocListMarker", { fg = "#d33682", bg = "NONE" })
	vim.api.nvim_set_hl(0, "pandocListReference", { fg = "#d33682", bg = "NONE" })
	vim.api.nvim_set_hl(0, "pandocDefinitionBlock", { fg = "#6c71c4", bg = "NONE" })
	vim.api.nvim_set_hl(
		0,
		"pandocDefinitionTerm",
		{ fg = "#6c71c4", bg = "NONE", standout = true, cterm = { standout = true } }
	)
	vim.api.nvim_set_hl(
		0,
		"pandocDefinitionIndctr",
		{ fg = "#6c71c4", bg = "NONE", bold = true, cterm = { bold = true } }
	)
	vim.api.nvim_set_hl(
		0,
		"pandocEmphasisDefinition",
		{ fg = "#6c71c4", bg = "NONE", italic = true, cterm = { italic = true } }
	)
	vim.api.nvim_set_hl(
		0,
		"pandocEmphasisNestedDefinition",
		{ fg = "#6c71c4", bg = "NONE", bold = true, cterm = { bold = true } }
	)
	vim.api.nvim_set_hl(
		0,
		"pandocStrongEmphasisDefinition",
		{ fg = "#6c71c4", bg = "NONE", bold = true, cterm = { bold = true } }
	)
	vim.api.nvim_set_hl(
		0,
		"pandocStrongEmphasisNestedDefinition",
		{ fg = "#6c71c4", bg = "NONE", bold = true, cterm = { bold = true } }
	)
	vim.api.nvim_set_hl(
		0,
		"pandocStrongEmphasisEmphasisDefinition",
		{ fg = "#6c71c4", bg = "NONE", bold = true, cterm = { bold = true } }
	)
	vim.api.nvim_set_hl(
		0,
		"pandocStrikeoutDefinition",
		{ fg = "#6c71c4", bg = "NONE", reverse = true, cterm = { reverse = true } }
	)
	vim.api.nvim_set_hl(0, "pandocVerbatimInlineDefinition", { fg = "#6c71c4", bg = "NONE" })
	vim.api.nvim_set_hl(0, "pandocSuperscriptDefinition", { fg = "#6c71c4", bg = "NONE" })
	vim.api.nvim_set_hl(0, "pandocSubscriptDefinition", { fg = "#6c71c4", bg = "NONE" })
	vim.api.nvim_set_hl(0, "pandocTable", { fg = "#268bd2", bg = "NONE" })
	vim.api.nvim_set_hl(0, "pandocTableStructure", { fg = "#268bd2", bg = "NONE" })
	vim.api.nvim_set_hl(0, "pandocTableZebraLight", { fg = "#268bd2", bg = "#fdf6e3" })
	vim.api.nvim_set_hl(0, "pandocTableZebraDark", { fg = "#268bd2", bg = "#eee8d5" })
	vim.api.nvim_set_hl(
		0,
		"pandocEmphasisTable",
		{ fg = "#268bd2", bg = "NONE", italic = true, cterm = { italic = true } }
	)
	vim.api.nvim_set_hl(
		0,
		"pandocEmphasisNestedTable",
		{ fg = "#268bd2", bg = "NONE", bold = true, cterm = { bold = true } }
	)
	vim.api.nvim_set_hl(
		0,
		"pandocStrongEmphasisTable",
		{ fg = "#268bd2", bg = "NONE", bold = true, cterm = { bold = true } }
	)
	vim.api.nvim_set_hl(
		0,
		"pandocStrongEmphasisNestedTable",
		{ fg = "#268bd2", bg = "NONE", bold = true, cterm = { bold = true } }
	)
	vim.api.nvim_set_hl(
		0,
		"pandocStrongEmphasisEmphasisTable",
		{ fg = "#268bd2", bg = "NONE", bold = true, cterm = { bold = true } }
	)
	vim.api.nvim_set_hl(
		0,
		"pandocStrikeoutTable",
		{ fg = "#268bd2", bg = "NONE", reverse = true, cterm = { reverse = true } }
	)
	vim.api.nvim_set_hl(0, "pandocVerbatimInlineTable", { fg = "#268bd2", bg = "NONE" })
	vim.api.nvim_set_hl(0, "pandocSuperscriptTable", { fg = "#268bd2", bg = "NONE" })
	vim.api.nvim_set_hl(0, "pandocSubscriptTable", { fg = "#268bd2", bg = "NONE" })
	vim.api.nvim_set_hl(0, "pandocHeading", { fg = "#cb4b16", bg = "NONE", bold = true, cterm = { bold = true } })
	vim.api.nvim_set_hl(0, "pandocHeadingMarker", { fg = "#cb4b16", bg = "NONE", bold = true, cterm = { bold = true } })
	vim.api.nvim_set_hl(
		0,
		"pandocEmphasisHeading",
		{ fg = "#cb4b16", bg = "NONE", bold = true, cterm = { bold = true } }
	)
	vim.api.nvim_set_hl(
		0,
		"pandocEmphasisNestedHeading",
		{ fg = "#cb4b16", bg = "NONE", bold = true, cterm = { bold = true } }
	)
	vim.api.nvim_set_hl(
		0,
		"pandocStrongEmphasisHeading",
		{ fg = "#cb4b16", bg = "NONE", bold = true, cterm = { bold = true } }
	)
	vim.api.nvim_set_hl(
		0,
		"pandocStrongEmphasisNestedHeading",
		{ fg = "#cb4b16", bg = "NONE", bold = true, cterm = { bold = true } }
	)
	vim.api.nvim_set_hl(
		0,
		"pandocStrongEmphasisEmphasisHeading",
		{ fg = "#cb4b16", bg = "NONE", bold = true, cterm = { bold = true } }
	)
	vim.api.nvim_set_hl(
		0,
		"pandocStrikeoutHeading",
		{ fg = "#cb4b16", bg = "NONE", reverse = true, cterm = { reverse = true } }
	)
	vim.api.nvim_set_hl(
		0,
		"pandocVerbatimInlineHeading",
		{ fg = "#cb4b16", bg = "NONE", bold = true, cterm = { bold = true } }
	)
	vim.api.nvim_set_hl(
		0,
		"pandocSuperscriptHeading",
		{ fg = "#cb4b16", bg = "NONE", bold = true, cterm = { bold = true } }
	)
	vim.api.nvim_set_hl(
		0,
		"pandocSubscriptHeading",
		{ fg = "#cb4b16", bg = "NONE", bold = true, cterm = { bold = true } }
	)
	vim.api.nvim_set_hl(0, "pandocLinkDelim", { fg = "#93a1a1", bg = "NONE" })
	vim.api.nvim_set_hl(0, "pandocLinkLabel", { fg = "#268bd2", bg = "NONE" })
	vim.api.nvim_set_hl(0, "pandocLinkText", { fg = "#268bd2", bg = "NONE" })
	vim.api.nvim_set_hl(0, "pandocLinkURL", { fg = "#839496", bg = "NONE" })
	vim.api.nvim_set_hl(0, "pandocLinkTitle", { fg = "#839496", bg = "NONE" })
	vim.api.nvim_set_hl(0, "pandocLinkTitleDelim", { fg = "#93a1a1", bg = "NONE", sp = "#839496" })
	vim.api.nvim_set_hl(0, "pandocLinkDefinition", { fg = "#2aa198", bg = "NONE", sp = "#839496" })
	vim.api.nvim_set_hl(
		0,
		"pandocLinkDefinitionID",
		{ fg = "#268bd2", bg = "NONE", bold = true, cterm = { bold = true } }
	)
	vim.api.nvim_set_hl(0, "pandocImageCaption", { fg = "#6c71c4", bg = "NONE", bold = true, cterm = { bold = true } })
	vim.api.nvim_set_hl(0, "pandocFootnoteLink", { fg = "#859900", bg = "NONE" })
	vim.api.nvim_set_hl(
		0,
		"pandocFootnoteDefLink",
		{ fg = "#859900", bg = "NONE", bold = true, cterm = { bold = true } }
	)
	vim.api.nvim_set_hl(
		0,
		"pandocFootnoteInline",
		{ fg = "#859900", bg = "NONE", bold = true, cterm = { bold = true } }
	)
	vim.api.nvim_set_hl(0, "pandocFootnote", { fg = "#859900", bg = "NONE" })
	vim.api.nvim_set_hl(0, "pandocCitationDelim", { fg = "#d33682", bg = "NONE" })
	vim.api.nvim_set_hl(0, "pandocCitation", { fg = "#d33682", bg = "NONE" })
	vim.api.nvim_set_hl(0, "pandocCitationID", { fg = "#d33682", bg = "NONE" })
	vim.api.nvim_set_hl(0, "pandocCitationRef", { fg = "#d33682", bg = "NONE" })
	vim.api.nvim_set_hl(0, "pandocStyleDelim", { fg = "#93a1a1", bg = "NONE" })
	vim.api.nvim_set_hl(0, "pandocEmphasis", { fg = "#657b83", bg = "NONE", italic = true, cterm = { italic = true } })
	vim.api.nvim_set_hl(
		0,
		"pandocEmphasisNested",
		{ fg = "#657b83", bg = "NONE", bold = true, cterm = { bold = true } }
	)
	vim.api.nvim_set_hl(
		0,
		"pandocStrongEmphasis",
		{ fg = "#657b83", bg = "NONE", bold = true, cterm = { bold = true } }
	)
	vim.api.nvim_set_hl(
		0,
		"pandocStrongEmphasisNested",
		{ fg = "#657b83", bg = "NONE", bold = true, cterm = { bold = true } }
	)
	vim.api.nvim_set_hl(
		0,
		"pandocStrongEmphasisEmphasis",
		{ fg = "#657b83", bg = "NONE", bold = true, cterm = { bold = true } }
	)
	vim.api.nvim_set_hl(
		0,
		"pandocStrikeout",
		{ fg = "#93a1a1", bg = "NONE", reverse = true, cterm = { reverse = true } }
	)
	vim.api.nvim_set_hl(0, "pandocVerbatimInline", { fg = "#b58900", bg = "NONE" })
	vim.api.nvim_set_hl(0, "pandocSuperscript", { fg = "#6c71c4", bg = "NONE" })
	vim.api.nvim_set_hl(0, "pandocSubscript", { fg = "#6c71c4", bg = "NONE" })
	vim.api.nvim_set_hl(0, "pandocRule", { fg = "#268bd2", bg = "NONE", bold = true, cterm = { bold = true } })
	vim.api.nvim_set_hl(0, "pandocRuleLine", { fg = "#268bd2", bg = "NONE", bold = true, cterm = { bold = true } })
	vim.api.nvim_set_hl(0, "pandocEscapePair", { fg = "#dc322f", bg = "NONE", bold = true, cterm = { bold = true } })
	vim.api.nvim_set_hl(0, "pandocCitationRef", { fg = "#d33682", bg = "NONE" })
	vim.api.nvim_set_hl(
		0,
		"pandocNonBreakingSpace",
		{ fg = "#dc322f", bg = "NONE", reverse = true, cterm = { reverse = true } }
	)
	vim.api.nvim_set_hl(0, "pandocMetadataDelim", { fg = "#93a1a1", bg = "NONE" })
	vim.api.nvim_set_hl(0, "pandocMetadata", { fg = "#268bd2", bg = "NONE" })
	vim.api.nvim_set_hl(0, "pandocMetadataKey", { fg = "#268bd2", bg = "NONE" })
	vim.api.nvim_set_hl(0, "pandocMetadata", { fg = "#268bd2", bg = "NONE", bold = true, cterm = { bold = true } })
else
	print("background", vim.opt.background:get(), "not found")
end

-- Background: dark
-- Color: base0    #839496   246     12
-- Color: base00   #657b83   66      11
-- Color: base01   #586e75   242     10
-- Color: base02   #073642   236      0
-- Color: base03   #002b36   235      8
-- Color: base1    #93a1a1   247     14
-- Color: base2    #eee8d5   254      7
-- Color: base3    #fdf6e3   230     15
-- Color: black     #002b36   235      8
--
-- Color: blue     #268bd2   32       4
-- Color: cyan     #2aa198   37       6
-- Color: green    #859900   106      2
-- Color: magenta  #d33682   162      5
-- Color: orange   #cb4b16   166      9
-- Color: red      #dc322f   160      1
-- Color: violet   #6c71c4   61      13
-- Color: yellow   #b58900   136      3
-- Term Colors: base02 red    green  yellow blue  magenta cyan  base2
-- Term Colors: base03 orange base01 base00 base0 violet  base1 base3

-- Background: light
-- Color: base0    #657b83   66        11
-- Color: base00   #839496   246       12
-- Color: base01   #93a1a1   247       14
-- Color: base02   #eee8d5   254        7
-- Color: base03   #fdf6e3   230       15
-- Color: base1    #586e75   242       10
-- Color: base2    #073642   236        0
-- Color: base3    #002b36   235        8
-- Color: black     #fdf6e3   230       15

-- Color: blue     #268bd2   32         4
-- Color: cyan     #2aa198   37         6
-- Color: green    #859900   106        2
-- Color: magenta  #d33682   162        5
-- Color: orange   #cb4b16   166        9
-- Color: red      #dc322f   160        1
-- Color: violet   #6c71c4   61        13
-- Color: yellow   #b58900   136        3
-- Term Colors: base2  red    green  yellow blue   magenta cyan   base02
-- Term Colors: base3  orange base1  base0  base00 violet  base01 base03
-- Background: any
