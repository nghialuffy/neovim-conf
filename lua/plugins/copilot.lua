return {
  {
    "tpope/vim-sleuth",
    "github/copilot.vim",
    lazy = false,
    config = function()
      return require("config.copilot")
    end,
  },
}
