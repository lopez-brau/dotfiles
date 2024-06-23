-- Check if we're using WSL.
if vim.fn.has("wsl") == 1 then
  -- Set the clipboard.
  vim.g.clipboard = {
    name = "WslClipboard",
    copy = {
      ["+"] = "clip.exe",
      ["*"] = "clip.exe",
    },
    paste = {
      ["+"] = "powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace('`r', ''))",
      ["*"] = "powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace('`r', ''))",
    },
    cache_enabled = 0,
  }
end

-- Enable 24-bit color.
if (vim.fn.has("termguicolors")) then
  vim.o.termguicolors = true
end

-- Define the leader key.
vim.g.mapleader = " "

-- Show line numbers
vim.o.number = true

-- Set tab width to 2.
vim.o.tabstop = 2

-- Set indentation width to 2.
vim.o.shiftwidth = 2

-- Convert tabs to spaces.
vim.o.expandtab = true
