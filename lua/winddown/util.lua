local M = {}

M.hex2rgb = function(hex)
  local r, g, b = string.match(hex, "^#(%x%x)(%x%x)(%x%x)$")
  assert(r ~= nil, string.format("invalid hex: %s", hex))
  return vim.tbl_map(function(v)
    return tonumber(v, 16)
  end, { r, g, b })
end

---@param fg string foreground color
---@param bg string background color
---@param alpha number number between 0 and 1. 0 results in bg, 1 results in fg
M.blend = function(fg, bg, alpha)
  local fgcolor = M.hex2rgb(fg)
  local bgcolor = M.hex2rgb(bg)
  local rgb = {}
  for i = 1, 3 do
    local ret = (alpha * fgcolor[i] + ((1 - alpha) * bgcolor[i]))
    rgb[i] = math.floor(math.min(math.max(0, ret), 255) + 0.5)
  end
  return string.format("#%02X%02X%02X", unpack(rgb))
end

M.get_hl_attr = function(name, attr)
  local attr_maps = {
    fg = "foreground",
    bg = "background",
    sp = "special",
  }
  local is_color = false
  if attr_maps[attr] then
    is_color = true
    attr = attr_maps[attr]
  end
  local hl = vim.api.nvim_get_hl_by_name(name, true)
  local value = hl[attr]
  if is_color then
    value = string.format("#%x", value)
  end
  return value
end

return M
