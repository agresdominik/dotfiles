call plug#begin('~/.local/share/nvim/plugged')

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-telescope/telescope.nvim', {'tag': '0.1.0', 'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'nvim-tree/nvim-tree.lua'

Plug 'nvim-tree/nvim-web-devicons' " Recommended (for coloured icons)
Plug 'akinsho/bufferline.nvim', { 'tag': '*' }
Plug 'nvim-lualine/lualine.nvim'

Plug 'lervag/vimtex'                  " Main LaTeX plugin for compilation and preview
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Ensure Treesitter is installed
Plug 'nvim-treesitter/nvim-treesitter-textobjects' " Better text objects in LaTeX
Plug 'nvim-lua/plenary.nvim'           " Dependency for some features
Plug 'nvim-telescope/telescope-bibtex.nvim' " For searching bibliography files
Plug 'godlygeek/tabular'               " Table formatting (useful for LaTeX tables)
Plug 'dpelle/vim-LanguageTool'         " Grammar and spell checking (supports German)
Plug 'aspeddro/cmp-pandoc.nvim'        " Completion for citations in LaTeX

" LSP and Autocompletion plugins
Plug 'neovim/nvim-lspconfig'               " LSP configuration
Plug 'hrsh7th/nvim-cmp'                   " Completion engine
Plug 'hrsh7th/cmp-nvim-lsp'               " LSP completion source
Plug 'hrsh7th/cmp-buffer'                 " Buffer completion source
Plug 'hrsh7th/cmp-path'                   " Path completion source
Plug 'saadparwaiz1/cmp_luasnip'           " Snippet completion source
Plug 'L3MON4D3/LuaSnip'                   " Snippet engine
Plug 'onsails/lspkind.nvim'               " LSP completion icons

" Git integration for showing git diff signs
Plug 'airblade/vim-gitgutter'

let g:indentLine_enabled = 1
set number

call plug#end()

let g:vimtex_view_method = 'zathura'  " Use Zathura as PDF viewer (change if needed)
let g:vimtex_compiler_method = 'latexmk'  " Continuous compilation
let g:vimtex_quickfix_mode = 0        " Disable quickfix window popups

" Automatically open quickfix if errors occur
autocmd User VimtexEventCompileFailed cwindow

set spell
set spelllang=de,en  " Enable German and English spell checking

" Enable treesitter syntax highlighting
lua << EOF
  require'nvim-treesitter.configs'.setup {
    highlight = {
      enable = true,              -- Enable highlighting
      disable = {},               -- List of languages to disable highlighting (optional)
    },
    ensure_installed = { "python", "go", "latex" }  -- Automatically install parsers for Python
  }
EOF

" Enable LSP and autocompletion
lua << EOF
  -- Set up nvim-cmp (autocompletion)
  local cmp = require'cmp'
  local lspkind = require'lspkind'

  cmp.setup({
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)  -- For snippet expansion
      end,
    },
    mapping = {
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = {
      { name = 'nvim_lsp' },
      { name = 'buffer' },
      { name = 'path' },
      { name = 'luasnip' },
    },
    formatting = {
      format = lspkind.cmp_format({ with_text = true, maxwidth = 50 }),
    },
  })

  -- Set up LSP (pyright for Python)
  local lspconfig = require'lspconfig'

  -- Python LSP setup
  lspconfig.pyright.setup({
    on_attach = function(client, bufnr)
      -- Enable diagnostics (squiggles for errors)
      vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
          virtual_text = true,         -- Enable inline error messages (squiggles)
          signs = true,                -- Enable error/warning signs in the gutter
          update_in_insert = false,    -- Don't update diagnostics while typing
        }
      )
    end
  })

  -- Set up Go LSP
  lspconfig.gopls.setup({
    on_attach = function(client, bufnr)
      vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
          virtual_text = true,
          signs = true,
          update_in_insert = false,
        }
      )
    end,
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
      },
    },
  })

EOF

lua << EOF
-- lualine (statusline)
require('lualine').setup()

-- bufferline (tabs)
require('bufferline').setup{}

require('nvim-web-devicons').setup {
    default = true; -- Enables default icons
}

require("nvim-tree").setup {
  view = {
    width = 30,
    side = "left",
  },
  renderer = {
    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
    },
  },
}


EOF


