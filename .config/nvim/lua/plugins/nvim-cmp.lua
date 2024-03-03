return {
  "hrsh7th/nvim-cmp",
  dependencies = { "hrsh7th/cmp-emoji", "f3fora/cmp-spell" },
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    table.insert(opts.sources, { name = "emoji" })
    table.insert(opts.sources, { name = "spell" })
  end,
}
