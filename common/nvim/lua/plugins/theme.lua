return {
  {
    "folke/tokyonight.nvim",
    lazy = false,  -- 起動時に必ず読み込む
    priority = 1000, -- colorschemeは最優先
    config = function()
        vim.cmd.colorscheme("tokyonight")
    end
  }
}
