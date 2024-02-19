return {
  "nvim-neo-tree/neo-tree.nvim",
  enabled = true,
  cmd = "Neotree",
  lazy = true,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      filesystem = {
        hijack_netrw_behavior = "open_default",
        bind_to_cwd = false,
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
      },
      reveal = true,
      position = "float",
      window = {
        width = 35,
      },
      sources = {
        "filesystem", -- Neotree filesystem source
        "netman.ui.neo-tree", -- The one you really care about 😉
        "document_symbols",
        "git_status",
      },
    })
    -- render background of tree transparent
    vim.cmd([[hi NeoTreeNormal guibg=NONE ctermbg=NONE]])
    vim.cmd([[hi NeoTreeNormalNC guibg=NONE ctermbg=NONE]])
  end,
}
