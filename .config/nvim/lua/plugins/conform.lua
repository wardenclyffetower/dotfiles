return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      sql = { "sleek_fmt" },
    },
    formatters = {
      sleek_fmt = {
        command = "sleek",
      },
    },
  },
}
