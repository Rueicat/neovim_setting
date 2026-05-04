return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    -- 全域 diagnostic 顯示設定
    vim.diagnostic.config({
      virtual_text = true,    -- 行尾顯示錯誤訊息
      signs = true,           -- 行號旁的 icon
      underline = true,
      severity_sort = true,
    })

    -- 當 LSP 連上某個 buffer 時觸發（這是新的、推薦的寫法）
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }
        -- 這些是新增的 keymap，不會覆蓋 vim 原本的按鍵
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)        -- go to definition
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)        -- find references
        vim.keymap.set("n", "K",  vim.lsp.buf.hover, opts)             -- hover doc（K 原本是查 manpage，這算合理沿用）
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)    -- rename
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts) -- code action
      end,
    })
  end,
}
