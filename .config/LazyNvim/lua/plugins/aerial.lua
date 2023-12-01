return {
  {
    "stevearc/aerial.nvim",
    opts = function(_, opts)
      -- opts.filter_kind = false
      -- opts.layout.max_width = { 40, 0.5 }
      -- opts.layout.min_width = 35
      opts.layout.default_direction = "prefer_left"
    end,
    keys = {
      { "<leader>a", "<cmd>AerialToggle<cr>", desc = "Aerial (Nav)" },
    },
  },
}
