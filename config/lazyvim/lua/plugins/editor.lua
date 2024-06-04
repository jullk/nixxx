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
  -- hardtime.nvim -- A Neovim plugin helping you establish good command workflow and quit bad habit
  {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    opts = {},
  },
  -- precognition.nvim -- Precognition uses virtual text and gutter signs to show available motions.
  -- {
  --   "tris203/precognition.nvim",
  --   --event = "VeryLazy",
  --   config = {
  --     -- startVisible = true,
  --     -- showBlankVirtLine = true,
  --     -- highlightColor = { link = "Comment" },
  --     -- hints = {
  --     --      Caret = { text = "^", prio = 2 },
  --     --      Dollar = { text = "$", prio = 1 },
  --     --      MatchingPair = { text = "%", prio = 5 },
  --     --      Zero = { text = "0", prio = 1 },
  --     --      w = { text = "w", prio = 10 },
  --     --      b = { text = "b", prio = 9 },
  --     --      e = { text = "e", prio = 8 },
  --     --      W = { text = "W", prio = 7 },
  --     --      B = { text = "B", prio = 6 },
  --     --      E = { text = "E", prio = 5 },
  --     -- },
  --     -- gutterHints = {
  --     --     -- prio is not currently used for gutter hints
  --     --     G = { text = "G", prio = 1 },
  --     --     gg = { text = "gg", prio = 1 },
  --     --     PrevParagraph = { text = "{", prio = 1 },
  --     --     NextParagraph = { text = "}", prio = 1 },
  --     -- },
  --   },
  -- },
}
