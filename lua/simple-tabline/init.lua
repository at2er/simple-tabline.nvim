local M = {}
local fn = vim.fn
local conf = require 'simple-tabline.config'

---@param opts simple-tabline.Config
---@param tabpage table
---@param index integer
---@return string
function M.module_apply(opts, tabpage, index)
  local s = ''
  for _, v in ipairs(opts.modules) do
    local vtype = type(v)
    local source
    if vtype == "string" then
      return v
    end
    if v.source and type(v.source) == "string" then
      source = require(v.source)
      s = s .. source.get(v, tabpage, index)
    end
  end
  if index == fn.tabpagenr('$') then
    s = s .. '%#TabLineFill#'
  end
  return s
end

---@param opts simple-tabline.Config
function M.tabline(opts)
  local s = ''
  for i = 1, fn.tabpagenr('$') do
    local tabpage = {}
    tabpage.winnr = fn.tabpagewinnr(i)
    tabpage.buflist = fn.tabpagebuflist(i)
    tabpage.bufnr = tabpage.buflist[tabpage.winnr]
    if i == fn.tabpagenr() then
      tabpage.issel = true
      s = s .. '%#TabLineSel#'
    else
      tabpage.issel = false
      s = s .. '%#TabLine#'
    end
    s = s .. opts.separator[1] .. M.module_apply(opts, tabpage, i) .. opts.separator[2]
  end
  return s
end

---@param opts simple-tabline.Config
function M.setup(opts)
  function _G.simple_tabline()
    return M.tabline(conf.opts)
  end

  conf.init(opts)
  vim.o.tabline = '%!v:lua.simple_tabline()'
end

return M
