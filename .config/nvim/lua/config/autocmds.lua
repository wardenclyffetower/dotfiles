-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- *************************************************************************
-- tests
-- *************************************************************************

MyAutoCommands = vim.api.nvim_create_augroup("MyAutoCommands", { clear = true })

vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
  pattern = { "yaml" },
  group = "MyAutoCommands",
  -- command = "echo 'Hello World !!!!'",
  callback = function()
    local notify = require("notify")
    local lvl = {
      "ERROR",
      "WARN",
      "INFO",
      "DEBUG",
    }
    notify({ "Hello World !!!" }, lvl, {
      title = "TEST",
      timeout = 10000,
      keep = function()
        return lvl == "ERROR" or lvl == "WARN"
      end,
    })
  end,
  -- local lspconfig = require("lspconfig")
  -- if buffer name is a remote one
  -- local bufferName = vim.fn.getbufname
  -- vim.api.nvim_notify(bufferName, "debug")
  -- vim.api.nvim_command('echo "Hello world !!!!!"')
  -- vim.api.nvim_notify("hello world !", "debug")
  -- if string.find(bufferName, "^ssh://") then
  -- this is remote file opened by Netman
  --  vim.api.nvim_notify("This is a NetMan opened file !", "debug")
  -- end
  -- lspconfig.util.root_pattern(vim.fn.getcwd())
  -- end,
})

-- *************************************************************************
-- GPG Autocmds
-- *************************************************************************

local gpgGroup = vim.api.nvim_create_augroup("customGpg", { clear = true })

-- autocmds execute in the order in which they were defined.
-- https://neovim.io/doc/user/autocmd.html#autocmd-define

vim.api.nvim_create_autocmd({ "BufReadPre", "FileReadPre" }, {
  pattern = "*.gpg",
  group = gpgGroup,
  callback = function()
    -- Make sure nothing is written to shada file while editing an encrypted file.
    vim.opt_local.shada = nil
    -- We don't want a swap file, as it writes unencrypted data to disk
    vim.opt_local.swapfile = false
    -- Switch to binary mode to read the encrypted file
    vim.opt_local.bin = true

    vim.cmd("let ch_save = &ch|set ch=2")
  end,
})

vim.api.nvim_create_autocmd({ "BufReadPost", "FileReadPost" }, {
  pattern = "*.gpg",
  group = gpgGroup,
  callback = function()
    vim.cmd("'[,']!gpg --decrypt 2> /dev/null")

    -- Switch to normal mode for editing
    vim.opt_local.bin = false

    vim.cmd("let &ch = ch_save|unlet ch_save")
    vim.cmd(":doautocmd BufReadPost " .. vim.fn.expand("%:r"))
  end,
})

-- Convert all text to encrypted text before writing
vim.api.nvim_create_autocmd({ "BufWritePre", "FileWritePre" }, {
  pattern = "*.gpg",
  group = gpgGroup,
  command = "'[,']!gpg --default-recipient-self -ae 2>/dev/null",
})
-- Undo the encryption so we are back in the normal text, directly
-- after the file has been written.
vim.api.nvim_create_autocmd({ "BufWritePost", "FileWritePost" }, {
  pattern = "*.gpg",
  group = gpgGroup,
  command = "u",
})

-- *************************************************************************
-- GO TEMPLATES
-- *************************************************************************

-- vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
--   pattern = { "*.gohtml", "*.go.html" },
--   callback = function()
--     vim.opt_local.filetype = "gohtmltmpl"
--   end,
-- })

-- vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
--   pattern = { "*.gotmpl", "*.go.tmpl" },
--   callback = function()
--     vim.opt_local.filetype = "gotexttmpl"
--   end,
-- })

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  command = "if search('{{.\\+}}', 'nw') | setlocal filetype=gotmpl | endif",
})

-- Not sure if this works.. (ftplugin works better)
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "neo-tree" },
  callback = function()
    require("ufo").detach()
    vim.opt_local.foldenable = false
  end
})

--
-- autocmd BufNewFile,BufRead * if search('{{.\+}}', 'nw') | setlocal filetype=gotmpl | endif
--
-- local api = vim.api
-- go to last loc when opening a buffer
--  api.nvim_create_autocmd(
--    "BufReadPost",
--    { command = [[if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif]] }
--  )
