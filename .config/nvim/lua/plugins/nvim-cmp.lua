return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-emoji",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "f3fora/cmp-spell",
    "andersevenrud/cmp-tmux",
    "lukas-reineke/cmp-under-comparator",
    "onsails/lspkind.nvim",
  },
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    local cmp = require("cmp")
    -- Reset the table of sources (?)
    for k in pairs(opts.sources) do
      opts.sources[k] = nil
    end
    table.insert(opts.sources, { name = "nvim_lsp", label = "[lsp]", priority = 8, group_index = 1 })
    table.insert(
      opts.sources,
      { name = "luasnip", label = "[snippet]", priority = 7, max_item_count = 3, group_index = 1 }
    )
    table.insert(
      opts.sources,
      { name = "buffer", label = "[buffer]", priority = 8, keyword_length = 4, group_index = 2 }
    )
    table.insert(
      opts.sources,
      { name = "nvim_lsp_signature_help", label = "[lsp signature]", priority = 8, group_index = 1 }
    )
    table.insert(opts.sources, { name = "spell", label = "[spell]", priority = 6, group_index = 3 })
    table.insert(opts.sources, { name = "tmux", label = "[tmux]", priority = 6, keyword_length = 4, group_index = 2 })
    table.insert(opts.sources, { name = "path", label = "[path]", priority = 5, group_index = 2 })
    table.insert(opts.sources, { name = "emoji", label = "[emoji]", priority = 3, group_index = 3 })
    -- changing comparators
    -- ref : https://github.com/gennaro-tedesco/dotfiles/blob/4a175cce9f8f445543ac61cc6c4d6a95d6a6da10/nvim/lua/plugins/cmp.lua#L79-L88
    opts.sorting = {
      priority_weight = 2.0,
      comparators = {
        cmp.config.compare.locality,
        cmp.config.compare.recently_used,
        cmp.config.compare.score,
        cmp.config.compare.offset,
        cmp.config.compare.order,
        cmp.config.compare.exact,
        require("cmp-under-comparator").under, -- ease compare on __ functions
        -- cmp.config.compare.kind,
      },
    }

    opts.window = {
      completion = cmp.config.window.bordered({
        winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
        col_offset = -3,
        side_padding = 0,
        scrollbar = true,
      }),
      documentation = cmp.config.window.bordered(),
    }
    opts.formatting = {
      expandable_indicator = true,
      fields = { "kind", "abbr", "menu" },
      format = function(entry, vim_item)
        local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
        local strings = vim.split(kind.kind, "%s", { trimempty = true })
        kind.kind = " " .. (strings[1] or "") .. " "
        kind.menu = "    (" .. (strings[2] or "") .. ")"
        return kind
      end,
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
