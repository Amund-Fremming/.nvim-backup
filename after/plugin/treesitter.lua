require('nvim-treesitter').setup()

require('nvim-treesitter').install {
  "javascript", "typescript", "c_sharp", "c", "lua", "vim", "vimdoc",
}

vim.api.nvim_create_autocmd('FileType', {
  callback = function()
    pcall(vim.treesitter.start)
  end,
})
