vim.env.PATH = vim.env.PATH .. ":" .. vim.fn.expand("$HOME/go/bin")

-- Set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Basic settings
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 8
vim.o.list = true
vim.o.listchars = 'tab:» ,lead:·,trail:•'
vim.opt.updatetime = 300 -- Faster update for diagnostic windows

-- Indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.smartindent = true
vim.opt.autoindent = true

-- Color
vim.cmd.colorscheme("wildcharm")

-- File Handling
vim.opt.undofile = true
local undodir = vim.fn.expand("~/.vim/undodir")
if vim.fn.isdirectory(undodir) == 0 then
  vim.fn.mkdir(undodir, "p")
end
vim.opt.undodir = undodir

-- ============================================================================
-- AUTOCOMMAND GROUPS (Fixes the 'augroup' error)
-- ============================================================================
local general_cmds = vim.api.nvim_create_augroup("GeneralCmds", { clear = true })
local go_lsp_group = vim.api.nvim_create_augroup("GoLSP", { clear = true })

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  group = general_cmds,
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- ============================================================================
-- DIAGNOSTICS (Fixes missing error descriptions)
-- ============================================================================
vim.diagnostic.config({
  virtual_text = true,           -- Shows error text next to the line
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = "always",           -- Shows that the error comes from 'gopls'
  },
})

-- ============================================================================
-- GO LSP SETUP
-- ============================================================================

-- Start gopls
vim.api.nvim_create_autocmd("FileType", {
  group = go_lsp_group,
  pattern = { "go", "gomod", "gowork", "gotmpl" },
  callback = function(args)
    local bufnr = args.buf

    if not vim.lsp.get_clients({ bufnr = bufnr })[1] then
      vim.lsp.start({
        name = "gopls",
        cmd = { "gopls" },
        root_dir = vim.fn.getcwd(),
        settings = {
          gopls = {
            analyses = { unusedparams = true },
            staticcheck = true,
	    hints = {
	      assignVariableTypes = true,
	      compositeLiteralFields = true,
	      compositeLiteralTypes = true,
	      constantValues = true,
	      functionTypeParameters = true,
	      parameterNames = true,
	      rangeVariableTypes = true,
	    },
          },
        },
      })
    end
  end,
})

-- LSP keymaps and UI behavior
vim.api.nvim_create_autocmd("FileType", {
  group = go_lsp_group,
  pattern = "go",
  callback = function()
    local bufnr = vim.api.nvim_get_current_buf()
    vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

    local opts = { noremap = true, silent = true, buffer = bufnr }

    -- Navigation
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)     -- Go to definition
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts) -- Go to implementation
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)     -- List all references
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)           -- Show documentation/hover info
    vim.keymap.set("n", "<leader>o", vim.lsp.buf.document_symbol, opts) -- Show file outline

    -- Toggle Inlay Hints (Visual aid for parameter names/types)
    vim.keymap.set("n", "<leader>h", function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    end, opts)

    -- Refactoring
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)      -- Rename symbol under cursor
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts) -- Show available code actions
    
    -- Diagnostic/Error Navigation (The fix for your issue)
    vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts) -- Show error details in popup
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)         -- Jump to prev error
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)         -- Jump to next error
  end,
})

-- Format on save
vim.api.nvim_create_autocmd("BufWritePre", {
  group = go_lsp_group,
  pattern = "*.go",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})
