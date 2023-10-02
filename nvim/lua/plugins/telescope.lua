return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "debugloop/telescope-undo.nvim",
    },
    config = function()
      require("telescope").setup({
        extensions = {
          undo = {
            use_delta = true,
            use_custom_command = nil, -- setting this implies `use_delta = false`. Accepted format is: { "bash", "-c", "echo '$DIFF' | delta" }
            side_by_side = false,
            diff_context_lines = vim.o.scrolloff,
            entry_format = "state #$ID, $STAT, $TIME",
            time_format = "",
            mappings = {
              i = {
                -- IMPORTANT: Note that telescope-undo must be available when telescope is configured if
                -- you want to replicate these defaults and use the following actions. This means
                -- installing as a dependency of telescope in it's `requirements` and loading this
                -- extension from there instead of having the separate plugin definition as outlined
                -- above.
                ["<cr>"] = require("telescope-undo.actions").yank_additions,
                ["<S-cr>"] = require("telescope-undo.actions").yank_deletions,
                ["<C-cr>"] = require("telescope-undo.actions").restore,
              },
            },
          },
        },
      })
      require("telescope").load_extension("undo")
      -- optional: vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")
    end,
  },
}
