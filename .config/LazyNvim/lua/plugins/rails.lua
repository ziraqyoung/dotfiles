return {
  {
    "tpope/vim-bundler",
    lazy = true,
    event = function()
      return { "BufReadPost", "BufNewFile" }
    end,
  },
  {
    "tpope/vim-rails",
    lazy = true,
    event = function()
      return { "BufReadPost", "BufNewFile" }
    end,
    config = function()
      -- disable autocmd set filetype=eruby.yaml
      vim.api.nvim_create_autocmd({ "BufNewFile", "BufReadPost" }, {
        pattern = { "*.yml" },
        callback = function()
          vim.bo.filetype = "yaml"
        end,
      })
    end,
  },
  {
    "tpope/vim-rake",
    lazy = true,
    event = function()
      return { "BufReadPost", "BufNewFile" }
    end,
  },
  {
    "RRethy/nvim-treesitter-endwise",
    ft = { "ruby", "eruby" },
    config = function()
      require("nvim-treesitter.configs").setup {
        endwise = {
          enable = true,
        },
      }
    end,
  },
  {
    "tpope/vim-haml",
    ft = { "haml" },
    lazy = true,
    event = function()
      return { "BufReadPost", "BufNewFile" }
    end,
  },
  {
    "weizheheng/ror.nvim",
    dependencies = { "rcarriga/nvim-notify", "stevearc/dressing.nvim" },
    config = function() require("ror").setup {} end,
  },
  "sunaku/vim-ruby-minitest",
}
