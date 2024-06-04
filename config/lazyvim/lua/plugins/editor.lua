return {
  -- zen-mode.nvim -- 🧘 Distraction-free coding for Neovim
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    config = true,
    keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
  },
  -- marks.nvim -- A better user experience for viewing and interacting with Vim marks.
  {
    "chentoast/marks.nvim",
    config = true,
  },
  -- pretty-fold.nvim -- Foldtext customization in Neovim
  {
    "anuvyklack/pretty-fold.nvim",
    config = true,
  },
}
