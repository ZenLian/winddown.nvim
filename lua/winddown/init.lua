local config = require("winddown.config")
local fader = require("winddown.fader")
local logger = require("winddown.logger")

local M = {
  status = "stopped",

  _setup = false,
  _timer = nil,
  _first_active = nil,
  _last_active = nil,
  _coding_time = 0,
}

M.setup = function(opts)
  config.setup(opts)
  logger.setup()
  fader.setup()

  M._timer = vim.loop.new_timer()
  M.status = "stopped"
  vim.api.nvim_create_augroup("winddown", { clear = true })
  vim.api.nvim_create_autocmd({ "CursorMoved", "InsertCharPre" }, {
    group = "winddown",
    callback = M.record_activity,
  })

  M._setup = true
  if config.auto_start then
    M.start()
  end
end

M.start = function()
  if not M._setup then
    M.setup { auto_start = true }
    return
  end
  M._first_active = vim.loop.now()
  M._last_active = vim.loop.now()
  M._coding_time = 0
  local interval = 1000 * 60 / config.fps
  M.change_state("coding")
  M._timer:start(interval, interval, M.update)
end

M.reset = function()
  M._timer:stop()
  M._first_active = nil
  M._last_active = nil
  M._coding_time = 0
  fader.reset()
  -- M.change_state("stopped")
  M.start()
end

M.update = function()
  local now = vim.loop.now()
  local break_time = now - M._last_active

  -- break time due
  if break_time >= config.break_minutes * 60 * 1000 then
    logger.debug("break time due")
    M.reset()
    return
  end

  M._coding_time = now - M._first_active

  -- really need a break!
  if M._coding_time >= (config.coding_minutes + config.fade_minutes) * 60 * 1000 then
    M.change_state("overtime")
    return
  end

  -- need a break!
  if M._coding_time >= config.coding_minutes * 60 * 1000 then
    M.change_state("fading")
    local percentage = (M._coding_time - config.coding_minutes * 60 * 1000) / (config.fade_minutes * 60 * 1000)
    fader.fade(percentage)
    return
  end
end

M.record_activity = function()
  M._last_active = vim.loop.now()
end

M.change_state = function(state)
  if M.status ~= state then
    logger.debug("state: %s", state)
    M.status = state
  end
end

return M
