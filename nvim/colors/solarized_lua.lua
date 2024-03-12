vim.cmd.highlight("clear")

vim.g.colors_name = "solarized_lua"
-- vim.g.colors_name = "soluarized"

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

-- light
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
local c = {
	blue = "#268bd2",
	cyan = "#2aa198",
	green = "#859900",
	magenta = "#d33682",
	orange = "#cb4b16",
	red = "#dc322f",
	violet = "#6c71c4",
	yellow = "#b58900",
	d = { base0 = "#839496" },
	l = { base0 = "#657b83" },
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
vim.g.terminal_color_8 = "#002b36" -- base03,black/base3
vim.g.terminal_color_9 = "#cb4b16"
vim.g.terminal_color_10 = "#586e75" --base01/base1
vim.g.terminal_color_11 = "#657b83" -- base00/base0
vim.g.terminal_color_12 = "#839496" -- base0/base00
vim.g.terminal_color_13 = "#6c71c4"
vim.g.terminal_color_14 = "#93a1a1" -- base1/base01
vim.g.terminal_color_15 = "#fdf6e3" -- base3/base03,black

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

if vim.opt.background:get() == "dark" then
	-- hi Normal guifg=#586e75 guibg=#fdf6e3 gui=NONE cterm=NONE
	-- https://neovim.io/doc/user/api.html#nvim_set_hl()
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

	vim.cmd([[

        hi Directory guifg=#268bd2 guibg=NONE gui=NONE cterm=NONE
        hi EndOfBuffer guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
        hi ErrorMsg guifg=#dc322f guibg=#fdf6e3 gui=reverse cterm=reverse
        hi IncSearch guifg=#cb4b16 guibg=NONE gui=standout cterm=standout
        hi MatchParen guifg=#fdf6e3 guibg=#073642 gui=bold cterm=bold
        hi ModeMsg guifg=#268bd2 guibg=NONE gui=NONE cterm=NONE
        hi MoreMsg guifg=#268bd2 guibg=NONE gui=NONE cterm=NONE
        hi Pmenu guifg=#93a1a1 guibg=#073642 gui=NONE cterm=NONE
        hi PmenuSbar guifg=NONE guibg=#586e75 gui=NONE cterm=NONE
        hi PmenuSel guifg=#eee8d5 guibg=#657b83 gui=NONE cterm=NONE
        hi PmenuThumb guifg=NONE guibg=#839496 gui=NONE cterm=NONE
        hi Question guifg=#2aa198 guibg=NONE gui=bold cterm=bold
        hi Search guifg=#b58900 guibg=NONE gui=reverse cterm=reverse
        hi SignColumn guifg=#839496 guibg=#073642 gui=NONE cterm=NONE
        hi Visual guifg=#586e75 guibg=#002b36 gui=reverse cterm=reverse
        hi VisualNOS guifg=NONE guibg=#073642 gui=reverse cterm=reverse
        hi WarningMsg guifg=#cb4b16 guibg=NONE gui=bold cterm=bold
        hi WildMenu guifg=#eee8d5 guibg=#073642 gui=reverse cterm=reverse
        hi Comment guifg=#586e75 guibg=NONE gui=italic cterm=italic
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
        hi NormalMode guifg=#839496 guibg=#fdf6e3 gui=reverse cterm=reverse
        hi InsertMode guifg=#2aa198 guibg=#fdf6e3 gui=reverse cterm=reverse
        hi ReplaceMode guifg=#cb4b16 guibg=#fdf6e3 gui=reverse cterm=reverse
        hi VisualMode guifg=#d33682 guibg=#fdf6e3 gui=reverse cterm=reverse
        hi CommandMode guifg=#d33682 guibg=#fdf6e3 gui=reverse cterm=reverse
        hi @markup.strong guifg=fg guibg=NONE gui=bold cterm=bold
        hi @markup.emphasis guifg=fg guibg=NONE gui=italic cterm=italic
        hi! link TermCursor Cursor
        hi TermCursorNC guifg=#002b36 guibg=#586e75 gui=NONE cterm=NONE
        hi! link vimVar Identifier
        hi! link vimFunc Function
        hi! link vimUserFunc Function
        hi! link helpSpecial Special
        hi vimCommentString guifg=#6c71c4 guibg=NONE gui=NONE cterm=NONE
        hi vimCommand guifg=#b58900 guibg=NONE gui=NONE cterm=NONE
        hi vimCmdSep guifg=#268bd2 guibg=NONE gui=bold cterm=bold
        hi helpExample guifg=#93a1a1 guibg=NONE gui=NONE cterm=NONE
        hi helpOption guifg=#2aa198 guibg=NONE gui=NONE cterm=NONE
        hi helpNote guifg=#d33682 guibg=NONE gui=NONE cterm=NONE
        hi helpVim guifg=#d33682 guibg=NONE gui=NONE cterm=NONE
        hi helpHyperTextJump guifg=#268bd2 guibg=NONE gui=NONE cterm=NONE
        hi helpHyperTextEntry guifg=#859900 guibg=NONE gui=NONE cterm=NONE
        hi vimIsCommand guifg=#657b83 guibg=NONE gui=NONE cterm=NONE
        hi vimSynMtchOpt guifg=#b58900 guibg=NONE gui=NONE cterm=NONE
        hi vimSynType guifg=#2aa198 guibg=NONE gui=NONE cterm=NONE
        hi vimHiLink guifg=#268bd2 guibg=NONE gui=NONE cterm=NONE
        hi vimHiGroup guifg=#268bd2 guibg=NONE gui=NONE cterm=NONE
        hi vimGroup guifg=#268bd2 guibg=NONE gui=bold cterm=bold
        hi! link diffAdded Statement
        hi! link diffLine Identifier
        hi gitcommitComment guifg=#586e75 guibg=NONE gui=italic cterm=italic
        hi! link gitcommitUntracked gitcommitComment
        hi! link gitcommitDiscarded gitcommitComment
        hi! link gitcommitSelected gitcommitComment
        hi gitcommitUnmerged guifg=#859900 guibg=NONE gui=bold cterm=bold
        hi gitcommitOnBranch guifg=#586e75 guibg=NONE gui=bold cterm=bold
        hi gitcommitBranch guifg=#d33682 guibg=NONE gui=bold cterm=bold
        hi! link gitcommitNoBranch gitcommitBranch
        hi gitcommitdiscardedtype guifg=#dc322f guibg=NONE gui=NONE cterm=NONE
        hi gitcommitselectedtype guifg=#859900 guibg=NONE gui=NONE cterm=NONE
        hi gitcommitHeader guifg=#586e75 guibg=NONE gui=NONE cterm=NONE
        hi gitcommitUntrackedFile guifg=#2aa198 guibg=NONE gui=bold cterm=bold
        hi gitcommitDiscardedFile guifg=#dc322f guibg=NONE gui=bold cterm=bold
        hi gitcommitSelectedFile guifg=#859900 guibg=NONE gui=bold cterm=bold
        hi gitcommitUnmergedFile guifg=#b58900 guibg=NONE gui=bold cterm=bold
        hi gitcommitFile guifg=#839496 guibg=NONE gui=bold cterm=bold
        hi! link gitcommitDiscardedArrow gitcommitDiscardedFile
        hi! link gitcommitSelectedArrow gitcommitSelectedFile
        hi! link gitcommitUnmergedArrow gitcommitUnmergedFile
        hi htmlTag guifg=#586e75 guibg=NONE gui=NONE cterm=NONE
        hi htmlEndTag guifg=#586e75 guibg=NONE gui=NONE cterm=NONE
        hi htmlTagN guifg=#93a1a1 guibg=NONE gui=bold cterm=bold
        hi htmlTagName guifg=#268bd2 guibg=NONE gui=bold cterm=bold
        hi htmlSpecialTagName guifg=#268bd2 guibg=NONE gui=italic cterm=italic
        hi htmlArg guifg=#657b83 guibg=NONE gui=NONE cterm=NONE
        hi javaScript guifg=#b58900 guibg=NONE gui=NONE cterm=NONE
        hi! link jsFuncCall Function
        hi perlHereDoc guifg=#93a1a1 guibg=NONE gui=NONE cterm=NONE
        hi perlVarPlain guifg=#b58900 guibg=NONE gui=NONE cterm=NONE
        hi perlStatementFileDesc guifg=#2aa198 guibg=NONE gui=NONE cterm=NONE
        hi texstatement guifg=#2aa198 guibg=NONE gui=NONE cterm=NONE
        hi texmathzonex guifg=#b58900 guibg=NONE gui=NONE cterm=NONE
        hi texmathmatcher guifg=#b58900 guibg=NONE gui=NONE cterm=NONE
        hi texreflabel guifg=#b58900 guibg=NONE gui=NONE cterm=NONE
        hi rubyDefine guifg=#93a1a1 guibg=NONE gui=bold cterm=bold
        hi! link rubySymbol Type
        hi rubyBoolean guifg=#d33682 guibg=NONE gui=NONE cterm=NONE
        hi cPreCondit guifg=#cb4b16 guibg=NONE gui=NONE cterm=NONE
        hi VarId guifg=#268bd2 guibg=NONE gui=NONE cterm=NONE
        hi ConId guifg=#b58900 guibg=NONE gui=NONE cterm=NONE
        hi hsImport guifg=#d33682 guibg=NONE gui=NONE cterm=NONE
        hi hsString guifg=#657b83 guibg=NONE gui=NONE cterm=NONE
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
        let hs_highlight_boolean=1
        let hs_highlight_delimiters=1
        hi pandocTitleBlock guifg=#268bd2 guibg=NONE gui=NONE cterm=NONE
        hi pandocTitleBlockTitle guifg=#268bd2 guibg=NONE gui=bold cterm=bold
        hi pandocTitleComment guifg=#268bd2 guibg=NONE gui=bold cterm=bold
        hi pandocComment guifg=#586e75 guibg=NONE gui=italic cterm=italic
        hi pandocVerbatimBlock guifg=#b58900 guibg=NONE gui=NONE cterm=NONE
        hi! link pandocVerbatimBlockDeep pandocVerbatimBlock
        hi! link pandocCodeBlock pandocVerbatimBlock
        hi! link pandocCodeBlockDelim pandocVerbatimBlock
        hi pandocBlockQuote guifg=#268bd2 guibg=NONE gui=NONE cterm=NONE
        hi pandocBlockQuoteLeader1 guifg=#268bd2 guibg=NONE gui=NONE cterm=NONE
        hi pandocBlockQuoteLeader2 guifg=#2aa198 guibg=NONE gui=NONE cterm=NONE
        hi pandocBlockQuoteLeader3 guifg=#b58900 guibg=NONE gui=NONE cterm=NONE
        hi pandocBlockQuoteLeader4 guifg=#dc322f guibg=NONE gui=NONE cterm=NONE
        hi pandocBlockQuoteLeader5 guifg=#839496 guibg=NONE gui=NONE cterm=NONE
        hi pandocBlockQuoteLeader6 guifg=#586e75 guibg=NONE gui=NONE cterm=NONE
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
        hi pandocTableZebraLight guifg=#268bd2 guibg=#002b36 gui=NONE cterm=NONE
        hi pandocTableZebraDark guifg=#268bd2 guibg=#073642 gui=NONE cterm=NONE
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
        hi pandocLinkDelim guifg=#586e75 guibg=NONE gui=NONE cterm=NONE
        hi pandocLinkLabel guifg=#268bd2 guibg=NONE gui=NONE cterm=NONE
        hi pandocLinkText guifg=#268bd2 guibg=NONE gui=NONE cterm=NONE
        hi pandocLinkURL guifg=#657b83 guibg=NONE gui=NONE cterm=NONE
        hi pandocLinkTitle guifg=#657b83 guibg=NONE gui=NONE cterm=NONE
        hi pandocLinkTitleDelim guifg=#586e75 guibg=NONE guisp=#657b83 gui=NONE cterm=NONE
        hi pandocLinkDefinition guifg=#2aa198 guibg=NONE guisp=#657b83 gui=NONE cterm=NONE
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
        hi pandocStyleDelim guifg=#586e75 guibg=NONE gui=NONE cterm=NONE
        hi pandocEmphasis guifg=#839496 guibg=NONE gui=italic cterm=italic
        hi pandocEmphasisNested guifg=#839496 guibg=NONE gui=bold cterm=bold
        hi pandocStrongEmphasis guifg=#839496 guibg=NONE gui=bold cterm=bold
        hi pandocStrongEmphasisNested guifg=#839496 guibg=NONE gui=bold cterm=bold
        hi pandocStrongEmphasisEmphasis guifg=#839496 guibg=NONE gui=bold cterm=bold
        hi pandocStrikeout guifg=#586e75 guibg=NONE gui=reverse cterm=reverse
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
        hi pandocMetadataDelim guifg=#586e75 guibg=NONE gui=NONE cterm=NONE
        hi pandocMetadata guifg=#268bd2 guibg=NONE gui=NONE cterm=NONE
        hi pandocMetadataKey guifg=#268bd2 guibg=NONE gui=NONE cterm=NONE
        hi pandocMetadata guifg=#268bd2 guibg=NONE gui=bold cterm=bold
        hi! link pandocMetadataTitle pandocMetadata
        hi ALEErrorSign guifg=#dc322f guibg=#073642 gui=bold cterm=bold
        hi ALEInfoSign guifg=#2aa198 guibg=#073642 gui=bold cterm=bold
        hi ALEWarningSign guifg=#b58900 guibg=#073642 gui=bold cterm=bold
        hi ALEErrorSignLineNr guifg=#073642 guibg=#dc322f gui=NONE cterm=NONE
        hi ALEInfoSignLineNr guifg=#073642 guibg=#2aa198 gui=NONE cterm=NONE
        hi ALEWarningSignLineNr guifg=#073642 guibg=#b58900 gui=NONE cterm=NONE
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
elseif vim.opt.background:get() == "light" then
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
    let hs_highlight_boolean=1
    let hs_highlight_delimiters=1
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
