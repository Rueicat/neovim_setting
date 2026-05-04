return {
  "CopilotC-Nvim/CopilotChat.nvim",

  -- 依賴 copilot.lua 和一些基礎套件
  dependencies = {
    "zbirenbaum/copilot.lua",
    "nvim-lua/plenary.nvim",   -- 非同步工具，CopilotChat 需要
  },

  -- 在這些指令被呼叫時才載入（lazy loading）
  cmd = {
    "CopilotChat",       -- 開啟 chat 視窗
    "CopilotChatToggle", -- 切換開關
    "CopilotChatReset",  -- 清除對話
  },

  opts = {
    -- Chat 視窗的位置和大小
    window = {
      layout = "vertical",  -- 'vertical' = 右側 sidebar | 'horizontal' = 下方
      width = 0.35,         -- 佔畫面寬度的 35%
    },

    -- 顯示設定
    show_help = false,        -- 不顯示按鍵提示（熟了之後可以關掉）
    auto_follow_cursor = true, -- chat 視窗自動跟著游標的上下文

    -- 你可以在這裡設定預設的 system prompt 語言
    -- system_prompt = "請用繁體中文回答所有問題。",
  },

  -- 設定快捷鍵
  keys = {
    {
      "<leader>cc",
      "<cmd>CopilotChatToggle<CR>",
      desc = "Toggle Copilot Chat",
    },
    {
      "<leader>cr",
      "<cmd>CopilotChatReset<CR>",
      desc = "Reset Copilot Chat",
    },
    -- Visual mode：選取程式碼後直接問 Copilot
    {
      "<leader>ce",                     -- chat Explain
      "<cmd>CopilotChatExplain<CR>",
      mode = "v",
      desc = "Copilot Explain selected code",
    },
    {
      "<leader>cf",
      "<cmd>CopilotChatFix<CR>",         --chat Fix
      mode = "v",
      desc = "Copilot Fix selected code",
    },
  },
}
