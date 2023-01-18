local config = require("winddown.config")
local util = require("winddown.util")
local logger = require("winddown.logger")

local M = {
  namespace = nil,
  hltarget = nil,
  hlcache = nil,
  _setup = false,
  _faded = false,
}

M.setup = function()
  logger.info("fader setup")
  M._setup = true
  M.namespace = vim.api.nvim_create_namespace("winddown")
  M.cache_highlight()
end

M.cache_highlight = function()
  M.hlcache = {}

  -- all highlight groups
  local syntax = require("winddown.groups.syntax").get()
  local integrations = require("winddown.groups.integrations").get()
  local groups = vim.tbl_deep_extend("keep", config.highlights, syntax, integrations)
  local fg, bg = groups["Normal"].fg, groups["Normal"].bg

  for name, hl in pairs(groups) do
    -- cache original colors
    local hlcache = vim.api.nvim_get_hl_by_name(name, true)
    if hlcache.foreground then
      hlcache.fg = string.format("#%x", hlcache.foreground)
      hlcache.foreground = nil
    end
    if hlcache.background then
      hlcache.bg = string.format("#%x", hlcache.background)
      hlcache.background = nil
    end
    M.hlcache[name] = hlcache

    -- handle "fg" and "bg"
    if vim.tbl_isempty(hl) then
      hl.fg = "fg"
    end
    if hl.fg == "fg" then
      hl.fg = fg
    end
    if hl.bg == "bg" then
      hl.bg = bg
    end
  end
  M.hltarget = groups
end

M.reset = function()
  M._faded = false
  vim.schedule(function()
    vim.api.nvim_set_hl_ns(0)
    vim.cmd("redraw!")
  end)
end

M.fade = function(percentage)
  if not M._setup then
    M.setup()
  end
  if not M._faded then
    M._faded = true
    vim.schedule(function()
      vim.api.nvim_set_hl_ns(M.namespace)
    end)
  end

  percentage = math.min(1, math.max(0, percentage))
  vim.schedule(function()
    for name, hl in pairs(M.hlcache) do
      local hl_now = {}
      for k, v in pairs(hl) do
        if (k == "fg" or k == "bg") and M.hltarget[name][k] then
          hl_now[k] = util.blend(v, M.hltarget[name][k], 1 - percentage)
        else
          hl_now[k] = v
        end
      end
      -- local fg = hl.foreground
      local ok = pcall(vim.api.nvim_set_hl, M.namespace, name, hl_now)
      if not ok then
        logger.error("nvim_set_hl: %s = %s", name, vim.inspect(hl_now))
      end
    end
    vim.cmd("redraw!")
  end)
end

return M
