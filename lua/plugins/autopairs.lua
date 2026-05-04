return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",   -- 進入 insert mode 才載入（lazy load）
  opts = {
    check_ts = true,        -- 整合 tree-sitter，更聰明地判斷該不該補全
    -- 例如在字串裡打 ' 不會莫名其妙被配對
  },
}
