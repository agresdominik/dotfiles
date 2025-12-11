-- Set leader key to Space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Load basic settings
require("config.options")
require("config.keymaps")

-- Load plugins (lazy.nvim will be auto-installed)
require("config.plugins")

-- Plugin-specific configuration
require("config.lsp")
require("config.treesitter")
require("config.telescope")
require("config.cmp")
