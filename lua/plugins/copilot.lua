-- lua/plugins/copilot.lua
return {
  "zbirenbaum/copilot.lua",  -- the plugin repository

  -- Load it when entering insert mode (lazy loading — faster startup)
  event = "InsertEnter",

  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = true,   -- show suggestions automatically as you type
      hide_during_composition = true,  -- hide suggestions while typing (optional)
      keymap = {
        accept = "<Tab>",        -- press Tab to accept the suggestion
        accept_word = false,     -- accept one word at a time (disabled)
        accept_line = false,     -- accept one line at a time (disabled)
        next = "<M-]>",          -- Alt+] to see next suggestion
        prev = "<M-[>",          -- Alt+[ to see previous suggestion
        dismiss = "<C-]>",       -- Ctrl+] to dismiss suggestion
      },
    },
    panel = {
      enabled = false,  -- the side panel (not needed if using inline suggestions)
    },
  },
}
