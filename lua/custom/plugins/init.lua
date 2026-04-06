-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

---@module 'lazy'
---@type LazySpec
return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
        options = {
          --          theme = 'dracula',
          section_separators = { right = '', left = '' },
          component_separators = '',
        },
        sections = {
          lualine_a = {
            {
              'mode',
              fmt = function(mode)
                -- Mapeamento de ícones NerdFonts para cada modo
                local mode_icons = {
                  ['NORMAL'] = ' NORMAL', -- Ícone para Modo Normal
                  ['INSERT'] = ' INSERT', -- Ícone para Modo Insert
                  ['VISUAL'] = '󰒅 VISUAL', -- Ícone para Modo Visual
                  ['V-LINE'] = ' VISUAL-LINE', -- Ícone para Visual Line
                  ['V-BLOCK'] = '󰒇 VISUAL-BLOCK', -- Ícone para Visual Block
                  ['COMMAND'] = ' COMMAND', -- Ícone para Modo Command
                  ['REPLACE'] = ' REPLACE', -- Ícone para Modo Replace
                  ['TERMINAL'] = ' TERMINAL', -- Ícone para Terminal
                  ['SELECT'] = '󰒅 SELECT', -- Ícone para Modo Select
                }
                -- Retorna o ícone correspondente ou o nome original do modo
                return mode_icons[mode] or mode
              end,
            },
          },
          lualine_b = { 'branch' },
          lualine_c = { 'filename' },
          lualine_x = { 'encoding', 'fileformat', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
      }
    end,
  },

  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      require('catppuccin').setup {
        flavour = 'mocha', -- Usando mocha como solicitado
      }
      vim.cmd.colorscheme 'catppuccin-mocha'
    end,
  },
}
