local config = require("winddown.config")
local PREFIX = ... .. "."

local M = {}
function M.get()
  local integrations = config.integrations
  local result = {}
  for integration, value in pairs(integrations) do
    if value ~= true then
      break
    end
    result = vim.tbl_deep_extend("force", result, require(PREFIX .. integration).get())
  end

  return result
end
return M
