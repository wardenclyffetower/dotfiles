return {
  "neovim/nvim-lspconfig",
  -- Unfortunately it seems that the event LazyFile does not support
  -- Nmread (netman remote)
  event = { "BufReadPost", "BufWritePost", "BufNewFile", "BufEnter" },
  cmd = { "Nmread", "BufReadCmd", "FileReadCmd" },
  -- lsp configs are lazy-loaded or can be triggered after LSP installation,
  -- so we need a way to make LSP clients attached to already existing buffers.
  --
  -- LazyVim.lsp.attach_lsp_to_existing_buffers = vim.schedule_wrap(function()
  --   -- this can be easily achieved by firing an autocmd event for the open buffers.
  --   -- See lspconfig.configs (config.autostart)
  --   for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
  --     local valid = vim.api.nvim_buf_is_valid(bufnr) and vim.bo[bufnr].buflisted
  --     if valid and vim.bo[bufnr].buftype == "" then
  --       local augroup_lspconfig = vim.api.nvim_create_augroup("lspconfig", { clear = false })
  --       vim.api.nvim_exec_autocmds("FileType", { group = augroup_lspconfig, buffer = bufnr })
  --     end
  --   end
  -- end),

  opts = {
    servers = {
      gopls = {
        filetypes = { "go", "gomod", "gowork" }, -- get rid of gotmpl FileType
        capabilities = {
          textDocument = {
            foldingRange = {
              dynamicRegistration = false,
              lineFoldingOnly = true,
            },
          },
        },
      },
      lua_ls = {
        capabilities = {
          textDocument = {
            foldingRange = {
              dynamicRegistration = false,
              lineFoldingOnly = true,
            },
          },
        },
      },
    },
  },
}
