-- Neovim does not define these YAML sub-filetypes, but nvim-lspconfig's yamlls
-- advertises them in its `filetypes`, which makes `:checkhealth vim.lsp` report
-- them as unknown filetypes. Registering them with `vim.filetype.add()` (rather
-- than plain ftdetect autocmds) also puts them into `vim.filetype`'s registry,
-- which is what the health check consults, and makes them available to language
-- servers such as helm-ls.
--
-- Dotted filetypes are handled natively by Neovim: the part before the dot is
-- also used for ftplugin/indent/syntax lookup, and
-- `vim.treesitter.language.get_lang()` resolves `yaml.*` back to the `yaml`
-- parser, so highlighting and options are unaffected.
vim.filetype.add {
  filename = {
    [".gitlab-ci.yml"] = "yaml.gitlab",
    [".gitlab-ci.yaml"] = "yaml.gitlab",
    ["docker-compose.yml"] = "yaml.docker-compose",
    ["docker-compose.yaml"] = "yaml.docker-compose",
    ["compose.yml"] = "yaml.docker-compose",
    ["compose.yaml"] = "yaml.docker-compose",
    ["values.yml"] = "yaml.helm-values",
    ["values.yaml"] = "yaml.helm-values",
  },
  pattern = {
    -- e.g. docker-compose.dev.yml, docker-compose.override.yaml
    ["docker%-compose%..+%.ya?ml"] = "yaml.docker-compose",
  },
}
