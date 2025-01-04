local M = {}

---@param module simple-tabline.Config.Module
---@param s any
---@return string
function M.get_text(module, s)
  if s then
    return module.prefix .. s .. module.suffix
  end
  return ''
end

return M
