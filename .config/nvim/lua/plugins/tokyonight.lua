return {
  "folke/tokyonight.nvim",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  enabled = true,
  config = function()
    require("tokyonight").setup({
      style = "night",
      transparent = true,
      styles = {
        sidebars = "transparent",
        float = "transparent",
      },
      terminal_colors = true,
      on_highlights = function(hl, c)
        hl.WinSeparator = { fg = c.white } -- Separator to ease pain on eyes
      end,
    })
    vim.cmd([[colorscheme tokyonight]])
  end,
}
