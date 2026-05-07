-- lua/plugins/completion.lua
return {
  "saghen/blink.cmp",
  version = "1.*",                -- 鎖定 V1 穩定版（避免抓到開發中的 V2）
  event = "InsertEnter",          -- 進入 Insert 模式才載入

  opts = {
    -- 按鍵設定
    keymap = {
      preset = "enter",       -- VSCode 風格：Tab 接受補全
    },

    -- 外觀設定
    appearance = {
      nerd_font_variant = "mono",
    },

    -- 補全來源（順序就是優先級）
    sources = {
      default = { "lsp", "path", "buffer" },
      -- lsp    = LSP 補全（pyright、clangd 等）
      -- path   = 檔案路徑補全
      -- buffer = 當前緩衝區文字補全
    },

    -- 補全選單行為
    completion = {
      documentation = {
        auto_show = true,         -- 自動顯示說明文件
        auto_show_delay_ms = 200, -- 延遲 200ms 再顯示
      },
    },

    -- ⚠️ 關鍵：強制使用純 Lua 的 fuzzy matcher
    -- 這是 opts 頂層欄位，跟 keymap、appearance 同層級
    -- 避免下載 Rust binary（中文路徑會讓 curl 失敗）
    fuzzy = {
      implementation = "lua",
    },
  },
}
