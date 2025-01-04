local M = {}
local diagnostic = vim.diagnostic
local severity = diagnostic.severity

---@return table
local function get_count(buf)
  local count = diagnostic.count(buf)
  local result = {}
  result.err = count[severity.ERROR]
  result.warn = count[severity.WARN]
  result.info = count[severity.INFO]
  result.hint = count[severity.HINT]
  return result
end

---@param opts table
---@param count integer
---@return string
local function get_text(opts, count)
  if count ~= nil then
    return opts.sign .. count
  end
  return ''
end

---@param opts simple-tabline.Config.Module
---@param tabpage table
function M.get(opts, tabpage, _)
  local count = get_count(tabpage.bufnr)
  return get_text(opts.conf.err, count.err)
    .. get_text(opts.conf.warn, count.warn)
    .. get_text(opts.conf.info, count.info)
    .. get_text(opts.conf.hint, count.hint)
end

return M
