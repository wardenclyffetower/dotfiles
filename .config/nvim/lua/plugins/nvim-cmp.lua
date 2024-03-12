return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-emoji",
    "f3fora/cmp-spell",
    "andersevenrud/cmp-tmux",
    "lukas-reineke/cmp-under-comparator",
  },
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    local cmp = require("cmp")
    table.insert(opts.sources, { name = "spell", label = "[spell]" })
    table.insert(opts.sources, { name = "tmux", label = "[tmux]" })
    table.insert(opts.sources, { name = "emoji", label = "[emoji]" })

    -- changing comparators
    -- ref : https://github.com/gennaro-tedesco/dotfiles/blob/4a175cce9f8f445543ac61cc6c4d6a95d6a6da10/nvim/lua/plugins/cmp.lua#L79-L88
    opts.sorting.comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,
      cmp.config.compare.recently_used,
      require("cmp-under-comparator").under, -- ease compare on __ functions
      cmp.config.compare.kind,
    }
  end,
}

-- default sources
-- { {
--     group_index = 1,
--     name = "nvim_lsp",
--     option = {}
--   }, {
--     group_index = 1,
--     name = "path",
--     option = {}
--   }, {
--     group_index = 2,
--     name = "buffer",
--     option = {}
--   }, {
--     group_index = 1,
--     name = "luasnip",
--     option = {}
--   }, {
--     group_index = 1,
--     label = "[spell]",
--     name = "spell",
--     option = {}
--   }, {
--     group_index = 1,
--     label = "[tmux]",
--     name = "tmux",
--     option = {}
--   }, {
--     group_index = 1,
--     label = "[emoji]",
--     name = "emoji",
--     option = {}
--   } }
