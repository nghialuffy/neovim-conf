if true then
  return {}
end

return {
  { "ellisonleao/gruvbox.nvim" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
  {
    "folke/trouble.nvim",
    opts = { use_diagnostic_signs = true },
  },
  { "folke/trouble.nvim", enabled = false },
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      table.insert(opts.sources, { name = "emoji" })
    end,
  },
  -- pyright to lspconfig
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        pyright = {
          filetypes = { "python" },
          capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
          on_attach = function(client, bufnr)
            require("cmp_nvim_lsp").setup({ client = client })
          end,
        },
      },
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ---@class PluginNullLsOpts
    ft = { "python" },
    opts = function(_, opts)
      return require("config.null-ls")
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
    },
  },

  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    vim.list_extend(opts.ensure_installed, {
      "tsx",
      "typescript",
    })
  end,
},
{
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function(_, opts)
    table.insert(opts.sections.lualine_x, "😄")
  end,
},
{
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function()
    return {}
  end,
},
-- use mini.starter instead of alpha
{ import = "lazyvim.plugins.extras.ui.mini-starter" },
-- add jsonls and schemastore packages, and setup treesitter for json, json5 and jsonc
{ import = "lazyvim.plugins.extras.lang.json" },
{
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "black",
      "mypy",
      "ruff",
      "debugpy",
      "stylua",
      "shellcheck",
      "shfmt",
      "flake8",
    },
  },
}
