return {
  "ahmedkhalf/project.nvim",
  lazy = false,
  -- keys = { {
  --   "<leader>tp",
  --   "<cmd>:Telescope projects<cr>",
  --   desc = "Projects",
  -- } },
  config = function()
    require("project_nvim").setup()
  end,
}
