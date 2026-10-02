return {
  'numToStr/Comment.nvim',
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    {
      'JoosepAlviste/nvim-ts-context-commentstring',
      opts = {
        enable_autocmd = false,
      },
    },
  },
  config = function()
    local ok, ts_comment = pcall(
      require,
      'ts_context_commentstring.integrations.comment_nvim'
    )

    require('Comment').setup({
      pre_hook = ok and ts_comment.create_pre_hook() or nil,
      padding = true,
      sticky = true,
    })
  end,
}
