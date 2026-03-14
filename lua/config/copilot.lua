require("copilot").setup {
  suggestion = {
    enabled = true,
    auto_trigger = true,
    keymap = {
      accept        = "<M-l>",   -- Alt-l: accept full suggestion
      accept_word   = "<M-w>",   -- Alt-w: accept one word
      accept_line   = "<M-e>",   -- Alt-e: accept one line
      next          = "<M-]>",   -- Alt-]: next suggestion
      prev          = "<M-[>",   -- Alt-[: previous suggestion
      dismiss       = "<M-x>",   -- Alt-x: dismiss suggestion
    },
  },
  -- Keep panel disabled; use suggestion ghost text instead
  panel = { enabled = false },
  filetypes = {
    yaml = true,
    markdown = true,
    help = false,
    gitcommit = true,
    gitrebase = false,
    ["."] = false,
  },
}
