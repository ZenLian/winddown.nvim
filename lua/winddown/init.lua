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

  _due_time = {
    coding = 0,
    fading = 0,
    over = 0,
    breaking = 0,
  },
}

M.setup = function(opts)
  config.setup(opts)
  logger.setup()
  fader.setup()

  M._timer = vim.loop.new_timer()
  M.status = "stopped"
  M._due_time.coding = config.coding_minutes * 60 * 1000
  M._due_time.fading = config.fade_minutes * 60 * 1000
  M._due_time.over = (config.coding_minutes + config.fade_minutes) * 60 * 1000
  M._due_time.breaking = config.break_minutes * 60 * 1000

  if config.events == "KeyPress" then
    vim.on_key(M.record_activity, fader.namespace)
  else
    vim.api.nvim_create_augroup("winddown", { clear = true })
    vim.api.nvim_create_autocmd(config.events, {
      group = "winddown",
      callback = M.record_activity,
    })
  end

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
  M.start()
end

M.update = function()
  local now = vim.loop.now()
  local break_time = now - M._last_active

  -- break time due
  if break_time >= M._due_time.breaking and M.change_state("breaking") then
    M.reset()
    return
  end

  M._coding_time = now - M._first_active

  -- need a break!
  if M._coding_time >= M._due_time.coding then
    if M.status == "overtime" then
      return
    elseif M._coding_time >= M._due_time.over then
      -- really need a break!
      -- donot return here, make sure the last frame fade out
      M.change_state("overtime")
    else
      M.change_state("fading")
    end
    local percentage = (M._coding_time - M._due_time.coding) / M._due_time.fading
    fader.fade(percentage)
    return
  end
end

M.record_activity = function()
  M._last_active = vim.loop.now()
end

M.change_state = function(state)
  if M.status == state then
    return false
  end
  logger.debug("state: %s", state)
  M.status = state
  return true
end

return M
