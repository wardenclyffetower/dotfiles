return {
  "neovim/nvim-lspconfig",
  -- Unfortunately it seems that the event LazyFile does not support
  -- Nmread (netman remote)
  event = { "BufReadPost", "BufWritePost", "BufNewFile" },
}
