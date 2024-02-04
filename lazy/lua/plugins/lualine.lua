-- return {}
-- local mode_map = {
--   ['n']    = 'NORMAL',
--   ['no']   = 'O-PENDING',
--   ['nov']  = 'O-PENDING',
--   ['noV']  = 'O-PENDING',
--   ['no�'] = 'O-PENDING',
--   ['niI']  = 'NORMAL',
--   ['niR']  = 'NORMAL',
--   ['niV']  = 'NORMAL',
--   ['nt']   = 'NORMAL',
--   ['v']    = 'VISUAL',
--   ['vs']   = 'VISUAL',
--   ['V']    = 'V-LINE',
--   ['Vs']   = 'V-LINE',
--   ['�']   = 'V-BLOCK',
--   ['�s']  = 'V-BLOCK',
--   ['s']    = 'SELECT',
--   ['S']    = 'S-LINE',
--   ['�']   = 'S-BLOCK',
--   ['i']    = 'INSERT',
--   ['ic']   = 'INSERT',
--   ['ix']   = 'INSERT',
--   ['R']    = 'REPLACE',
--   ['Rc']   = 'REPLACE',
--   ['Rx']   = 'REPLACE',
--   ['Rv']   = 'V-REPLACE',
--   ['Rvc']  = 'V-REPLACE',
--   ['Rvx']  = 'V-REPLACE',
--   ['c']    = 'COMMAND',
--   ['cv']   = 'EX',
--   ['ce']   = 'EX',
--   ['r']    = 'REPLACE',
--   ['rm']   = 'MORE',
--   ['r?']   = 'CONFIRM',
--   ['!']    = 'SHELL',
--   ['t']    = 'TERMINAL',
-- }
return {
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        disabled_filetypes = { winbar = { "dashboard", "alpha", "neo-tree", "Outline" } },
        component_separators = { left = "│", right = "│" },
        section_separators = { left = '', right = '' }
      },
      sections = {
        lualine_a = {
            {"mode", separator = { left = '', right = '' }, fmt = function(res) return res:sub(1, 3) end, padding = 0 },
        },
        lualine_b = {
            {"branch", separator = { right = '' } },
        },
      },
      winbar = {
        lualine_c = {
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          { "filename", path = 0, symbols = { modified = "  ", readonly = "", unnamed = "" } },
        },
      },
      inactive_winbar = {
        lualine_c = {
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          { "filename", path = 0, symbols = { modified = "  ", readonly = "", unnamed = "" } },
        },
      },
    },
  },
}
