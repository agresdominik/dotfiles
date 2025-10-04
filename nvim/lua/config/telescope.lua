local telescope = require("telescope")

telescope.setup({
  defaults = {
    prompt_prefix = "🔍 ",
    selection_caret = " ",
    path_display = { "smart" },
    sorting_strategy = "ascending",
    layout_config = { prompt_position = "top" },
  },
  pickers = {
    find_files = {
      hidden = true, -- show hidden files
    },
  },
})

-- Optional: keymaps for quick access
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Grep text" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find help" })
vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Recent files" })

