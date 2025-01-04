local M = {}
local utils = require 'simple-tabline.utils'

---@param opts simple-tabline.Config.Module
---@param tabpage table
function M.get(opts, tabpage, _)
  local bufmodified = vim.fn.getbufvar(tabpage.bufnr, '&mod')
  if bufmodified == 1 then
    return utils.get_text(opts, opts.fallback)
  end
  return ''
end

return M
