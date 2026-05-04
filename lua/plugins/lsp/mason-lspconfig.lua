-- mason-lspconfig:橋接 mason 與 nvim-lspconfig
-- 它做的事:
--   1. 把 mason 的命名(例如 "lua-language-server")對應到 lspconfig 的命名(例如 "lua_ls")
--   2. 自動為已安裝的 LSP server 啟用配置
return {
  "mason-org/mason-lspconfig.nvim",

  -- ===== 關鍵:dependencies 確保 mason 先被「載入」 =====
  -- 但載入 ≠ setup 完成,所以下面還要用 config 函式手動控制順序
  dependencies = {
    "mason-org/mason.nvim",
    "neovim/nvim-lspconfig",
  },

  -- 改用 config 函式而不是 opts,這樣可以「手動」確保 mason.setup() 先跑
  config = function()
    -- ===== 第一步:確保 mason 本體已經 setup =====
    -- 即使 mason.lua 裡有 opts = {},lazy.nvim 也可能還沒呼叫它的 setup
    -- 在這裡再 require 一次 mason,如果已 setup 過會是 no-op(無副作用)
    require("mason").setup()

    -- ===== 第二步:才能 setup mason-lspconfig =====
    require("mason-lspconfig").setup({
      -- 列出要自動安裝的 LSP server
      -- 注意:這裡用 mason-lspconfig 的命名(底線),不是 mason 介面看到的名字(連字號)
      ensure_installed = {
        "clangd",         -- C / C++
        "rust_analyzer",  -- Rust
        "pyright",        -- Python
        "lua_ls",         -- Lua(寫 nvim config 用)
      },

      -- v2.x 預設 true:會自動呼叫 vim.lsp.enable() 啟用每個已安裝的 server
      -- 如果你想手動控制每個 server 的詳細設定,可以設成 false
      automatic_enable = true,
    })
  end,
}
