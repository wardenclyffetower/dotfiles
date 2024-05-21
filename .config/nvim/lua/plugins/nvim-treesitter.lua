return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = { "HiPhish/nvim-ts-rainbow2" },
  opts = function(_, opts)
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
    parser_config.gotmpl = {
      install_info = {
        url = "https://github.com/ngalaiko/tree-sitter-go-template",
        files = { "src/parser.c" },
      },
      filetype = "gotmpl",
      used_by = { "gohtmltmpl", "gotexttmpl", "gotmpl", "gohtml" },
    }
    parser_config.smarty = {
      install_info = {
        url = "https://github.com/Kibadda/tree-sitter-smarty",
        files = { "src/parser.c" },
        branch = "main",
      },
      filetype = "smarty",
      used_by = { "tpl" },
    }
    opts.highlight = {
      enable = false,
      disable = { "lua" },
    }
    opts.rainbow = {
      enable = true,
      query = "rainbow-parens",
      strategy = require("ts-rainbow").strategy.global,
    }
  end,
}
