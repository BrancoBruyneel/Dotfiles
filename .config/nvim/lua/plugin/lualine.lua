require('lualine').setup{
  options = {
    theme = 'onedark',
    section_separators = {'', ''},
    component_separators = {'', ''},
    icons_enabled = true,
    disabled_filetypes = {'NvimTree'},
  },
  sections = {
    lualine_a = { {'mode', upper = true, icon = '' } },
    lualine_b = { {'branch', icon = ''} },
    lualine_c = { {'filename'} },
    lualine_x = { { 'diagnostics', sources = { 'nvim_lsp' } } },
    lualine_y = { 'filetype' },
    lualine_z = { 'location'  },
  },
  inactive_sections = {
    lualine_a = {  },
    lualine_b = {  },
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {  },
    lualine_z = {   }
  },
  extensions = { 'fugitive' }
}
