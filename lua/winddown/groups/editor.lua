local M = {}

function M.get()
  return {
    -- ColorColumn = { bg = C.surface0 }, -- used for the columns set with 'colorcolumn'
    Conceal = {}, -- placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor = { fg = "bg", bg = "fg" }, -- character under the cursor
    lCursor = { fg = "bg", bg = "fg" }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
    CursorIM = { fg = "bg", bg = "fg" }, -- like Cursor, but used when in IME mode |CursorIM|
    -- CursorColumn = {}, -- Screen-column at the cursor, when 'cursorcolumn' is seC.
    -- CursorLine = {}, -- Screen-line at the cursor, when 'cursorline' is seC.  Low-priority if forecrust (ctermfg OR guifg) is not seC.
    Directory = {}, -- directory names (and other special names in listings)
    EndOfBuffer = { fg = "bg" }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
    ErrorMsg = {}, -- error messages on the command line
    VertSplit = {}, -- the column separating vertically split windows
    -- Folded = {}, -- line used for closed folds
    -- FoldColumn = {}, -- 'foldcolumn'
    SignColumn = {}, -- column where |signs| are displayed
    SignColumnSB = {}, -- column where |signs| are displayed
    -- Substitute = {}, -- |:substitute| replacement text highlighting
    LineNr = {}, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is seC.
    CursorLineNr = {}, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line. highlights the number in numberline.
    MatchParen = {}, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    ModeMsg = {}, -- 'showmode' message (e.g., "-- INSERT -- ")
    MsgArea = {}, -- Area for messages and cmdline
    -- MsgSeparator = {}, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg = {}, -- |more-prompt|
    NonText = {}, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    -- Normal = {}, -- normal text
    NormalNC = { fg = "fg", bg = "bg" }, -- normal text in non-current windows
    NormalSB = { fg = "fg", bg = "bg" }, -- normal text in non-current windows
    NormalFloat = { fg = "fg", bg = "bg" }, -- Normal text in floating windows.
    FloatBorder = {},
    Pmenu = { fg = "fg", bg = "bg" }, -- Popup menu: normal item.
    PmenuSel = { fg = "bg", bg = "fg" }, -- Popup menu: selected item.
    PmenuSbar = { bg = "bg" }, -- Popup menu: scrollbar.
    PmenuThumb = { bg = "fg" }, -- Popup menu: Thumb of the scrollbar.
    Question = {}, -- |hit-enter| prompt and yes/no questions
    QuickFixLine = { fg = "bg", bg = "fg" }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search = { fg = "bg", bg = "fg" }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand ouC.
    IncSearch = { fg = "bg", bg = "fg" }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    CurSearch = { fg = "bg", bg = "fg" }, -- 'cursearch' highlighting: highlights the current search you're on differently
    SpecialKey = {}, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' textspace. |hl-Whitespace|
    -- SpellBad = {}, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    -- SpellCap = {}, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    -- SpellLocal = {}, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    -- SpellRare = {}, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
    -- StatusLine = {}, -- status line of current window
    -- StatusLineNC = {}, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    TabLine = {}, -- tab pages line, not active tab page label
    -- TabLineFill = {}, -- tab pages line, where there are no labels
    TabLineSel = {}, -- tab pages line, active tab page label
    Title = {}, -- titles for output from ":set all", ":autocmd" etC.
    -- Visual = { fg = "bg", bg = "fg" }, -- Visual mode selection
    -- VisualNOS = { fg = "bg", bg = "fg" }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg = {}, -- warning messages
    Whitespace = {}, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    WildMenu = { fg = "bg", bg = "fg" }, -- current match in 'wildmenu' completion
    WinBar = { fg = "bg", bg = "fg" },
    -- These groups are not listed as default vim groups,
    -- but they are defacto standard group names for syntax highlighting.
    -- overlay0ed out groups should chain up to their "preferred" group by
    -- default,
    -- Unoverlay0 and edit if you want more specific syntax highlighting.
  }
end

return M
