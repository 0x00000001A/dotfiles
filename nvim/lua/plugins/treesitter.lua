return {
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      for _, config in pairs(require("nvim-treesitter.parsers").get_parser_configs()) do
        config.install_info.url = config.install_info.url:gsub("https://github.com/", "https://kgithub.com/")
      end
    end,
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "javascript", "typescript", "tsx" })
        vim.list_extend(opts.ensure_installed, { "html", "css", "scss", "json" })
      end
    end,
  },
}
