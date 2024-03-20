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
vim.g.terminal_color_1 = "#dc322f"
vim.g.terminal_color_2 = "#859900"
vim.g.terminal_color_3 = "#b58900"
vim.g.terminal_color_4 = "#268bd2"
vim.g.terminal_color_5 = "#d33682"
vim.g.terminal_color_6 = "#2aa198"
vim.g.terminal_color_7 = "#eee8d5" -- base2/base02
vim.g.terminal_color_8 = "#002b36" -- base03/base3
vim.g.terminal_color_9 = "#cb4b16"
vim.g.terminal_color_10 = "#586e75" --base01/base1
vim.g.terminal_color_11 = "#657b83" -- base00/base0
vim.g.terminal_color_12 = "#839496" -- base0/base00
vim.g.terminal_color_13 = "#6c71c4"
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

if vim.opt.background:get() == "dark" then
	-- custom colors I chose
	vim.api.nvim_set_hl(0, "@variable", { fg = "NONE", bg = "NONE" })
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
	vim.api.nvim_set_hl(0, "vimCommentString", { fg = "#6c71c4", bg = "NONE" })
	vim.api.nvim_set_hl(0, "vimCommand", { fg = "#b58900", bg = "NONE" })
	vim.api.nvim_set_hl(0, "vimCmdSep", { fg = "#268bd2", bg = "NONE", bold = true, cterm = { bold = true } })
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
	-- custom colors I chose
	vim.api.nvim_set_hl(0, "@variable", { fg = "NONE", bg = "NONE" })
	vim.cmd([[
  hi Normal guifg=#586e75 guibg=#fdf6e3 gui=NONE cterm=NONE
  hi FoldColumn guifg=#657b83 guibg=#eee8d5 gui=NONE cterm=NONE
  hi Folded guifg=#657b83 guibg=#eee8d5 guisp=#fdf6e3 gui=bold cterm=bold
  hi Terminal guifg=fg guibg=#fdf6e3 gui=NONE cterm=NONE
  hi ToolbarButton guifg=#586e75 guibg=#eee8d5 gui=bold cterm=bold
  hi ToolbarLine guifg=NONE guibg=#eee8d5 gui=NONE cterm=NONE

    hi Cursor guifg=#fdf6e3 guibg=#cb4b16 gui=NONE cterm=NONE
    hi CursorLineNr guifg=#657b83 guibg=#eee8d5 gui=bold cterm=bold
    hi LineNr guifg=#839496 guibg=#eee8d5 gui=NONE cterm=NONE
    hi MatchParen guifg=#dc322f guibg=#eee8d5 gui=bold,underline cterm=bold,underline
    hi NonText guifg=#839496 guibg=NONE gui=bold cterm=bold
    hi SpecialKey guifg=#839496 guibg=#eee8d5 gui=bold cterm=bold
    hi SpellBad guifg=#d33682 guibg=NONE guisp=#6c71c4 gui=undercurl cterm=underline
    hi SpellCap guifg=#d33682 guibg=NONE guisp=#6c71c4 gui=undercurl cterm=underline
    hi SpellLocal guifg=#b58900 guibg=NONE guisp=#b58900 gui=undercurl cterm=underline
    hi SpellRare guifg=#2aa198 guibg=NONE guisp=#2aa198 gui=undercurl cterm=underline
    hi Title guifg=#cb4b16 guibg=NONE gui=bold cterm=bold

    hi DiffAdd guifg=#859900 guibg=#eee8d5 guisp=#859900 gui=NONE cterm=NONE
    hi DiffChange guifg=#b58900 guibg=#eee8d5 guisp=#b58900 gui=NONE cterm=NONE
    hi DiffDelete guifg=#dc322f guibg=#eee8d5 gui=bold cterm=bold
    hi DiffText guifg=#268bd2 guibg=#eee8d5 guisp=#268bd2 gui=NONE cterm=NONE

    hi StatusLine guifg=#586e75 guibg=#eee8d5 gui=reverse cterm=reverse
    hi StatusLineNC guifg=#839496 guibg=#eee8d5 gui=reverse cterm=reverse
    hi TabLine guifg=#839496 guibg=#eee8d5 gui=reverse cterm=reverse
    hi TabLineFill guifg=#839496 guibg=#eee8d5 gui=reverse cterm=reverse
    hi TabLineSel guifg=#586e75 guibg=#eee8d5 gui=reverse cterm=reverse
    hi VertSplit guifg=#586e75 guibg=#93a1a1 gui=NONE cterm=NONE
    hi WildMenu guifg=#073642 guibg=#eee8d5 gui=reverse cterm=reverse

  hi ColorColumn guifg=NONE guibg=#eee8d5 gui=NONE cterm=NONE
  hi Conceal guifg=#268bd2 guibg=NONE gui=NONE cterm=NONE
  hi CursorColumn guifg=NONE guibg=#eee8d5 gui=NONE cterm=NONE
  hi CursorLine guifg=NONE guibg=#eee8d5 gui=NONE cterm=NONE
  hi Directory guifg=#268bd2 guibg=NONE gui=NONE cterm=NONE
  hi EndOfBuffer guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
  hi ErrorMsg guifg=#dc322f guibg=#fdf6e3 gui=reverse cterm=reverse
  hi IncSearch guifg=#cb4b16 guibg=NONE gui=standout cterm=standout
  hi ModeMsg guifg=#268bd2 guibg=NONE gui=NONE cterm=NONE
  hi MoreMsg guifg=#268bd2 guibg=NONE gui=NONE cterm=NONE
  hi Pmenu guifg=#586e75 guibg=#eee8d5 gui=NONE cterm=NONE
  hi PmenuSbar guifg=NONE guibg=#93a1a1 gui=NONE cterm=NONE
  hi PmenuSel guifg=#eee8d5 guibg=#839496 gui=NONE cterm=NONE
  hi PmenuThumb guifg=NONE guibg=#657b83 gui=NONE cterm=NONE
  hi Question guifg=#2aa198 guibg=NONE gui=bold cterm=bold
  hi Search guifg=#b58900 guibg=NONE gui=reverse cterm=reverse
  hi SignColumn guifg=#657b83 guibg=#eee8d5 gui=NONE cterm=NONE
  hi Visual guifg=#93a1a1 guibg=#fdf6e3 gui=reverse cterm=reverse
  hi VisualNOS guifg=NONE guibg=#eee8d5 gui=reverse cterm=reverse
  hi WarningMsg guifg=#cb4b16 guibg=NONE gui=bold cterm=bold
  hi Comment guifg=#93a1a1 guibg=NONE gui=italic cterm=italic
  hi Constant guifg=#2aa198 guibg=NONE gui=NONE cterm=NONE
  hi CursorIM guifg=NONE guibg=fg gui=NONE cterm=NONE
  hi Error guifg=#dc322f guibg=#fdf6e3 gui=bold,reverse cterm=bold,reverse
  hi Identifier guifg=#268bd2 guibg=NONE gui=NONE cterm=NONE
  hi Ignore guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
  hi PreProc guifg=#cb4b16 guibg=NONE gui=NONE cterm=NONE
  hi Special guifg=#cb4b16 guibg=NONE gui=NONE cterm=NONE
  hi Statement guifg=#859900 guibg=NONE gui=NONE cterm=NONE
  hi Todo guifg=#d33682 guibg=NONE gui=bold cterm=bold
  hi Type guifg=#b58900 guibg=NONE gui=NONE cterm=NONE
  hi Underlined guifg=#6c71c4 guibg=NONE gui=NONE cterm=NONE
  hi NormalMode guifg=#586e75 guibg=#fdf6e3 gui=reverse cterm=reverse
  hi InsertMode guifg=#2aa198 guibg=#fdf6e3 gui=reverse cterm=reverse
  hi ReplaceMode guifg=#cb4b16 guibg=#fdf6e3 gui=reverse cterm=reverse
  hi VisualMode guifg=#d33682 guibg=#fdf6e3 gui=reverse cterm=reverse
  hi CommandMode guifg=#d33682 guibg=#fdf6e3 gui=reverse cterm=reverse
  hi @markup.strong guifg=fg guibg=NONE gui=bold cterm=bold
  hi @markup.emphasis guifg=fg guibg=NONE gui=italic cterm=italic
  hi! link TermCursor Cursor
  hi TermCursorNC guifg=#fdf6e3 guibg=#93a1a1 gui=NONE cterm=NONE
    hi! link vimVar Identifier
    hi! link vimFunc Function
    hi! link vimUserFunc Function
    hi! link helpSpecial Special
    hi vimCommentString guifg=#6c71c4 guibg=NONE gui=NONE cterm=NONE
    hi vimCommand guifg=#b58900 guibg=NONE gui=NONE cterm=NONE
    hi vimCmdSep guifg=#268bd2 guibg=NONE gui=bold cterm=bold
    hi helpExample guifg=#586e75 guibg=NONE gui=NONE cterm=NONE
    hi helpOption guifg=#2aa198 guibg=NONE gui=NONE cterm=NONE
    hi helpNote guifg=#d33682 guibg=NONE gui=NONE cterm=NONE
    hi helpVim guifg=#d33682 guibg=NONE gui=NONE cterm=NONE
    hi helpHyperTextJump guifg=#268bd2 guibg=NONE gui=NONE cterm=NONE
    hi helpHyperTextEntry guifg=#859900 guibg=NONE gui=NONE cterm=NONE
    hi vimIsCommand guifg=#839496 guibg=NONE gui=NONE cterm=NONE
    hi vimSynMtchOpt guifg=#b58900 guibg=NONE gui=NONE cterm=NONE
    hi vimSynType guifg=#2aa198 guibg=NONE gui=NONE cterm=NONE
    hi vimHiLink guifg=#268bd2 guibg=NONE gui=NONE cterm=NONE
    hi vimHiGroup guifg=#268bd2 guibg=NONE gui=NONE cterm=NONE
    hi vimGroup guifg=#268bd2 guibg=NONE gui=bold cterm=bold
    hi! link diffAdded Statement
    hi! link diffLine Identifier
    hi gitcommitComment guifg=#93a1a1 guibg=NONE gui=italic cterm=italic
    hi! link gitcommitUntracked gitcommitComment
    hi! link gitcommitDiscarded gitcommitComment
    hi! link gitcommitSelected gitcommitComment
    hi gitcommitUnmerged guifg=#859900 guibg=NONE gui=bold cterm=bold
    hi gitcommitOnBranch guifg=#93a1a1 guibg=NONE gui=bold cterm=bold
    hi gitcommitBranch guifg=#d33682 guibg=NONE gui=bold cterm=bold
    hi! link gitcommitNoBranch gitcommitBranch
    hi gitcommitdiscardedtype guifg=#dc322f guibg=NONE gui=NONE cterm=NONE
    hi gitcommitselectedtype guifg=#859900 guibg=NONE gui=NONE cterm=NONE
    hi gitcommitHeader guifg=#93a1a1 guibg=NONE gui=NONE cterm=NONE
    hi gitcommitUntrackedFile guifg=#2aa198 guibg=NONE gui=bold cterm=bold
    hi gitcommitDiscardedFile guifg=#dc322f guibg=NONE gui=bold cterm=bold
    hi gitcommitSelectedFile guifg=#859900 guibg=NONE gui=bold cterm=bold
    hi gitcommitUnmergedFile guifg=#b58900 guibg=NONE gui=bold cterm=bold
    hi gitcommitFile guifg=#657b83 guibg=NONE gui=bold cterm=bold
    hi! link gitcommitDiscardedArrow gitcommitDiscardedFile
    hi! link gitcommitSelectedArrow gitcommitSelectedFile
    hi! link gitcommitUnmergedArrow gitcommitUnmergedFile
    hi htmlTag guifg=#93a1a1 guibg=NONE gui=NONE cterm=NONE
    hi htmlEndTag guifg=#93a1a1 guibg=NONE gui=NONE cterm=NONE
    hi htmlTagN guifg=#586e75 guibg=NONE gui=bold cterm=bold
    hi htmlTagName guifg=#268bd2 guibg=NONE gui=bold cterm=bold
    hi htmlSpecialTagName guifg=#268bd2 guibg=NONE gui=italic cterm=italic
    hi htmlArg guifg=#839496 guibg=NONE gui=NONE cterm=NONE
    hi javaScript guifg=#b58900 guibg=NONE gui=NONE cterm=NONE
    hi! link jsFuncCall Function
    hi perlHereDoc guifg=#586e75 guibg=NONE gui=NONE cterm=NONE
    hi perlVarPlain guifg=#b58900 guibg=NONE gui=NONE cterm=NONE
    hi perlStatementFileDesc guifg=#2aa198 guibg=NONE gui=NONE cterm=NONE
    hi texstatement guifg=#2aa198 guibg=NONE gui=NONE cterm=NONE
    hi texmathzonex guifg=#b58900 guibg=NONE gui=NONE cterm=NONE
    hi texmathmatcher guifg=#b58900 guibg=NONE gui=NONE cterm=NONE
    hi texreflabel guifg=#b58900 guibg=NONE gui=NONE cterm=NONE
    hi rubyDefine guifg=#586e75 guibg=NONE gui=bold cterm=bold
    hi! link rubySymbol Type
    hi rubyBoolean guifg=#d33682 guibg=NONE gui=NONE cterm=NONE
    hi cPreCondit guifg=#cb4b16 guibg=NONE gui=NONE cterm=NONE
    hi VarId guifg=#268bd2 guibg=NONE gui=NONE cterm=NONE
    hi ConId guifg=#b58900 guibg=NONE gui=NONE cterm=NONE
    hi hsImport guifg=#d33682 guibg=NONE gui=NONE cterm=NONE
    hi hsString guifg=#839496 guibg=NONE gui=NONE cterm=NONE
    hi hsStructure guifg=#2aa198 guibg=NONE gui=NONE cterm=NONE
    hi hs_hlFunctionName guifg=#268bd2 guibg=NONE gui=NONE cterm=NONE
    hi hsStatement guifg=#2aa198 guibg=NONE gui=NONE cterm=NONE
    hi hsImportLabel guifg=#2aa198 guibg=NONE gui=NONE cterm=NONE
    hi hs_OpFunctionName guifg=#b58900 guibg=NONE gui=NONE cterm=NONE
    hi hs_DeclareFunction guifg=#cb4b16 guibg=NONE gui=NONE cterm=NONE
    hi hsVarSym guifg=#2aa198 guibg=NONE gui=NONE cterm=NONE
    hi hsType guifg=#b58900 guibg=NONE gui=NONE cterm=NONE
    hi hsTypedef guifg=#2aa198 guibg=NONE gui=NONE cterm=NONE
    hi hsModuleName guifg=#859900 guibg=NONE gui=NONE cterm=NONE
    hi! link hsImportParams Delimiter
    hi! link hsDelimTypeExport Delimiter
    hi! link hsModuleStartLabel hsStructure
    hi! link hsModuleWhereLabel hsModuleStartLabel
    hi hsNiceOperator guifg=#2aa198 guibg=NONE gui=NONE cterm=NONE
    hi hsniceoperator guifg=#2aa198 guibg=NONE gui=NONE cterm=NONE
    " let hs_highlight_boolean=1
    " let hs_highlight_delimiters=1
    hi pandocTitleBlock guifg=#268bd2 guibg=NONE gui=NONE cterm=NONE
    hi pandocTitleBlockTitle guifg=#268bd2 guibg=NONE gui=bold cterm=bold
    hi pandocTitleComment guifg=#268bd2 guibg=NONE gui=bold cterm=bold
    hi pandocComment guifg=#93a1a1 guibg=NONE gui=italic cterm=italic
    hi pandocVerbatimBlock guifg=#b58900 guibg=NONE gui=NONE cterm=NONE
    hi! link pandocVerbatimBlockDeep pandocVerbatimBlock
    hi! link pandocCodeBlock pandocVerbatimBlock
    hi! link pandocCodeBlockDelim pandocVerbatimBlock
    hi pandocBlockQuote guifg=#268bd2 guibg=NONE gui=NONE cterm=NONE
    hi pandocBlockQuoteLeader1 guifg=#268bd2 guibg=NONE gui=NONE cterm=NONE
    hi pandocBlockQuoteLeader2 guifg=#2aa198 guibg=NONE gui=NONE cterm=NONE
    hi pandocBlockQuoteLeader3 guifg=#b58900 guibg=NONE gui=NONE cterm=NONE
    hi pandocBlockQuoteLeader4 guifg=#dc322f guibg=NONE gui=NONE cterm=NONE
    hi pandocBlockQuoteLeader5 guifg=#657b83 guibg=NONE gui=NONE cterm=NONE
    hi pandocBlockQuoteLeader6 guifg=#93a1a1 guibg=NONE gui=NONE cterm=NONE
    hi pandocListMarker guifg=#d33682 guibg=NONE gui=NONE cterm=NONE
    hi pandocListReference guifg=#d33682 guibg=NONE gui=NONE cterm=NONE
    hi pandocDefinitionBlock guifg=#6c71c4 guibg=NONE gui=NONE cterm=NONE
    hi pandocDefinitionTerm guifg=#6c71c4 guibg=NONE gui=standout cterm=standout
    hi pandocDefinitionIndctr guifg=#6c71c4 guibg=NONE gui=bold cterm=bold
    hi pandocEmphasisDefinition guifg=#6c71c4 guibg=NONE gui=italic cterm=italic
    hi pandocEmphasisNestedDefinition guifg=#6c71c4 guibg=NONE gui=bold cterm=bold
    hi pandocStrongEmphasisDefinition guifg=#6c71c4 guibg=NONE gui=bold cterm=bold
    hi pandocStrongEmphasisNestedDefinition guifg=#6c71c4 guibg=NONE gui=bold cterm=bold
    hi pandocStrongEmphasisEmphasisDefinition guifg=#6c71c4 guibg=NONE gui=bold cterm=bold
    hi pandocStrikeoutDefinition guifg=#6c71c4 guibg=NONE gui=reverse cterm=reverse
    hi pandocVerbatimInlineDefinition guifg=#6c71c4 guibg=NONE gui=NONE cterm=NONE
    hi pandocSuperscriptDefinition guifg=#6c71c4 guibg=NONE gui=NONE cterm=NONE
    hi pandocSubscriptDefinition guifg=#6c71c4 guibg=NONE gui=NONE cterm=NONE
    hi pandocTable guifg=#268bd2 guibg=NONE gui=NONE cterm=NONE
    hi pandocTableStructure guifg=#268bd2 guibg=NONE gui=NONE cterm=NONE
    hi! link pandocTableStructureTop pandocTableStructre
    hi! link pandocTableStructureEnd pandocTableStructre
    hi pandocTableZebraLight guifg=#268bd2 guibg=#fdf6e3 gui=NONE cterm=NONE
    hi pandocTableZebraDark guifg=#268bd2 guibg=#eee8d5 gui=NONE cterm=NONE
    hi pandocEmphasisTable guifg=#268bd2 guibg=NONE gui=italic cterm=italic
    hi pandocEmphasisNestedTable guifg=#268bd2 guibg=NONE gui=bold cterm=bold
    hi pandocStrongEmphasisTable guifg=#268bd2 guibg=NONE gui=bold cterm=bold
    hi pandocStrongEmphasisNestedTable guifg=#268bd2 guibg=NONE gui=bold cterm=bold
    hi pandocStrongEmphasisEmphasisTable guifg=#268bd2 guibg=NONE gui=bold cterm=bold
    hi pandocStrikeoutTable guifg=#268bd2 guibg=NONE gui=reverse cterm=reverse
    hi pandocVerbatimInlineTable guifg=#268bd2 guibg=NONE gui=NONE cterm=NONE
    hi pandocSuperscriptTable guifg=#268bd2 guibg=NONE gui=NONE cterm=NONE
    hi pandocSubscriptTable guifg=#268bd2 guibg=NONE gui=NONE cterm=NONE
    hi pandocHeading guifg=#cb4b16 guibg=NONE gui=bold cterm=bold
    hi pandocHeadingMarker guifg=#cb4b16 guibg=NONE gui=bold cterm=bold
    hi pandocEmphasisHeading guifg=#cb4b16 guibg=NONE gui=bold cterm=bold
    hi pandocEmphasisNestedHeading guifg=#cb4b16 guibg=NONE gui=bold cterm=bold
    hi pandocStrongEmphasisHeading guifg=#cb4b16 guibg=NONE gui=bold cterm=bold
    hi pandocStrongEmphasisNestedHeading guifg=#cb4b16 guibg=NONE gui=bold cterm=bold
    hi pandocStrongEmphasisEmphasisHeading guifg=#cb4b16 guibg=NONE gui=bold cterm=bold
    hi pandocStrikeoutHeading guifg=#cb4b16 guibg=NONE gui=reverse cterm=reverse
    hi pandocVerbatimInlineHeading guifg=#cb4b16 guibg=NONE gui=bold cterm=bold
    hi pandocSuperscriptHeading guifg=#cb4b16 guibg=NONE gui=bold cterm=bold
    hi pandocSubscriptHeading guifg=#cb4b16 guibg=NONE gui=bold cterm=bold
    hi pandocLinkDelim guifg=#93a1a1 guibg=NONE gui=NONE cterm=NONE
    hi pandocLinkLabel guifg=#268bd2 guibg=NONE gui=NONE cterm=NONE
    hi pandocLinkText guifg=#268bd2 guibg=NONE gui=NONE cterm=NONE
    hi pandocLinkURL guifg=#839496 guibg=NONE gui=NONE cterm=NONE
    hi pandocLinkTitle guifg=#839496 guibg=NONE gui=NONE cterm=NONE
    hi pandocLinkTitleDelim guifg=#93a1a1 guibg=NONE guisp=#839496 gui=NONE cterm=NONE
    hi pandocLinkDefinition guifg=#2aa198 guibg=NONE guisp=#839496 gui=NONE cterm=NONE
    hi pandocLinkDefinitionID guifg=#268bd2 guibg=NONE gui=bold cterm=bold
    hi pandocImageCaption guifg=#6c71c4 guibg=NONE gui=bold cterm=bold
    hi pandocFootnoteLink guifg=#859900 guibg=NONE gui=NONE cterm=NONE
    hi pandocFootnoteDefLink guifg=#859900 guibg=NONE gui=bold cterm=bold
    hi pandocFootnoteInline guifg=#859900 guibg=NONE gui=bold cterm=bold
    hi pandocFootnote guifg=#859900 guibg=NONE gui=NONE cterm=NONE
    hi pandocCitationDelim guifg=#d33682 guibg=NONE gui=NONE cterm=NONE
    hi pandocCitation guifg=#d33682 guibg=NONE gui=NONE cterm=NONE
    hi pandocCitationID guifg=#d33682 guibg=NONE gui=NONE cterm=NONE
    hi pandocCitationRef guifg=#d33682 guibg=NONE gui=NONE cterm=NONE
    hi pandocStyleDelim guifg=#93a1a1 guibg=NONE gui=NONE cterm=NONE
    hi pandocEmphasis guifg=#657b83 guibg=NONE gui=italic cterm=italic
    hi pandocEmphasisNested guifg=#657b83 guibg=NONE gui=bold cterm=bold
    hi pandocStrongEmphasis guifg=#657b83 guibg=NONE gui=bold cterm=bold
    hi pandocStrongEmphasisNested guifg=#657b83 guibg=NONE gui=bold cterm=bold
    hi pandocStrongEmphasisEmphasis guifg=#657b83 guibg=NONE gui=bold cterm=bold
    hi pandocStrikeout guifg=#93a1a1 guibg=NONE gui=reverse cterm=reverse
    hi pandocVerbatimInline guifg=#b58900 guibg=NONE gui=NONE cterm=NONE
    hi pandocSuperscript guifg=#6c71c4 guibg=NONE gui=NONE cterm=NONE
    hi pandocSubscript guifg=#6c71c4 guibg=NONE gui=NONE cterm=NONE
    hi pandocRule guifg=#268bd2 guibg=NONE gui=bold cterm=bold
    hi pandocRuleLine guifg=#268bd2 guibg=NONE gui=bold cterm=bold
    hi pandocEscapePair guifg=#dc322f guibg=NONE gui=bold cterm=bold
    hi pandocCitationRef guifg=#d33682 guibg=NONE gui=NONE cterm=NONE
    hi pandocNonBreakingSpace guifg=#dc322f guibg=NONE gui=reverse cterm=reverse
    hi! link pandocEscapedCharacter pandocEscapePair
    hi! link pandocLineBreak pandocEscapePair
    hi pandocMetadataDelim guifg=#93a1a1 guibg=NONE gui=NONE cterm=NONE
    hi pandocMetadata guifg=#268bd2 guibg=NONE gui=NONE cterm=NONE
    hi pandocMetadataKey guifg=#268bd2 guibg=NONE gui=NONE cterm=NONE
    hi pandocMetadata guifg=#268bd2 guibg=NONE gui=bold cterm=bold
    hi! link pandocMetadataTitle pandocMetadata
        hi ALEErrorSign guifg=#dc322f guibg=#eee8d5 gui=bold cterm=bold
        hi ALEInfoSign guifg=#2aa198 guibg=#eee8d5 gui=bold cterm=bold
        hi ALEWarningSign guifg=#b58900 guibg=#eee8d5 gui=bold cterm=bold
      hi ALEErrorSignLineNr guifg=#eee8d5 guibg=#dc322f gui=NONE cterm=NONE
      hi ALEInfoSignLineNr guifg=#eee8d5 guibg=#2aa198 gui=NONE cterm=NONE
      hi ALEWarningSignLineNr guifg=#eee8d5 guibg=#b58900 gui=NONE cterm=NONE
   
    hi ALEError guifg=#dc322f guibg=NONE guisp=#dc322f gui=undercurl cterm=undercurl
    hi ALEErrorLine guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
    hi ALEInfo guifg=#2aa198 guibg=NONE guisp=#2aa198 gui=undercurl cterm=undercurl
    hi ALEInfoLine guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
    hi ALEWarning guifg=#b58900 guibg=NONE guisp=#b58900 gui=undercurl cterm=undercurl
    hi ALEWarningLine guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
    hi! link ALEStyleError ALEError
    hi! link ALEStyleErrorSign ALEErrorSign
    hi! link ALEStyleErrorSignLineNr ALEErrorSignLineNr
    hi! link ALEStyleWarning ALEWarning
    hi! link ALEStyleWarningSign ALEWarningSign
    hi! link ALEStyleWarningSignLineNr ALEWarningSignLineNr
    hi! link CocMenuSel PmenuSel
    ]])
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
