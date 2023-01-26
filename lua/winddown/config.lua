local util = require("winddown.util")

local M = {}

local defaults = {
  coding_minutes = 25, -- keep coding for 25 minutes, colors will start fading out
  fade_minutes = 5, -- time before colors completely faded
  break_minutes = 5, -- no activity in 5 minutes, then colors will be normal
  fps = 12,
  auto_start = true,
  events = "KeyPress", -- "KeyPress" for every key input, or events like `{ "CursorMoved", "InsertCharPre" }`
  integrations = {
    treesitter = true,
  },
  highlights = {
    ["Normal"] = { fg = "fg", bg = "bg" },
  },
}

M.setup = function(opts)
  M.config = vim.tbl_deep_extend("force", defaults, opts or {})
  local normal = M.config.highlights["Normal"]
  if normal.fg == "fg" then
    normal.fg = util.get_hl_attr("Normal", "fg")
  end
  if normal.bg == "bg" then
    normal.bg = util.get_hl_attr("Normal", "bg")
  end
  -- require("winddown.logger").debug("Normal: fg=%s, bg=%s", normal.fg, normal.bg)
end

return setmetatable(M, {
  __index = function(_, key)
    if M.config == nil then
      M.setup()
    end
    return M.config[key]
  end,
})
