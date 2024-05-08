return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
        -- This will not install any breaking changes.
        -- For major updates, this must be adjusted manually.
        version = "^1.0.0",
        -- add live grep args
        config = function()
          require("telescope").load_extension("live_grep_args")
        end,
      },
    },
    -- change some options
    opts = function(_, opts)
      -- This function allows to select multiple files under telescope with the <tab> and use <CR> to open either
      -- one or multiple files
      local select_one_or_multi = function(prompt_bufnr)
        local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
        local multi = picker:get_multi_selection()
        if not vim.tbl_isempty(multi) then
          require("telescope.actions").close(prompt_bufnr)
          for _, j in pairs(multi) do
            if j.path ~= nil then
              vim.cmd(string.format("%s %s", "edit", j.path))
            end
          end
        else
          require("telescope.actions").select_default(prompt_bufnr)
        end
      end -- end function select_one_or_multi

      opts.defaults = {
        -- prefered appareance for telescope
        layout_strategy = "vertical",
        layout_config = { width = 0.99, height = 0.99, preview_cutoff = 1 },
        path_display = { "smart" },
        sorting_strategy = "ascending",
        winblend = 0,
        mappings = {
          i = {
            ["<CR>"] = select_one_or_multi,
          },
        },
      }

      opts.extensions = {
        live_grep_args = {
          auto_quoting = true,
        },
      }
    end, -- end opts function
  },
}
