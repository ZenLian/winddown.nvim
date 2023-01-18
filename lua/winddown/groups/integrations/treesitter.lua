local M = {}
function M.get()
  -- Reference: https://github.com/nvim-treesitter/nvim-treesitter/blob/master/CONTRIBUTING.md
  return {

    -- Misc
    ["@comment"] = {},
    ["@error"] = {},
    ["@preproc"] = {}, -- various preprocessor directives & shebangs
    ["@define"] = {}, -- preprocessor definition directives
    ["@operator"] = {}, -- For any operator: +, but also -> and * in C.

    -- Punctuation
    ["@punctuation.delimiter"] = {}, -- For delimiters ie: .
    ["@punctuation.bracket"] = {}, -- For brackets and parenthesis.
    ["@punctuation.special"] = {}, -- For special punctutation that does not fall in the catagories before.

    -- Literals
    ["@string"] = {}, -- For strings.
    ["@string.regex"] = {}, -- For regexes.
    ["@string.escape"] = {}, -- For escape characters within a string.
    ["@string.special"] = {}, -- other special strings (e.g. dates)

    ["@character"] = {}, -- character literals
    ["@character.special"] = {}, -- special characters (e.g. wildcards)

    ["@boolean"] = {}, -- For booleans.
    ["@number"] = {}, -- For all numbers
    ["@float"] = {}, -- For floats.

    -- Functions
    ["@function"] = {}, -- For function (calls and definitions).
    ["@function.builtin"] = {}, -- For builtin functions: table.insert in Lua.
    ["@function.call"] = {}, -- function calls
    ["@function.macro"] = {}, -- For macro defined functions (calls and definitions): each macro_rules in RusC.
    ["@method"] = {}, -- For method calls and definitions.

    ["@method.call"] = {}, -- method calls

    ["@constructor"] = {}, -- For constructor calls and definitions: = { } in Lua, and Java constructors.
    ["@parameter"] = {}, -- For parameters of a function.

    -- Keywords
    ["@keyword"] = {}, -- For keywords that don't fall in previous categories.
    ["@keyword.function"] = {}, -- For keywords used to define a fuction.
    ["@keyword.operator"] = {}, -- For new keyword operator
    ["@keyword.return"] = {},
    -- JS & derivative
    ["@keyword.export"] = {},

    ["@conditional"] = {}, -- For keywords related to conditionnals.
    ["@repeat"] = {}, -- For keywords related to loops.
    -- @debug            ; keywords related to debugging
    ["@label"] = {}, -- For labels: label: in C and :label: in Lua.
    ["@include"] = {}, -- For includes: #include in C, use or extern crate in Rust, or require in Lua.
    ["@exception"] = {}, -- For exception related keywords.

    -- Types

    ["@type"] = {}, -- For types.
    ["@type.builtin"] = {}, -- For builtin types.
    ["@type.definition"] = {}, -- type definitions (e.g. `typedef` in C)
    ["@type.qualifier"] = {}, -- type qualifiers (e.g. `const`)

    ["@storageclass"] = {}, -- visibility/life-time/etc. modifiers (e.g. `static`)
    ["@attribute"] = {}, -- attribute annotations (e.g. Python decorators)
    ["@field"] = {}, -- For fields.
    ["@property"] = {}, -- Same as TSField.

    -- Identifiers

    ["@variable"] = {}, -- Any variable name that does not have another highlighC.
    ["@variable.builtin"] = {}, -- Variable names that are defined by the languages, like this or self.

    ["@constant"] = {}, -- For constants
    ["@constant.builtin"] = {}, -- For constant that are built in the language: nil in Lua.
    ["@constant.macro"] = {}, -- For constants that are defined by macros: NULL in C.

    ["@namespace"] = {}, -- For identifiers referring to modules and namespaces.
    ["@symbol"] = {},

    -- Text

    ["@text"] = {}, -- For strings considerated text in a markup language.
    ["@text.strong"] = {}, -- bold
    ["@text.emphasis"] = {}, -- italic
    -- ["@text.underline"] = {}, -- underlined text
    ["@text.strike"] = {}, -- strikethrough text
    ["@text.title"] = {}, -- titles like: # Example
    ["@text.literal"] = {}, -- used for inline code in markdown and for doc in python (""")
    ["@text.uri"] = {}, -- urls, links and emails
    ["@text.math"] = {}, -- math environments (e.g. `$ ... $` in LaTeX)
    ["@text.environment"] = {}, -- text environments of markup languages
    ["@text.environment.name"] = {}, -- text indicating the type of an environment
    ["@text.reference"] = {}, -- references

    ["@text.todo"] = {}, -- todo notes
    ["@text.todo.checked"] = {}, -- todo notes
    ["@text.todo.unchecked"] = {}, -- todo notes
    ["@text.note"] = {},
    ["@text.warning"] = {},
    ["@text.danger"] = {},

    ["@text.diff.add"] = {}, -- added text (for diff files)
    ["@text.diff.delete"] = {}, -- deleted text (for diff files)

    -- Tags
    ["@tag"] = {}, -- Tags like html tag names.
    ["@tag.attribute"] = {}, -- Tags like html tag names.
    ["@tag.delimiter"] = {}, -- Tag delimiter like < > /

    -- Language specific:

    -- css
    ["@property.css"] = {},
    ["@property.id.css"] = {},
    ["@property.class.css"] = {},
    ["@type.css"] = {},
    ["@type.tag.css"] = {},
    ["@string.plain.css"] = {},
    ["@number.css"] = {},

    -- toml
    ["@property.toml"] = {}, -- Differentiates between string and properties

    -- json
    ["@label.json"] = {}, -- For labels: label: in C and :label: in Lua.

    -- lua
    ["@field.lua"] = {},
    ["@constructor.lua"] = {}, -- For constructor calls and definitions: = { } in Lua, and Java constructors.

    -- typescript
    ["@constructor.typescript"] = {},

    -- TSX (Typescript React)
    ["@constructor.tsx"] = {},
    ["@tag.attribute.tsx"] = {},

    -- cpp
    ["@property.cpp"] = {},

    -- yaml
    ["@field.yaml"] = {}, -- For fields.

    -- Ruby
    ["@symbol.ruby"] = {},

    -- PHP
    ["@type.qualifier.php"] = {}, -- type qualifiers (e.g. `const`)
  }
end
return M
