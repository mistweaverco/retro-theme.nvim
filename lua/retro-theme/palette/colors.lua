local colorparser = require("retro-theme.lib.colorparser")
local hsl = require("retro-theme.lib.hsl.type")
local shade = require("retro-theme.lib.shade")
local config = require("retro-theme").config

local t = {
  bg = hsl("#1c1e26"),
  bgFloat = hsl("#1b1d23"),
  fg = hsl("#c8d0e0"),
  cursor = hsl("#ffdd33"),
  keyword = hsl("#ff5df4"),
  comment = hsl("#7fd1b9"),
  punctuation = hsl("#f4a1ff"),
  method = hsl("#00ffbf"),
  type = hsl("#ff6ac1"),
  string = hsl("#b7ff6a"),
  number = hsl("#ff57ff"),
  constant = hsl("#bd93f9"),
  tag = hsl("#6cdbff"),
  attribute = hsl("#8cff8f"),
  property = hsl("#6de0b4"),
  parameter = hsl("#9df9ff"),
  label = hsl("#50e3c2"),

  -- workspace
  primary = hsl("#00dfff"),
  selection = hsl("#336699"),
  search = hsl("#5a4472"),
  diffAdd = hsl("#00ff88"),
  diffChange = hsl("#00bfff"),
  diffDelete = hsl("#ff5555"),
  added = hsl("#2ee085"),
  changed = hsl("#00ccff"),
  deleted = hsl("#ff4d6a"),

  diffText = hsl("#00bfff").lighten(15),
  error = hsl("#ff445d"),
  errorBG = hsl("#ffccd2"),
  warning = hsl("#6be6a2"),
  warningBG = hsl("#d4ffe0"),
  info = hsl("#00dfff"),
  infoBG = hsl("#d0f4ff"),
  hint = hsl("#a3adff"),
  mergeCurrent = hsl("#5a4472"),
  mergeCurrentLabel = hsl("#8f5ea5"),
  mergeIncoming = hsl("#4465b3"),
  mergeIncomingLabel = hsl("#558edc"),
  mergeParent = hsl("#7946b8"),
  mergeParentLabel = hsl("#8b5edc"),
}

t.shade1 = shade(t.bg, 1)
t.shade2 = shade(t.bg, 2)
t.shade3 = shade(t.bg, 3)
t.shade4 = shade(t.bg, 4)
t.shade5 = shade(t.bg, 5)
t.shade6 = shade(t.bg, 6)
t.shade7 = shade(t.bg, 7)
t.shade8 = shade(t.bg, 8)
t.shade9 = shade(t.bg, 9)
t.shade10 = shade(t.bg, 10)
t.shade20 = shade(t.bg, 20)
t.shade25 = shade(t.bg, 25)
t.shade30 = shade(t.bg, 30)
t.shade40 = shade(t.bg, 40)
t.shade50 = shade(t.bg, 50)
t.shade60 = shade(t.bg, 60)
t.shade70 = shade(t.bg, 70)
t.shade80 = shade(t.bg, 80)
t.shade90 = shade(t.bg, 90)

t.grey3 = t.shade3.mix(t.primary, 3)
t.grey5 = t.shade5.mix(t.primary, 5)
t.grey7 = t.shade7.mix(t.primary, 7)
t.grey10 = t.shade10.mix(t.primary, 10)
t.grey20 = t.shade20.mix(t.primary, 10)
t.grey25 = t.shade25.mix(t.primary, 10)
t.grey30 = t.shade30.mix(t.primary, 10)
t.grey40 = t.shade40.mix(t.primary, 12)

t.white = hsl("#ffffff")
t.green = hsl("#008200")

local colors = {}

-- normal text
colors["Normal"] = { fg = t.fg, bg = t.bg }

-- Screen-line at the cursor, when 'cursorline' is set.
-- Low-priority if foreground (ctermfg OR guifg) is not set.
colors["CursorLine"] = { bg = t.grey7 }

-- Screen-column at the cursor, when 'cursorcolumn' is set.
colors["CursorColumn"] = colors["CursorLine"]
colors["Whitespace"] = { fg = t.grey10 }

-- any comment
colors["Comment"] = { fg = t.comment, italic = config.italic_comments }

-- Line number for ":number" and ":#" commands,
-- and when 'number' or 'relativenumber' option is set.
colors["LineNr"] = { fg = t.comment }

-- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
colors["CursorLineNr"] = { fg = t.comment }
colors["Search"] = { bg = t.search }
colors["IncSearch"] = { bg = t.cursor.mix(t.bg, 10), fg = t.bg }
colors["CurSearch"] = colors["Search"]
colors["NormalFloat"] = { bg = t.bgFloat, blend = 5 } -- Normal text in floating windows.
colors["FloatBorder"] = { fg = t.punctuation }
colors["NormalSB"] = { bg = t.bgFloat } -- Normal text in floating windows.
colors["ColorColumn"] = { bg = t.grey5 } -- used for the columns set with 'colorcolumn'
colors["Conceal"] = {} -- placeholder characters substituted for concealed text (see 'conceallevel')
colors["Cursor"] = { bg = t.cursor, fg = t.bg } -- character under the cursor
colors["lCursor"] = colors["Cursor"] -- the character under the cursor when |language-mapping| is used (see 'guicursor')
colors["CursorIM"] = colors["Cursor"] -- like Cursor, but used when in IME mode |CursorIM|
colors["Directory"] = { fg = t.keyword } -- directory names (and other special names in listings)
colors["DiffAdd"] = { bg = t.diffAdd } -- diff mode: Added line |diff.txt|
colors["DiffChange"] = { bg = t.diffChange } -- diff mode: Changed line |diff.txt|
colors["DiffDelete"] = { bg = t.diffDelete } -- diff mode: Deleted line |diff.txt|
colors["DiffText"] = { bg = t.diffText } -- diff mode: Changed text within a changed line |diff.txt|
colors["EndOfBuffer"] = { fg = t.punctuation } -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
colors["TermCursor"] = colors["Cursor"] -- cursor in a focused terminal
colors["TermCursorNC"] = {} -- cursor in an unfocused terminal
colors["ErrorMsg"] = { fg = t.error } -- error messages on the command line
colors["VertSplit"] = { fg = t.grey30 } -- the column separating vertically split windows
colors["Winseparator"] = colors["VertSplit"] -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
colors["Folded"] = { bg = t.shade7, fg = t.tag } -- line used for closed folds
colors["SignColumn"] = colors["Normal"] -- column where |signs| are displayed
colors["FoldColumn"] = colors["SignColumn"] -- 'foldcolumn'
colors["Substitute"] = colors["IncSearch"] -- |:substitute| replacement text highlighting
colors["MatchParen"] = { bg = t.punctuation, fg = t.bg } -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
colors["ModeMsg"] = colors["Normal"] -- 'showmode' message (e.g., "-- INSERT -- ")
colors["MsgArea"] = colors["Normal"] -- Area for messages and cmdline
-- MsgSeparator = { } -- Separator for scrolled messages, `msgsep` flag of 'display'
colors["MoreMsg"] = { fg = t.primary } -- |more-prompt|
colors["NonText"] = { fg = t.shade30 } -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
colors["NormalNC"] = colors["Normal"] -- normal text in non-current windows
-- Pmenu = { bg = t.bg, blend = 5 }
colors["Pmenu"] = colors["NormalFloat"]
colors["PmenuSel"] = { bg = t.selection } -- Popup menu: selected item.
colors["PmenuSbar"] = { bg = t.grey5 } -- Popup menu: scrollbar.
colors["PmenuThumb"] = { bg = t.shade20 } -- Popup menu: Thumb of the scrollbar.
colors["Question"] = { fg = t.primary } -- |hit-enter| prompt and yes/no questions
colors["QuickFixLine"] = { bg = t.primary, fg = t.white } -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
colors["SpecialKey"] = { fg = t.attribute } -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
-- TODO: spelling
-- SpellBad     { gui = "undercurl", sp = t.error  } -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
-- SpellCap     { } -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
-- SpellLocal   { } -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
-- SpellRare    { } -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
--
colors["StatusLine"] = { bg = t.grey10, gui = "" } -- status line of current window
colors["StatusLineNC"] = { bg = t.shade5 } -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
--
colors["TabLine"] = { bg = t.shade3, fg = t.shade30 } -- tab pages line, not active tab page label
colors["TabLineFill"] = { bg = t.bg } -- tab pages line, where there are no labels
colors["TabLineSel"] = { bg = t.shade10, sp = t.primary, gui = "underline" } -- tab pages line, active tab page label
--
colors["Title"] = { fg = t.primary } -- titles for output from ":set all", ":autocmd" etc.
colors["Visual"] = { bg = t.selection } -- Visual mode selection
colors["VisualNOS"] = { bg = t.selection } -- Visual mode selection when vim is "Not Owning the Selection".
colors["WarningMsg"] = { fg = t.warning } -- warning messages
colors["WildMenu"] = { bg = t.selection } -- current match in 'wildmenu' completion
--
colors["Constant"] = { fg = t.constant } -- (preferred) any constant
colors["String"] = { fg = t.string } --   a string constant: "this is a string"
colors["Character"] = { fg = t.attribute } --  a character constant: 'c', '\n'
colors["Number"] = { fg = t.number } --   a number constant: 234, 0xff
colors["Boolean"] = { fg = t.keyword } --  a boolean constant: TRUE, false
-- Float          { } --    a floating point constant: 2.3e10
colors["Identifier"] = { fg = t.fg } -- (preferred) any variable name
colors["Function"] = { fg = t.method } -- function name (also: methods for classes)
colors["Method"] = { fg = t.method } -- function name (also: methods for classes)
colors["Property"] = { fg = t.property }
colors["Field"] = colors["Property"]
colors["Parameter"] = { fg = t.parameter }
colors["Statement"] = { fg = t.keyword } -- (preferred) any statement
-- Conditional    { } --  if, then, else, endif, switch, etc.
-- Repeat         { } --   for, do, while, etc.
-- Label          { } --    case, default, etc.
colors["Punctuation"] = { fg = t.punctuation } -- "sizeof", "+", "*", etc.
colors["Operator"] = { fg = t.punctuation } -- "sizeof", "+", "*", etc.
colors["Keyword"] = colors["Statement"] --  any other keyword
-- Exception      { } --  try, catch, throw
colors["PreProc"] = { fg = t.keyword } -- (preferred) generic Preprocessor
-- Include        { } --  preprocessor #include
-- Define         { } --   preprocessor #define
-- Macro          { } --    same as Define
-- PreCondit      { } --  preprocessor #if, #else, #endif, etc.
colors["Type"] = { fg = t.type } -- (preferred) int, long, char, etc.
colors["Struct"] = colors["Type"]
colors["Class"] = colors["Type"]
-- StorageClass   { } -- static, register, volatile, etc.
-- Structure      { } --  struct, union, enum, etc.
-- Typedef        { } --  A typedef
colors["Special"] = colors["Character"] -- (preferred) any special symbol
colors["Attribute"] = colors["Character"] -- (preferred) any special symbol
-- SpecialChar = {} --  special character in a constant
colors["Tag"] = { fg = t.tag } --    you can use CTRL-] on this
-- Delimiter = {} --  character that needs attention
-- SpecialComment = { } -- special things inside a comment
-- Debug          { } --    debugging statements
colors["Underlined"] = { gui = "underline" } -- (preferred) text that stands out, HTML links
colors["Bold"] = { gui = "bold" }
colors["Italic"] = { gui = "italic" }
-- ("Ignore", below, may be invisible...)
colors["Ignore"] = { fg = t.bg } -- (preferred) left blank, hidden  |hl-Ignore|
colors["Error"] = colors["ErrorMsg"] -- (preferred) any erroneous construct
colors["Todo"] = { bg = t.info, fg = t.white } -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX
colors["WinBar"] = { fg = t.tag, gui = "bold" }
colors["WinBarNC"] = { fg = t.fg, gui = "" }

--
-- These groups are for the native LSP client and diagnostic system. Some
-- other LSP clients may use these groups, or use their own. Consult your
-- LSP client's documentation.

-- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
--
-- LspReferenceText            { } , -- Used for highlighting "text" references
-- LspReferenceRead            { } , -- Used for highlighting "read" references
-- LspReferenceWrite           { } , -- Used for highlighting "write" references
-- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
-- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
-- LspSignatureActiveParameter = { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

-- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
--
colors["DiagnosticError"] = colors["Error"] -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
colors["DiagnosticWarn"] = colors["WarningMsg"] -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
colors["DiagnosticInfo"] = { fg = t.info } -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
colors["DiagnosticHint"] = { fg = t.hint } -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
colors["DiagnosticVirtualTextError"] = { colors["DiagnosticError"], bg = t.bg.mix(t.error, 20) } -- Used for "Error" diagnostic virtual text.
colors["DiagnosticVirtualTextWarn"] = { colors["DiagnosticWarn"], bg = t.bg.mix(t.warning, 20) } -- Used for "Warn" diagnostic virtual text.
colors["DiagnosticVirtualTextInfo"] = { colors["DiagnosticInfo"], bg = t.bg.mix(t.info, 20) } -- Used for "Info" diagnostic virtual text.
colors["DiagnosticVirtualTextHint"] = { colors["DiagnosticHint"], bg = t.bg.mix(t.hint, 20) } -- Used for "Hint" diagnostic virtual text.
colors["DiagnosticUnderlineError"] = { gui = "undercurl", sp = t.error } -- Used to underline "Error" diagnostics.
colors["DiagnosticUnderlineWarn"] = { gui = "undercurl", sp = t.warning } -- Used to underline "Warn" diagnostics.
colors["DiagnosticUnderlineInfo"] = { gui = "undercurl", sp = t.info } -- Used to underline "Info" diagnostics.
colors["DiagnosticUnderlineHint"] = { gui = "undercurl", sp = t.hint } -- Used to underline "Hint" diagnostics.
-- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
-- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
-- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
-- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
-- DiagnosticSignError        { } , -- Used for "Error" signs in sign column.
-- DiagnosticSignWarn         { } , -- Used for "Warn" signs in sign column.
-- DiagnosticSignInfo         { } , -- Used for "Info" signs in sign column.
-- DiagnosticSignHint         { } , -- Used for "Hint" signs in sign column.

-- These groups are for the neovim tree-sitter highlights.
-- As of writing, tree-sitter support is a WIP, group names may change.
-- By default, most of these groups link to an appropriate Vim group,
-- TSError -> Error for example, so you do not have to define these unless
-- you explicitly want to support Treesitter's improved syntax awareness.

--
-- TSError              { } -- For syntax/parser errors.
colors["@constructor"] = { fg = t.type }
colors["@punctuation"] = { fg = t.punctuation }
colors["@punctuation.bracket"] = { fg = t.punctuation }
colors["@punctuation.delimiter"] = { fg = t.punctuation }
colors["@punctuation.special"] = { fg = t.punctuation }
colors["@symbol"] = { fg = t.constant }
colors["@constant"] = { fg = t.constant }
colors["@constant.builtin"] = { fg = t.keyword }
colors["@string.escape"] = colors["Character"]
colors["@method"] = { fg = t.method }
colors["@function"] = { fg = t.method }
colors["@function.call"] = { fg = t.method }
colors["@function.builtin"] = { fg = t.method }
colors["@parameter"] = { fg = t.parameter }
colors["@field"] = colors["Property"]
colors["@property"] = colors["Property"]
colors["@label"] = { fg = t.label } -- For labels: `label:` in C and `:label:` in Lua.
colors["@type"] = colors["Type"]
colors["@type.builtin"] = { fg = t.keyword }
colors["@type.qualifier"] = colors["Statement"]
colors["@keyword"] = colors["Statement"]
colors["@keyword.modifier"] = colors["Statement"] -- Same as @type.qualifier
colors["@namespace"] = colors["Type"]
colors["@annotation"] = colors["@label"] -- For labels: `label:` in C and `:label:` in Lua.
colors["@text"] = colors["Identifier"]
colors["@text.strong"] = colors["Bold"]
colors["@text.italic"] = colors["Italic"]
colors["@text.underline"] = colors["Underlined"]
colors["@text.title"] = { fg = t.keyword }
colors["@text.literal"] = colors["Property"]
colors["@text.uri"] = { fg = t.tag, sp = t.tag, gui = "underline" } -- Any URI like a link or email.
colors["@variable"] = colors["Identifier"] -- Variable names that are defined by the languages like `this` or `self`.
colors["@variable.builtin"] = colors["Statement"] -- Variable names that are defined by the languages like `this` or `self`.
colors["@tag"] = colors["Tag"]
colors["@attribute"] = { fg = t.label } -- Variable names that are defined by the languages, like `this` or `self`.
colors["@tag.attribute"] = { fg = t.attribute } -- Variable names that are defined by the languages, like `this` or `self`.
colors["@error"] = colors["Error"] -- Variable names that are defined by the languages like `this` or `self`.
colors["@warning"] = colors["WarningMsg"]
colors["@info"] = { fg = t.info }
--
-- ["@markup.link.label"] =    { } -- SpecialChar
-- ["@character.special"] =    { } -- SpecialChar
-- ["@function.macro"] =       { } -- Macro
-- ["@keyword.debug"] =        { } -- Debug

-- Language Overrides
-- JSON
colors["@label.json"] = { fg = t.property } -- For labels: `label:` in C and `:label:` in Lua.
colors["@label.jsonc"] = { fg = t.property } -- For labels: `label:` in C and `:label:` in Lua.
-- help files
colors["@label.help"] = colors["@text.uri"]
-- html
colors["@text.uri.html"] = { gui = "underline" }

-- Treesitter highlight groups update
-- Treesitter standard capture groups
colors["@variable.parameter"] = colors["@parameter"]
colors["@variable.member"] = colors["@field"]
colors["@module"] = colors["@namespace"]
colors["@string.special.symbol"] = colors["@symbol"]
colors["@markup.strong"] = colors["@text.strong"]
colors["@markup.underline"] = colors["@text.underline"]
colors["@markup.heading"] = colors["@text.title"]
colors["@markup.link.url"] = colors["@text.uri"]
colors["@markup.raw"] = colors["@text.literal"]
colors["@markup.list"] = colors["@punctuation.special"]

-- Helix capture groups
colors["@function.method"] = colors["@method"]
colors["@string.special.url"] = colors["@text.uri"]

-- semantic highlighting
colors["@lsp.type.namespace"] = colors["@namespace"]
colors["@lsp.type.type"] = colors["@type"]
colors["@lsp.type.class"] = colors["@type"]
colors["@lsp.type.enum"] = colors["@type"]
colors["@lsp.type.interface"] = colors["@type"]
colors["@lsp.type.struct"] = colors["@type"]
colors["@lsp.type.parameter"] = colors["@parameter"]
colors["@lsp.type.variable"] = colors["@variable"]
colors["@lsp.type.property"] = colors["@property"]
colors["@lsp.type.enumMember"] = colors["@constant"]
colors["@lsp.type.function"] = colors["@function"]
colors["@lsp.type.method"] = colors["@method"]
colors["@lsp.type.macro"] = colors["@label"]
colors["@lsp.type.decorator"] = colors["@label"]
colors["@lsp.mod.readonly"] = colors["@constant"]
colors["@lsp.typemod.function.declaration"] = colors["@function"]
colors["@lsp.typemod.function.readonly"] = colors["@function"]

-- gui vim
-- VimR
colors["VimrDefaultCursor"] = { fg = t.cursor, bg = t.bg }
colors["VimrInsertCursor"] = { fg = t.cursor, bg = t.bg }
--  gitsigns
colors["GitSignsAdd"] = { fg = t.added }
colors["GitSignsChange"] = { fg = t.changed }
colors["GitSignsDelete"] = { fg = t.deleted }
-- TODO: improve bufferline
colors["BufferlineFill"] = colors["NormalFloat"]
-- BufferlineBackground = { bg = t.bg }
-- BufferlineDevIconLua = { bg = t.bg, fg = t.keyword }
-- BufferlineDevIconLuaSelected = { bg = t.bg, fg = t.keyword }
-- BufferlineBufferVisible = { bg = t.bg }
-- BufferlineBufferSelected = { bg = t.bg }

-- BufferlineIndicatorVisible = { bg = t.type } -- shows which buffers are visible in windows currently

-- BufferLineSeparatorSelected = { fg = t.type, sp = t.primary, gui = "underline" }
-- BufferLineWarningDiagnosticSelected = { fg = t.warning, sp = t.primary, gui = "underline" }
-- BufferLineErrorDiagnosticSelected = { fg = t.error, sp = t.primary, gui = "underline" }
-- BufferLineInfoDiagnosticSelected = { fg = t.info, sp = t.primary, gui = "underline" }
-- BufferLineHintDiagnosticSelected = { fg = t.hint, sp = t.primary, gui = "underline" }
-- BufferLineTabSeparatorSelected = { sp = t.primary, gui = "underline" }
-- BufferLineCloseButtonSelected = { sp = t.primary, gui = "underline" }
-- BufferLineDiagnosticSelected = { sp = t.primary, gui = "underline" }
-- BufferLineDevIconLuaSelected = { sp = t.primary, gui = "underline" }
-- BufferLineIndicatorSelected = { sp = t.primary, gui = "underline" }
-- BufferLineDuplicateSelected = { sp = t.primary, gui = "underline" }
-- BufferLineModifiedSelected = { sp = t.primary, gui = "underline" }
-- BufferLineNumbersSelected = { sp = t.primary, gui = "underline" }
-- BufferLineBufferSelected = { sp = t.primary, gui = "underline" }
-- BufferLinePickSelected = { sp = t.primary, gui = "underline" }
-- BufferLineTabSelected = { sp = t.primary, gui = "underline" }
-- BufferLineWarningSelected = { fg = t.warning, sp = t.primary, gui = "underline" }
-- BufferLineErrorSelected = { fg = t.error, sp = t.primary, gui = "underline" }
-- BufferLineInfoSelected = { fg = t.info, sp = t.primary, gui = "underline" }
-- BufferLineHintSelected = { fg = t.hint, sp = t.primary, gui = "underline" }
--

-- BarBar
colors["BufferCurrent"] = colors["Normal"]
colors["BufferCurrentIndex"] = colors["BufferCurrent"]
colors["BufferCurrentIcon"] = colors["BufferCurrentIndex"]
colors["BufferCurrentMod"] = colors["BufferCurrent"]
colors["BufferCurrentSign"] = { fg = t.keyword, bg = colors["BufferCurrent"].bg }
colors["BufferCurrentTarget"] = { colors["BufferCurrent"], fg = t.type }
colors["BufferCurrentWARN"] = { fg = colors["DiagnosticWarn"].fg, bg = colors["BufferCurrent"].bg }
colors["BufferCurrentINFO"] = { fg = colors["DiagnosticInfo"].fg, bg = colors["BufferCurrent"].bg }
colors["BufferCurrentERROR"] = { fg = colors["DiagnosticError"].fg, bg = colors["BufferCurrent"].bg }
colors["BufferCurrentHINT"] = { fg = colors["DiagnosticHint"].fg, bg = colors["BufferCurrent"].bg }
--
colors["BufferInactive"] = { fg = t.shade40, bg = t.bgFloat }
colors["BufferInactiveIcon"] = colors["BufferInactive"]
colors["BufferInactiveIndex"] = colors["BufferInactive"]
colors["BufferInactiveMod"] = colors["BufferInactive"]
colors["BufferInactiveSign"] = colors["BufferInactive"]
colors["BufferInactiveTarget"] = { colors["BufferInactive"], fg = t.type }
colors["BufferInactiveWARN"] = { colors["BufferCurrentWARN"], bg = colors["BufferInactive"].bg }
colors["BufferInactiveINFO"] = { colors["BufferCurrentINFO"], bg = colors["BufferInactive"].bg }
colors["BufferInactiveERROR"] = { colors["BufferCurrentERROR"], bg = colors["BufferInactive"].bg }
colors["BufferInactiveHINT"] = { colors["BufferCurrentHINT"], bg = colors["BufferInactive"].bg }
--
colors["BufferVisible"] = { colors["BufferCurrent"], bg = t.bgFloat }
colors["BufferVisibleIndex"] = colors["BufferVisible"]
colors["BufferVisibleIcon"] = colors["BufferVisibleIndex"]
colors["BufferVisibleMod"] = colors["BufferVisible"]
colors["BufferVisibleSign"] = colors["BufferVisible"]
colors["BufferVisibleTarget"] = { colors["BufferVisible"], fg = t.type }
colors["BufferVisibleWARN"] = colors["BufferInactiveWARN"]
colors["BufferVisibleINFO"] = colors["BufferInactiveINFO"]
colors["BufferVisibleERROR"] = colors["BufferInactiveERROR"]
colors["BufferVisibleHINT"] = colors["BufferInactiveHINT"]
--
colors["BufferAlternate"] = colors["BufferInactive"]
colors["BufferAlternateIndex"] = colors["BufferAlternate"]
colors["BufferAlternateIcon"] = colors["BufferAlternateIndex"]
colors["BufferAlternateMod"] = colors["BufferInactiveMod"]
colors["BufferAlternateSign"] = { colors["BufferInactiveSign"], fg = t.constant }
colors["BufferAlternateTarget"] = { colors["BufferAlternate"], fg = t.type }
colors["BufferAlternateWARN"] = colors["BufferInactiveWARN"]
colors["BufferAlternateINFO"] = colors["BufferInactiveINFO"]
colors["BufferAlternateERROR"] = colors["BufferInactiveERROR"]
colors["BufferAlternateHINT"] = colors["BufferInactiveHINT"]
--
colors["BufferTabpages"] = { colors["BufferInactive"], fg = t.fg }
colors["BufferTabpageFill"] = { colors["BufferTabpages"], fg = t.bg }
colors["BufferOffset"] = colors["BufferTabpageFill"]
--

-- Telescope
-- Sets the highlight for selected items within the picker.
-- TelescopeSelection  {}
-- TelescopeSelectionCaret  {}
colors["TelescopeMultiSelection"] = { fg = t.attribute }
colors["TelescopeMultiIcon"] = { fg = t.primary }
--
-- -- "Normal" in the floating windows created by telescope.
-- TelescopeNormal = { fg = t.fg, bg = t.bg }
-- TelescopeNormal = { fg = t.fg, bg = t.bg, blend = 5 }
colors["TelescopeNormal"] = colors["NormalFloat"]
-- TelescopePreviewNormal  {}
-- TelescopePromptNormal = { fg = t.fg, bg = t.bg }
-- TelescopeResultsNormal  {}

-- Border highlight groups.
-- Use TelescopeBorder to override the default.
-- Otherwise set them specifically

colors["TelescopeBorder"] = { colors["NormalFloat"], fg = t.punctuation }
-- TelescopePromptBorder  {}
-- TelescopeResultsBorder  {}
-- TelescopePreviewBorder  {}

-- -- Title highlight groups.
-- --   Use TelescopeTitle to override the default.
-- --   Otherwise set them specifically
-- TelescopeTitle  {fg = t.constant}
-- TelescopePromptTitle  {}
-- TelescopeResultsTitle  {}
-- TelescopePreviewTitle  {}

-- TelescopePromptCounter  {}

-- -- Used for highlighting characters that you match.
colors["TelescopeMatching"] = { fg = t.keyword }
-- -- Used for the prompt prefix
colors["TelescopePromptPrefix"] = { fg = t.punctuation }
-- -- Used for highlighting the matched line inside Previewer. Works only for (vim_buffer_ previewer)
-- TelescopePreviewLine  {}
-- TelescopePreviewMatch  {}

-- TelescopePreviewPipe  {}
-- TelescopePreviewCharDev  {}
-- TelescopePreviewDirectory  {}
-- TelescopePreviewBlock  {}
colors["TelescopePreviewLink"] = { fg = t.label }
colors["TelescopePreviewSocket"] = { fg = t.property }
-- TelescopePreviewRead  {}
colors["TelescopePreviewWrite"] = { fg = t.type }
colors["TelescopePreviewExecute"] = { fg = t.method }
-- TelescopePreviewHyphen  {}
-- TelescopePreviewSticky  {}
colors["TelescopePreviewSize"] = { fg = t.number }
colors["TelescopePreviewUser"] = { fg = t.property }
colors["TelescopePreviewGroup"] = { fg = t.property }
colors["TelescopePreviewDate"] = { fg = t.string }
-- TelescopePreviewMessage  {}
-- TelescopePreviewMessageFillchar  {}

-- -- Used for Picker specific Results highlighting
colors["TelescopeResultsClass"] = colors["Class"]
-- TelescopeResultsConstant  {}
colors["TelescopeResultsField"] = colors["Field"]
-- TelescopeResultsFunction  {}
-- TelescopeResultsMethod  {}
-- TelescopeResultsOperator  {}
-- TelescopeResultsStruct  {}
colors["TelescopeResultsVariable"] = colors["Identifier"]
-- TelescopeResultsLineNr  {}
-- TelescopeResultsIdentifier  {}
-- TelescopeResultsNumber  {}
-- TelescopeResultsComment  {}
colors["TelescopeResultsSpecialComment"] = colors["Comment"]
-- -- Used for git status Results highlighting
-- TelescopeResultsDiffChange  {}
-- TelescopeResultsDiffAdd  {}
-- TelescopeResultsDiffDelete  {}
-- TelescopeResultsDiffUntracked  {}
--

-- lspsaga
colors["TitleIcon"] = colors["Function"]
colors["SagaNormal"] = colors["NormalFloat"]
colors["SagaExpand"] = colors["Normal"]
colors["SagaCollapse"] = colors["SagaExpand"]
colors["SagaCount"] = colors["Number"]
colors["SagaBeacon"] = { bg = t.cursor, blend = 70 }
colors["CodeActionNumber"] = colors["Statement"]
colors["FinderSelection"] = colors["Visual"]
-- FinderFileName = colors["Comment"]
colors["FinderCount"] = colors["Number"]
colors["FinderIcon"] = colors["Punctuation"]
colors["FinderType"] = colors["Title"]
colors["SagaLightBulb"] = colors["Attribute"]
-- SagaShadow = colors["FloatShadow"]
colors["OutlineIndent"] = colors["Whitespace"]
--
-- lspsaga winbar
-- SagaWinbarModule = {}
-- SagaWinbarInterface = {}
-- SagaWinbarConstructor = {}
-- SagaWinbarStruct = {}
-- SagaWinbarObject = {}
-- SagaWinbarUnit = {}
colors["SagaWinbarFile"] = { fg = t.fg }
colors["SagaWinbarSnippet"] = { fg = t.label }
-- SagaWinbarText = {}
-- SagaWinbarTypeAlias = {}
-- SagaWinbarEvent = {}
-- SagaWinbarParameter = {}
colors["SagaWinbarKey"] = colors["Property"]
colors["SagaWinbarValue"] = colors["String"]
-- SagaWinbarMacro = {}
-- SagaWinbarNumber = {}
-- SagaWinbarConstant = {}
-- SagaWinbarFunction = {}
colors["SagaWinbarEnum"] = colors["Type"]
-- SagaWinbarField = {}
-- SagaWinbarProperty = {}
-- SagaWinbarMethod = {}
colors["SagaWinbarClass"] = colors["Type"]
colors["SagaWinbarFolder"] = colors["Tag"]
-- SagaWinbarPackage = {}
-- SagaWinbarStaticMethod = {}
-- SagaWinbarTypeParameter = {}
colors["SagaWinbarEnumMember"] = colors["Property"]
-- SagaWinbarOperator = {}
colors["SagaWinbarNull"] = colors["Statement"]
-- SagaWinbarNamespace = {}
-- SagaWinbarArray = {}
-- SagaWinbarBoolean = {}
-- SagaWinbarString = {}
-- SagaWinbarVariable = {}
colors["SagaWinbarFilename"] = colors["SagaWinbarFile"]
colors["SagaWinbarFolderName"] = {}
colors["SagaWinbarFileIcon"] = {}
colors["SagaWinbarSep"] = { fg = t.punctuation }
--

-- Trouble
colors["TroubleCount"] = { fg = t.number }
colors["TroubleNormal"] = { bg = t.bgFloat }
-- TroubleTextInformation = {}
-- TroubleSignWarning = {}
colors["TroubleLocation"] = { fg = t.attribute }
-- TroubleWarning = {}
-- TroublePreview = {}
-- TroubleTextError = {}
-- TroubleSignInformation = {}
-- TroubleIndent = {}
-- TroubleSource = {}
-- TroubleSignHint = {}
-- TroubleSignOther = {}
-- TroubleFoldIcon = {}
-- TroubleTextWarning = {}
-- TroubleCode = {}
-- TroubleInformation = {}
-- TroubleSignError = { fg = t.number}
-- TroubleFile = {}
-- TroubleHint = {}
-- TroubleTextHint = {}
colors["TroubleText"] = {}
--

-- Cmp
colors["CmpDocumentation"] = { fg = t.fg, bg = t.bgFloat }
colors["CmpDocumentationBorder"] = { fg = t.punctuation, bg = t.bgFloat }
colors["CmpItemAbbr"] = { fg = t.fg }
colors["CmpItemAbbrDeprecated"] = { fg = t.fg, gui = "strikethrough" }
colors["CmpItemAbbrMatch"] = { fg = t.primary }
colors["CmpItemAbbrMatchFuzzy"] = { fg = t.primary }
colors["CmpItemMenu"] = { fg = t.attribute }
colors["CmpItemKindText"] = { fg = t.comment }
colors["CmpItemKindDefault"] = { fg = t.fb }
colors["CmpItemKindKeyword"] = { fg = t.keyword }
colors["CmpItemKindVariable"] = { fg = t.fg }
colors["CmpItemKindConstant"] = { fg = t.constant }
colors["CmpItemKindReference"] = { fg = t.fg }
colors["CmpItemKindValue"] = { fg = t.fg }
colors["CmpItemKindFunction"] = { fg = t.method }
colors["CmpItemKindMethod"] = { fg = t.method }
colors["CmpItemKindConstructor"] = { fg = t.type }
colors["CmpItemKindClass"] = { fg = t.type }
colors["CmpItemKindInterface"] = { fg = t.type }
colors["CmpItemKindStruct"] = { fg = t.type }
colors["CmpItemKindEvent"] = { fg = t.label }
colors["CmpItemKindEnum"] = { fg = t.type }
colors["CmpItemKindUnit"] = { fg = t.number }
colors["CmpItemKindModule"] = { fg = t.keyword }
colors["CmpItemKindProperty"] = { fg = t.property }
colors["CmpItemKindField"] = { fg = t.property }
colors["CmpItemKindTypeParameter"] = { fg = t.type }
colors["CmpItemKindEnumMember"] = { fg = t.type }
colors["CmpItemKindOperator"] = { fg = t.punctuation }
colors["CmpItemKindSnippet"] = { fg = t.label }
--

-- nvim illuminate
colors["IlluminatedWordText"] = { bg = t.grey7 }
colors["IlluminatedWordRead"] = { bg = t.grey7 }
colors["IlluminatedWordWrite"] = { bg = t.grey7 }
--

-- cursor word
colors["CursorWord"] = { bg = t.grey7 }
colors["CursorWord0"] = { bg = t.grey7 }
colors["CursorWord1"] = { bg = t.grey7 }
--

-- mason
colors["MasonNormal"] = colors["NormalFloat"]
colors["MasonHeader"] = { bg = t.primary, fg = t.bg }
colors["MasonHeaderSecondary"] = { bg = t.constant, fg = t.bg }
colors["MasonHighlight"] = { fg = t.primary }
colors["MasonHighlightBlock"] = { bg = t.primary, fg = t.bg }
colors["MasonHighlightBlockBold"] = { bg = t.primary, fg = t.bg, gui = "bold" }
colors["MasonHighlightSecondary"] = { fg = t.constant }
colors["MasonHighlightBlockSecondary"] = { bg = t.constant, fg = t.bg }
colors["MasonHighlightBlockBoldSecondary"] = { bg = t.constant, fg = t.bg, gui = "bold" }
colors["MasonLink"] = colors["@text.uri"]
colors["MasonMuted"] = { fg = t.shade50 }
colors["MasonMutedBlock"] = { bg = t.shade40, fg = t.bg }
colors["MasonMutedBlockBold"] = { bg = t.shade40, fg = t.bg, gui = "bold" }
colors["MasonError"] = colors["Error"]
colors["MasonHeading"] = { gui = "bold,underline", fg = t.fg }
--

-- which-key
colors["WhichKey"] = colors["Character"]
colors["WhichKeyGroup"] = colors["Tag"]
colors["WhichKeySeparator"] = colors["Operator"]
colors["WhichKeyDesc"] = colors["@text.title"]
-- WhichKeyFloat = {}
-- WhichKeyBorder = {}
-- WhichKeyValue = colors["Character"]

-- Diffview
colors["DiffviewStatusAdded"] = { fg = t.method }
colors["DiffviewStatusModified"] = { fg = t.keyword }
colors["DiffviewStatusRenamed"] = { fg = t.keyword }
colors["DiffviewStatusCopied"] = { fg = t.keyword }
colors["DiffviewStatusTypeChanged"] = { fg = t.keyword }
colors["DiffviewStatusUnmerged"] = { fg = t.number }
colors["DiffviewStatusUnknown"] = { fg = t.property }
colors["DiffviewStatusDeleted"] = { fg = t.type }
-- DiffviewStatusBroken = {}
colors["DiffviewStatusIgnored"] = { fg = t.comment }
colors["DiffviewFilePanelInsertions"] = { fg = t.added }
colors["DiffviewFilePanelDeletions"] = { fg = t.deleted }
colors["DiffviewFilePanelRootPath"] = { fg = t.tag }
colors["DiffviewFilePanelTitle"] = { fg = t.constant }
colors["DiffviewFilePanelCounter"] = { fg = t.attribute }
-- DiffviewFilePanelFileName = {}
colors["DiffviewFilePanelPath"] = { fg = t.comment }
colors["DiffviewFilePanelConflicts"] = { fg = t.number }
colors["DiffviewFolderName"] = colors["Directory"]
-- DiffviewFolderSign = {}
-- DiffviewReference = {}
colors["DiffviewPrimary"] = { fg = t.keyword }
colors["DiffviewSecondary"] = { fg = t.tag }
--

-- vim-fugitive
colors["diffAdded"] = { fg = t.method }
colors["diffRemoved"] = { fg = t.type }
--

-- nvim tree
colors["NvimTreeNormal"] = { bg = t.bgFloat }
colors["NvimTreeNormalNC"] = { bg = t.bgFloat }
colors["NvimTreeWindowPicker"] = { fg = t.fg, bg = t.selection, gui = "bold" }
colors["NvimTreeIndentMarker"] = { fg = t.punctuation }
colors["NvimTreeRootFolder"] = { fg = t.tag }
colors["NvimTreeFolderIcon"] = { fg = t.keyword }
colors["NvimTreeFolderName"] = { fg = t.tag }
colors["NvimTreeOpenedFolderName"] = { fg = t.keyword }
colors["NvimTreeSpecialFile"] = { fg = t.constant }
colors["NvimTreeExecFile"] = { fg = t.method }
colors["NvimTreeGitStaged"] = { fg = t.method }
colors["NvimTreeGitDirty"] = { fg = t.type }
colors["NvimTreeGitMerge"] = { fg = t.number }
colors["NvimTreeGitDeleted"] = { fg = t.deleted }
colors["NvimTreeGitNew"] = { fg = t.method }
--

-- git-conflict
colors["GitConflictCurrent"] = { bg = t.mergeCurrent, blend = 5 }
colors["GitConflictIncoming"] = { bg = t.mergeIncoming, blend = 5 }
colors["GitConflictAncestor"] = { bg = t.mergeParent, blend = 5 }
colors["GitConflictCurrentLabel"] = { bg = t.mergeCurrentLabel, blend = 5 }
colors["GitConflictIncomingLabel"] = { bg = t.mergeIncomingLabel, blend = 5 }
colors["GitConflictAncestorLabel"] = { bg = t.mergeParentLabel, blend = 5 }
--

-- notify
colors["NotifyBackground"] = colors["NormalFloat"]
colors["NotifyERRORBorder"] = { colors["Normal"], fg = t.error }
colors["NotifyWARNBorder"] = { colors["Normal"], fg = t.warning }
colors["NotifyINFOBorder"] = { colors["Normal"], fg = t.info }
colors["NotifyDEBUGBorder"] = { colors["Normal"], fg = t.punctuation }
colors["NotifyTRACEBorder"] = { colors["Normal"], fg = t.property }
colors["NotifyERRORIcon"] = colors["NotifyERRORBorder"]
colors["NotifyWARNIcon"] = colors["NotifyWARNBorder"]
colors["NotifyINFOIcon"] = colors["NotifyINFOBorder"]
colors["NotifyDEBUGIcon"] = colors["NotifyDEBUGBorder"]
colors["NotifyTRACEIcon"] = colors["NotifyTRACEBorder"]
colors["NotifyERRORTitle"] = colors["NotifyERRORBorder"]
colors["NotifyWARNTitle"] = colors["NotifyWARNBorder"]
colors["NotifyINFOTitle"] = colors["NotifyINFOBorder"]
colors["NotifyDEBUGTitle"] = colors["NotifyDEBUGBorder"]
colors["NotifyTRACETitle"] = colors["NotifyTRACEBorder"]
--

-- -- Visual Multi.
-- VM_Extend = { bg = colors.selection_inactive }
-- VM_Cursor = { bg = colors.selection_inactive, sp = colors.fg, underline = true }
-- VM_Insert = { sp = colors.fg, underline = true }
-- VM_Mono = { fg = colors.bg, bg = colors.comment }
--

-- hlargs (semantic parameter highlighting)
colors["Hlargs"] = colors["@parameter"]
--

-- virt-column
colors["VirtColumn"] = colors["Whitespace"]
--

-- indent blankline
-- IblScope = {}
-- RainbowDelimiterRed = {}
-- RainbowDelimiterYellow = {}
-- RainbowDelimiterBlue = {}
-- RainbowDelimiterOrange = {}
-- RainbowDelimiterGreen = {}
-- RainbowDelimiterViolet = {}
-- RainbowDelimiterCyan = {}

-- Neotest
colors["NeotestPassed"] = { fg = t.added }
colors["NeotestRunning"] = colors["DiagnosticInfo"]
colors["NeotestSkipped"] = colors["DiagnosticWarn"]
colors["NeotestFailed"] = colors["DiagnosticError"]
colors["NeotestAdapterName"] = {}
colors["NeotestBorder"] = {}
colors["NeotestDir"] = colors["Directory"]
colors["NeotestExpandMarker"] = {}
colors["NeotestFile"] = { fg = t.tag }
colors["NeotestFocused"] = {}
colors["NeotestIndent"] = {}
colors["NeotestMarked"] = {}
colors["NeotestNamespace"] = {}
colors["NeotestWinSelect"] = {}
colors["NeotestTarget"] = {}
colors["NeotestTest"] = {}
colors["NeotestUnknown"] = {}
colors["NeotestWatching"] = { fg = t.constant }

-- basic highlighting without treesitter
--

-- javascript
colors["javaScript"] = colors["Identifier"]
colors["javaScriptIdentifier"] = colors["Statement"]
colors["javaScriptFunction"] = colors["Statement"]
colors["javaScriptParens"] = colors["Punctuation"]
colors["javaScriptBraces"] = colors["Punctuation"]
colors["javaScriptNumber"] = colors["Number"]
--

-- typescript
colors["typeScriptImport"] = colors["Statement"]
colors["typeScriptExport"] = colors["Statement"]
colors["typeScriptIdentifier"] = colors["Statement"]
colors["typescriptVariable"] = colors["Statement"]
colors["typeScriptFunction"] = colors["Statement"]
colors["typescriptPredefinedType"] = colors["@type.builtin"]
colors["typescriptClassStatic"] = colors["Statement"]
colors["typescriptNodeGlobal"] = colors["Statement"]
colors["typescriptExceptions"] = colors["Statement"]
colors["typeScriptParens"] = colors["Punctuation"]
colors["typeScriptBraces"] = colors["Punctuation"]
colors["typescriptTypeBrackets"] = colors["Punctuation"]
colors["typescriptInterfaceTypeParameter"] = colors["Punctuation"]
colors["typescriptConditionalType"] = colors["Punctuation"]
colors["typeScriptNumber"] = colors["Number"]
colors["typeScriptAliasDeclaration"] = colors["Type"]
colors["typeScriptTypeReference"] = colors["Type"]
colors["typeScriptTypeParameter"] = colors["Type"]
colors["typescriptClassName"] = colors["Type"]
colors["typescriptClassHeritage"] = colors["Type"]
colors["typescriptProp"] = colors["Property"]
colors["typescriptOperator"] = colors["Operator"]
colors["typescriptBinaryOp"] = colors["Operator"]
colors["typescriptDocNotation"] = { fg = t.shade50 }
colors["typescriptDocTags"] = colors["typescriptDocNotation"]
--

-- json
colors["jsonKeyword"] = colors["Property"]
colors["jsonQuote"] = colors["String"]
colors["jsonBraces"] = colors["Punctuation"]
colors["jsonBraces"] = colors["jsonBraces"]
--

--html
colors["htmlTagName"] = colors["Tag"]
colors["htmlSpecialTagName"] = colors["Tag"]
colors["htmlTag"] = colors["htmlTagName"]
colors["htmlEndTag"] = colors["htmlTagName"]
colors["htmlTagN"] = colors["htmlTagName"]
colors["htmlArg"] = colors["Special"]
colors["htmlSpecialChar"] = colors["Constant"]
--

-- xml
colors["xmlTag"] = colors["Tag"]
colors["xmlProcessing"] = colors["Tag"]
colors["xmlProcessingDelim"] = colors["Tag"]
colors["xmlDoctypeDecl"] = colors["Tag"]
colors["xmlTagName"] = colors["Tag"]
colors["xmlDoctype"] = colors["Statement"]
colors["xmlAttrib"] = colors["Attribute"]
colors["xmlEqual"] = colors["Punctuation"]
colors["xmlEntityPunct"] = colors["Punctuation"]
colors["xmlEntity"] = colors["Constant"]
colors["xmlCdataStart"] = colors["@label"]
--

-- css
colors["cssProp"] = colors["Property"]
colors["cssBraces"] = colors["Punctuation"]
colors["cssNoise"] = colors["Punctuation"]
colors["cssSelectorOp"] = colors["Punctuation"]
colors["cssSelectorOp2"] = colors["Punctuation"]
colors["cssAttrComma"] = colors["Punctuation"]
colors["cssClassNameDot"] = colors["Punctuation"]
colors["cssFunctionComma"] = colors["Punctuation"]
colors["cssClassName"] = colors["Special"]
colors["cssIdentifier"] = colors["Type"]
colors["cssImportant"] = colors["Statement"]
colors["cssTagName"] = colors["Tag"]
colors["cssUrl"] = { colors["String"], gui = "underline" }
colors["cssUnitDecorators"] = colors["Constant"]
--

-- rust
colors["rustModPathSep"] = colors["Punctuation"]
colors["rustFoldBraces"] = colors["Punctuation"]
colors["rustBoxPlacementBalance"] = colors["Punctuation"]
colors["rustSigil"] = colors["Punctuation"]
colors["rustStorage"] = colors["Statement"]
--

-- ruby
colors["rubyConstant"] = colors["Constant"]
colors["rubyCurlyBlockDelimiter"] = colors["Punctuation"]
colors["rubyInterpolation"] = colors["Punctuation"]
colors["rubyInterpolationDelimiter"] = colors["Punctuation"]
colors["rubyStringDelimiter"] = colors["String"]
colors["rubyKeywordAsMethod"] = colors["Function"]
--

-- python
colors["pythonDecorator"] = colors["@annotation"]
colors["pythonDecoratorName"] = colors["@annotation"]
colors["pythonAttribute"] = colors["Property"]
colors["pythonBuiltin"] = colors["@type.builtin"]
--

-- yaml
colors["yamlBlockMappingKey"] = colors["Property"]
colors["yamlKeyValueDelimiter"] = colors["Punctuation"]
colors["yamlNodeTag"] = colors["Statement"]

-- flash.nvim
--https://github.com/folke/flash.nvim?tab=readme-ov-file#-highlights
colors["FlashBackdrop"] = { fg = t.fg, bg = t.bg }
colors["FlashMatch"] = { fg = t.selection, bg = t.grey40 }
colors["FlashCurrent"] = { fg = t.fg, bg = t.bg }
colors["FlashLabel"] = { fg = t.primary, bg = t.bg }
colors["FlashPrompt"] = { fg = t.fg, bg = t.bg }
colors["FlashCursor"] = { fg = t.fg, bg = t.bg }
-- colors["FlashPromptIcon"] = { fg = t.fg, bg = t.bg }

colorparser.parse(colors)

return colors
