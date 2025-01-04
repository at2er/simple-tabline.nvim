local M = {}
local utils = require 'simple-tabline.utils'

---@param opts simple-tabline.Config.Module
---@param index integer
function M.get(opts, _, index)
  return utils.get_text(opts, index)
end

return M
