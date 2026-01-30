return {
  {
    "saghen/blink.cmp",
    opts = {
      enabled = function()
        return vim.tbl_contains({ "tex", "lean", "lua" }, vim.bo.filetype)
      end,
    },
  },
}
