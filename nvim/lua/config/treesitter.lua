require("nvim-treesitter.configs").setup({
  ensure_installed = { 
      -- Programming Languages
      "lua", "python", "bash", "javascript", "typescript",
      "go", "java", "c", "cpp", "c_sharp", "rust",

      -- Web Languages
      "html", "css", "scss", "json", "yaml", "toml", "xml",

      -- Other formats
      "markdown", "markdown_inline", "sql", "dockerfile", "gitignore"
  },
  highlight = { enable = true },
  indent = { enable = true },
})

