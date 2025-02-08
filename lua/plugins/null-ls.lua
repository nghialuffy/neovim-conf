return 
  {
    "jose-elias-alvarez/null-ls.nvim",
    ---@class PluginNullLsOpts
    ft = { "python" },
    opts = function()
      return require("config.null-ls")
    end,
  }