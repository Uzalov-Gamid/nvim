return {
  {
    "NvChad/nvim-colorizer.lua",
    event = "BufReadPost",
    config = function()
      require("colorizer").setup({
        filetypes = {
          "*",
          "!lazy",
          "!mason",
          "!snacks_dashboard",
          "!snacks_picker_list",
          "!help",
          "!neo-tree",
        },
        user_default_options = {
          names = false,
          RGB = true,
          RRGGBB = true,
          rgb_fn = true,
          hsl_fn = true,
          mode = "foreground",
        },
      })
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.options = opts.options or {}
      opts.options.theme = "gruvbox"
      opts.options.component_separators = { left = "", right = "" }
      opts.options.section_separators = { left = "", right = "" }
      opts.options.globalstatus = true
      return opts
    end,
  },
}
