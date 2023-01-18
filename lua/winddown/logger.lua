local M = {
  level = vim.log.levels.DEBUG,
  _setup = false,
}

local fmt = string.format
-- local logger

local log_levels = {
  { name = "trace", level = vim.log.levels.TRACE },
  { name = "debug", level = vim.log.levels.DEBUG },
  { name = "info", level = vim.log.levels.INFO },
  { name = "warn", level = vim.log.levels.WARN },
  { name = "error", level = vim.log.levels.ERROR },
}

M.log = function(msg, level)
  if not M._setup then
    M.setup()
  end
  if level < M.level then
    return
  end
  local mode = log_levels[M.level + 1]
  local str = fmt("[%-6s%s] %s\n", mode.name:upper(), os.date(), msg)
  local f = io.open(M.log_file, "a+")
  if f then
    f:write(str)
    f:close()
  end
end

M.setup = function()
  M.log_file = fmt("%s/winddown.log", vim.fn.stdpath("cache"))
  for _, mode in ipairs(log_levels) do
    M[mode.name] = function(msg, ...)
      M.log(fmt(msg, ...), mode.level)
    end
  end
  M._setup = true
end

return M
