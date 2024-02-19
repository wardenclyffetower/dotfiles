return {
  {
    "nvim-telescope/telescope.nvim",
    -- change some options
    opts = {
      defaults = {
        layout_strategy = "vertical",
        layout_config = { width = 0.99, height = 0.99, preview_cutoff = 1 },
        path_display = { "smart" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
  },
}
