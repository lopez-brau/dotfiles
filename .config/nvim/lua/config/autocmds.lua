-- Check if we're using WSL.
if vim.fn.has("wsl") == 1 then
  -- Revert the cursor to the default shape upon quit/suspend.
  vim.api.nvim_create_autocmd({"VimLeave", "VimSuspend"}, {
    pattern = {"*"},
    callback = function()
      vim.o.guicursor = ""
      vim.api.nvim_chan_send(vim.v.stderr, '\x1b[0 q')
    end
  })
end

-- Trim trailing whitespace when saving certain files.
vim.api.nvim_create_autocmd({"BufWritePre"}, {
  pattern = {"*"},
  callback = function()
    local cursor_position = vim.fn.winsaveview()
    vim.cmd([[keeppatterns %s/\s\+$//e]])
    vim.fn.winrestview(cursor_position)
  end
})
