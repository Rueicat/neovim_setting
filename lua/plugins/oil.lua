return {
  "stevearc/oil.nvim",
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    default_file_explorer = true,  -- 取代 netrw（vim 內建的檔案瀏覽器）
    view_options = {
      show_hidden = true,           -- 顯示隱藏檔
    },

    float = {
        padding = 4,
        max_width = 0.5,
        max_height = 0.6,
        border = "rounded",
        win_options = {
            winblend = 30,
        },
    },

    keymaps = {
      ["<C-h>"] = false,            -- 解除預設衝突的 keymap（避免覆蓋你習慣的）
    },
  },
  -- 用相依方式載入 icon 套件（可選但推薦）
  dependencies = { "nvim-tree/nvim-web-devicons", "refractalize/oil-git-status.nvim", },
  -- 用 keys 觸發 lazy load
  keys = {
    { "-", "<cmd>Oil<cr>", desc = "Open parent directory in Oil" },
    { "_", "<cmd>Oil --float<cr>", desc = "floaat mode" },
  },
}
