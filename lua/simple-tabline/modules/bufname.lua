local M = {}
local utils = require 'simple-tabline.utils'

---@param opts simple-tabline.Config.Module
---@param tabpage table
---@return string
function M.get(opts, tabpage, _)
  local s = ''
  local bufname = vim.fn.bufname(tabpage.bufnr)
  if bufname == '' then
      s = opts.fallback
  else
    if opts.conf.fnamemodify.enable == true then
      s = vim.fn.fnamemodify(bufname, opts.conf.fnamemodify.mods)
    else
      s = bufname
    end
  end
  return utils.get_text(opts, s)
end

return M
