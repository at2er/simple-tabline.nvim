local M = {}

---@class simple-tabline.Config
M.opts = {
  modules = {
    ---@class simple-tabline.Config.Module
    ---@field conf table
    ---@field fallback string
    ---@field prefix string
    ---@field source string
    ---@field suffix string
    {
      conf = {},
      fallback = '',
      prefix = '',
      source = 'simple-tabline.modules.index',
      suffix = ':',
    },
    {
      conf = {
        fnamemodify = {
          enable = true,
          mods = ":t",
        },
      },
      fallback = '[No Name]',
      prefix = '',
      source = 'simple-tabline.modules.bufname',
      suffix = ' ',
    },
    {
      conf = {
        separator = ' ',
        err =  {
          sign = '󰅚 ',
          hl = 'TabLineDiagError',
          hl_sel = 'TabLineDiagErrorSel'
        },
        warn = {
          sign = '󰀪 ',
          hl = 'TabLineDiagWarn',
          hl_sel = 'TabLineDiagWarnSel'
        },
        info = {
          sign = '󰌶 ',
          hl = 'TabLineDiagInfo',
          hl_sel = 'TabLineDiagInfoSel'
        },
        hint = {
          sign = ' ',
          hl = 'TabLineDiagHint',
          hl_sel = 'TabLineDiagHintSel'
        },
      },
      fallback = '',
      prefix = '',
      source = 'simple-tabline.modules.diagnostic',
      suffix = '',
    },
    {
      conf = {},
      fallback = '[+]',
      prefix = '',
      source = 'simple-tabline.modules.modified',
      suffix = '',
    },
  },
  separator = { ' ', ' ' },
}

---@param opts simple-tabline.Config
function M.init(opts)
  M.opts = vim.tbl_deep_extend('force', M.opts, opts or {})
end

return M
