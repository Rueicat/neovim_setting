-- 2026/4/24 add plugin tool called "lazy.nvim"
-- 2026/4/22 my settings
-- 2026/4/28 many settings to run
    
--==================================
-- require, Lua's "import module", It's the same as #include, or use
--==================================
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4      
vim.opt.expandtab = true    --Change Tab to space


require("config.lazy")



--==============================
--    General settings
--==============================


--Line number
--vim.opt.number = true
vim.opt.relativenumber = true

--Search
vim.opt.ignorecase = true
vim.opt.smartcase = true   -- If it has Upper case, turn to case sensitive
vim.opt.hlsearch = true
vim.opt.incsearch = true   -- incremental, step by step
vim.cmd('packadd! nohlsearch')

--Appearance
vim.opt.termguicolors = true
vim.opt.scrolloff = 5          -- line gap of the edge
vim.opt.wrap = false
-- vim.opt.cursorline = false      -- I'm not used to it, vim.options if needed
vim.opt.signcolumn = "yes"        -- or auto, but prevents layout shifting



-- efficient and experience
vim.opt.updatetime = 250         -- for LSP hover
vim.opt.timeoutlen = 500         -- show the hints time
-- vim.opt.list = true            -- makes invisible characters visible
vim.opt.clipboard = "unnamedplus"  -- connect with sys clipboard

--==============================
--    LSP settings
--
--==============================
vim.diagnostic.config({
  -- Inline messages at the end of the line
  -- This shows the error text right after the problematic code
  virtual_text = {
    prefix = "●",         -- Symbol shown before the message
    spacing = 2,          -- Spacing between code and message
    source = "if_many",   -- Show source (e.g. "pyright") only if multiple LSPs
  },

  -- Icons in the sign column (left of line numbers)
  signs = true,

  -- Squiggly underline below problematic code
  underline = true,

  -- Sort by severity: Error > Warning > Info > Hint
  severity_sort = true,

  -- Don't update diagnostics while typing (better performance)
  -- Set to true if you want real-time feedback while in Insert mode
  update_in_insert = false,

  -- Floating window style (triggered by <leader>e or hover)
  float = {
    border = "rounded",   -- Rounded border looks cleaner
    source = true,        -- Always show which LSP reported the diagnostic
  },
})



--==============================
--          Keymaps
--          -------
--     noremap, no recursive map
--              - function in the mode:
--              - inoremap     insert mode
--              - vnoremap      visual mode
--              - nremap       normal mode
--    <leader> Special in Vim series, just custom prefix signal
--
--    vim.keymap.set(mode, lhs, rhs, opts)
--              - right hand side; left hand side, and options
--              - lhs is the new map meaning
--==============================



-- Highlight when yanking (copying) text.
-- Try it with `yap` in normal mode. See `:h vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  callback = function()
    vim.hl.on_yank()
  end,
})


-- ===== Diagnostic navigation keymaps =====

-- <leader>e : Show full diagnostic message in a floating window
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float,
  { desc = "Show line diagnostics" })

-- ]d / [d : Jump to next / previous diagnostic
vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count =  1 }) end,
  { desc = "Next diagnostic" })
vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1 }) end,
  { desc = "Previous diagnostic" })

-- <leader>q : Send all diagnostics to the location list
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist,
  { desc = "Open diagnostics list" })


-- vim.keymap.set("i", "<C-c>", "<Esc>",
--        {desc = "Make <C-c> like <Esc>"})

--=================================
-- About Neovide settings
-- ================================

-- ===== Neovide GUI specific settings =====
-- Only apply when running in Neovide (the GUI frontend)
-- These settings are ignored when nvim runs in terminal
if vim.g.neovide then
  -- Font (you need a Nerd Font installed)
  vim.o.guifont = "JetBrainsMono Nerd Font:h12"  -- font name : size


  -- Window transparency (0.0 = fully transparent, 1.0 = opaque)
  vim.g.neovide_opacity = 1.0

  -- Padding around the window
  vim.g.neovide_padding_top    = 5
  vim.g.neovide_padding_bottom = 5
  vim.g.neovide_padding_left   = 5
  vim.g.neovide_padding_right  = 5

  -- Use Cmd+C / Cmd+V (or Ctrl on Windows) for clipboard
  vim.g.neovide_input_use_logo = true

  -- Enable mouse support fully
  vim.opt.mouse = "a"

  -- close all the anamation
    vim.g.neovide_position_animation_length = 0
    vim.g.neovide_cursor_animation_length = 0.00
    vim.g.neovide_cursor_trail_size = 0
    vim.g.neovide_cursor_animate_in_insert_mode = false
    vim.g.neovide_cursor_animate_command_line = false
    vim.g.neovide_scroll_animation_far_lines = 0
    vim.g.neovide_scroll_animation_length = 0.00


end
