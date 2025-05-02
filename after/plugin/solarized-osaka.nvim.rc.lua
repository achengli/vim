require'solarized-osaka'.setup{
  transparent = true,
  terminal_colors = true,
  styles = {
    comments = {italic = true},
    keywords = {italic = true},
    functions= {bold = true},
    variables= {},
    slidebars= 'dark',
    floats   = 'transparent',
  },
  day_brightness = 1.0,
  night_brightness = 1.0,
  on_highlights = function(hl, c)
    local prompt = "#2d3149"
    hl.TelescopeNormal = {
      bg = c.bg_dark,
      fg = c.fg_dark,
    }
    hl.TelescopeBorder = {
      bg = c.bg_dark,
      fg = c.bg_dark,
    }
    hl.TelescopePromptNormal = {
      bg = c.bg_dark,
      fg = c.fg_dark,
    }
    hl.TelescopePromptBorder = {
      bg = c.bg_dark,
      fg = c.fg_dark,
    }
    hl.TelescopePromptTitle = {
      bg = c.bg_dark,
      fg = c.fg_dark,
    }
    hl.TelescopePreviewTitle = {
      bg = c.bg_dark,
      fg = c.bg_dark,
    }
    hl.TelescopeResultsTitle = {
      bg = c.bg_dark,
      fg = c.bg_dark,
    }
  end,
}

-- vim.cmd[[color solarized-osaka]]
