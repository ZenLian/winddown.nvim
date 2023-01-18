local M = {}

function M.get()
  return {
    -- Comment = {}, -- just comments
    -- SpecialComment = { link = "Special" }, -- special things inside a comment
    Constant = { fg = "fg" }, -- (preferred) any constant
    String = { fg = "fg" }, -- a string constant: "this is a string"
    Character = { fg = "fg" }, --  a character constant: 'c', '\n'
    Number = { fg = "fg" }, --   a number constant: 234, 0xff
    Float = { fg = "fg" }, --    a floating point constant: 2.3e10
    Boolean = { fg = "fg" }, --  a boolean constant: TRUE, false
    Identifier = { fg = "fg" }, -- (preferred) any variable name
    Function = { fg = "fg" }, -- function name (also: methods for classes)
    Statement = { fg = "fg" }, -- (preferred) any statement
    Conditional = { fg = "fg" }, --  if, then, else, endif, switch, etC.
    Repeat = { fg = "fg" }, --   for, do, while, etC.
    Label = { fg = "fg" }, --    case, default, etC.
    Operator = { fg = "fg" }, -- "sizeof", "+", "*", etC.
    Keyword = { fg = "fg" }, --  any other keyword
    Exception = { fg = "fg" }, --  try, catch, throw

    PreProc = { fg = "fg" }, -- (preferred) generic Preprocessor
    Include = { fg = "fg" }, --  preprocessor #include
    Define = { fg = "fg" }, -- preprocessor #define
    Macro = { fg = "fg" }, -- same as Define
    PreCondit = { fg = "fg" }, -- preprocessor #if, #else, #endif, etc.

    StorageClass = { fg = "fg" }, -- static, register, volatile, etC.
    Structure = { fg = "fg" }, --  struct, union, enum, etC.
    Special = { fg = "fg" }, -- (preferred) any special symbol
    Type = { fg = "fg" }, -- (preferred) int, long, char, etC.
    Typedef = { fg = "fg" }, --  A typedef
    SpecialChar = { fg = "fg" }, -- special character in a constant
    Tag = { fg = "fg" }, -- you can use CTRL-] on this
    Delimiter = { fg = "fg" }, -- character that needs attention
    -- Specialoverlay0= { }, -- special things inside a overlay0
    Debug = { fg = "fg" }, -- debugging statements

    -- Underlined = { style = { "underline" } }, -- (preferred) text that stands out, HTML links
    -- Bold = { style = { "bold" } },
    -- Italic = { style = { "italic" } },
    -- ("Ignore", below, may be invisible...)
    -- Ignore = { }, -- (preferred) left blank, hidden  |hl-Ignore|

    Error = { fg = "fg" }, -- (preferred) any erroneous construct
    Todo = { fg = "fg" }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX
    qfLineNr = { fg = "fg" },
    qfFileName = { fg = "fg" },
    htmlH1 = { fg = "fg" },
    htmlH2 = { fg = "fg" },
    -- mkdHeading = { fg = C.peach, style = { "bold" } },
    -- mkdCode = { bg = C.terminal_black, fg = C.text },
    mkdCodeDelimiter = { fg = "fg" },
    mkdCodeStart = { fg = "fg" },
    mkdCodeEnd = { fg = "fg" },
    -- mkdLink = { fg = C.blue, style = { "underline" } },

    -- debugging
    debugPC = { fg = "fg" }, -- used for highlighting the current line in terminal-debug
    debugBreakpoint = { fg = "fg" }, -- used for breakpoint colors in terminal-debug
    -- illuminate
    -- illuminatedWord = { bg = C.surface1 },
    -- illuminatedCurWord = { bg = C.surface1 },
    -- diff
    diffAdded = { fg = "fg" },
    diffRemoved = { fg = "fg" },
    diffChanged = { fg = "fg" },
    diffOldFile = { fg = "fg" },
    diffNewFile = { fg = "fg" },
    diffFile = { fg = "fg" },
    diffLine = { fg = "fg" },
    diffIndexLine = { fg = "fg" },
    DiffAdd = { fg = "fg" }, -- diff mode: Added line |diff.txt|
    DiffChange = { fg = "fg" }, -- diff mode: Changed line |diff.txt|
    DiffDelete = { fg = "fg" }, -- diff mode: Deleted line |diff.txt|
    DiffText = { fg = "fg" }, -- diff mode: Changed text within a changed line |diff.txt|
    -- NeoVim
    healthError = { fg = "fg" },
    healthSuccess = { fg = "fg" },
    healthWarning = { fg = "fg" },
  }
end

return M
