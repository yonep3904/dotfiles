return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    config = function()
      require("bufferline").setup({
        options = {
          diagnostics = "nvim_lsp",
          separator_style = "slant"
        }
      })

      -- キーマップ
      vim.keymap.set("n", "<S-l>", ":bnext<CR>")
      vim.keymap.set("n", "<S-h>", ":bprevious<CR>")
    end
  }
}
