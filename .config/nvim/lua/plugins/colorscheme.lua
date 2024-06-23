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
