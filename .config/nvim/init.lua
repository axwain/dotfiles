local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

require("lazy").setup({
    {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
	    "nvim-lua/plenary.nvim"
	}
    },
    {
	"navarasu/onedark.nvim",
	style="dark"
    },
    {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function ()
	    local configs = require("nvim-treesitter.configs")
	    configs.setup({
		ensure_installed = {
            "c",
            "cpp",
            "css",
            "go",
            "html",
            "javascript",
            "json",
            "lua",
            "typescript",
            "vim",
            "vimdoc"
        },
		sync_install = false,
		highlight = { enable = true },
		indent = { enable = true },
	    })
	end
    },
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},
    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/nvim-cmp'},
    {'L3MON4D3/LuaSnip'}
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

vim.api.nvim_set_hl(0, "Normal", { bg = "none" } )
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" } )

local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
	"clangd",
	"cssls",
	"emmet_ls",
	"eslint",
	"gopls",
	"html",
	"jsonls",
	"tsserver",
	"lua_ls",
	"marksman",
	"sqlls",
	"yamlls"
    },
    handlers = {
        lsp_zero.default_setup,
    },
})

local lspconfig = require('lspconfig')

lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using
        -- (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {
          'vim',
          'require'
        },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.scrolloff = 8
vim.opt.colorcolumn = "80"
vim.opt.wrap = false
