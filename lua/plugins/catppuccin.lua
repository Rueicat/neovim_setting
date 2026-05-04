return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  lazy = false,
  -- opts 是「資料」，lazy.nvim 會在 plugin 安裝完成後才用它呼叫 setup()
  -- 所以不會有「plugin 還沒下載就 require」的問題
  opts = {
    flavour = "latte",
    integrations = {
      treesitter = true,
      mason = true,
      native_lsp = { enabled = true },
    },
  },
  -- init 在 plugin 載入「之前」執行，但只有同步、不依賴 plugin 本體的程式碼可以放這
  -- colorscheme 套用要在 setup 之後,所以放 config 裡
  config = function(_, opts)
    require("catppuccin").setup(opts)         -- 此時 plugin 已下載完成,可以 require
    vim.cmd.colorscheme("catppuccin-latte")   -- 套用 colorscheme
  end,
}
