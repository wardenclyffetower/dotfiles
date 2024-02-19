return {

  -- move around
  "smoka7/hop.nvim",
  lazy = false,
  enabled = true,

  -- you can configure Hop the way you like here; see :h hop-config
  config = function()
    require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
    local hop = require("hop")
    local directions = require("hop.hint").HintDirection

    -- f normal behaviour
    vim.keymap.set("", "f", function()
      hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
    end, { remap = true })
    vim.keymap.set("", "F", function()
      hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
    end, { remap = true })

    -- f but for whole page (l)
    vim.keymap.set("", "l", function()
      hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false })
    end, { remap = true })
    vim.keymap.set("", "L", function()
      hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false })
    end, { remap = true })

    -- t normal behaviour
    vim.keymap.set("", "t", function()
      hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
    end, { remap = true })
    vim.keymap.set("", "T", function()
      hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
    end, { remap = true })
  end,
}
