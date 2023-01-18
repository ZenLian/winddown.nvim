local util = require("winddown.util")

local M = {}

local defaults = {
  coding_minutes = 25,
  fade_minutes = 5,
  break_minutes = 5,
  fps = 12,
  auto_start = true,
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
