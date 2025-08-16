return {
  {
    "dracula/vim",
    lazy = false,
    priority = 1000,
    enabled = true,
    config = function()
      vim.g.dracula_italics = 1
      vim.g.dracula_colorterm = 0
      vim.cmd.colorscheme("dracula")
      vim.api.nvim_set_hl(0, "Pmenu", { bg = "#282A36" })
      vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", {
        fg = "#6272A4",
        bg = "#282A36"
      })
    end
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    enabled = false,
    config = function()
      require("tokyonight").setup({
        style = "moon"
      })
      vim.cmd.colorscheme("tokyonight")
    end
  }
}
