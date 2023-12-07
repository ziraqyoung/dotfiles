vim.opt.shiftwidth = 2
vim.opt.scrolloff = 2
vim.opt.tabstop = 2
vim.opt.relativenumber = true
-- vim.opt.guicursor = "n-v-c:block-Cursor/lCursor"
vim.opt.guicursor = {
  "n-v:block-block-Cursor/lCursor",
  "i-c-ci-ve:ver25-Cursor/lCursor",
  "r-cr:hor20",
  "o:hor50",
  "i:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor",
  "sm:block-blinkwait175-blinkoff150-blinkon175",
}
vim.opt.list = true
vim.opt.listchars = {
  eol = "↲",
  space = "·",
  tab = "» ",
  trail = "·",
  extends = "<",
  precedes = ">",
  nbsp = "␣",
  conceal = "┊",
}
vim.opt.wrap = true
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- vim.opt.foldlevel = 99

vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- general
lvim.log.level = "info"
lvim.format_on_save = {
  enabled = true,
  pattern = "*.lua",
  timeout = 1000,
}

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<leader>a"] = "<cmd>AerialToggle<CR>"
lvim.keys.normal_mode["<leader>rc"] = ":lua require('ror.commands').list_commands()<CR>"

lvim.keys.normal_mode["|"] = ":vsplit<CR>"
lvim.keys.normal_mode["\\"] = ":split<CR>"

local options = { noremap = true }
vim.keymap.set("i", "jj", "<Esc>", options)
lvim.builtin.which_key.mappings["e"] = { "<cmd>NvimTreeFocus<CR>", "Explorer" }

-- Lspsage
vim.api.nvim_set_keymap("n", "<leader>ll", "<cmd>Other<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>lp", "<cmd>OtherSplit<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>lv", "<cmd>OtherVSplit<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>lc", "<cmd>OtherClear<CR>", { noremap = true, silent = true })

-- toggleterm
-- vim.api.nvim_set_keymap("t", "<Esc><Esc>", "<C-\\><C-n>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<C-v>", "<C-\\><C-n>", { noremap = true, silent = true })

-- Pretty Telescope keymaps (+ Lspsaga)
lvim.lsp.buffer_mappings.normal_mode["gr"] = { "<cmd>Telescope lsp_references<cr>", "Goto references" }
lvim.lsp.buffer_mappings.normal_mode["gd"] = { "<cmd>Telescope lsp_definitions<cr>", "Goto definiton" }
lvim.lsp.buffer_mappings.normal_mode["gi"] = { "<cmd>Telescope lsp_implementations<cr>", "Goto implementation" }
lvim.lsp.buffer_mappings.normal_mode["gD"] = { "<cmd>Telescope lsp_type_definitions<cr>", "Goto type definiton" }
lvim.lsp.buffer_mappings.normal_mode["gs"] = { "<cmd>Telescope lsp_document_symbols<cr>", "Goto document symbols" }
lvim.keys.normal_mode["gp"] = ":Lspsaga peek_definition<CR>"
lvim.keys.normal_mode["go"] = ":Lspsaga outline<CR>"
lvim.keys.normal_mode["ga"] = ":Lspsaga code_action<CR>"
lvim.keys.normal_mode["gR"] = ":Lspsaga rename<CR>"
-- lvim.keys.normal_mode["gh"] = ":Lspsaga hover_doc<CR>"
-- lvim.keys.normal_mode["gd"] = ":Lspsaga finder<CR>"
-- lvim.keys.normal_mode["gr"] = ":Lspsaga peek_definition<CR>"
-- vim.keymap.set("n", "go", "<cmd> Lspsaga show_line_diagnostics<cr>", { noremap = true, silent = true })
-- vim.keymap.set("n", "gt", "<cmd> Lspsaga peek_type_definition<cr>")

-- Conform
lvim.builtin.which_key.mappings["l"]["f"] = {
  ":lua require('conform').format({ async = true, lsp_fallback = true })<CR>",
  "LSP format",
}

-- Neotest
lvim.builtin.which_key.mappings["dm"] = { "<cmd>lua require('neotest').run.run()<cr>", "Test Method" }
lvim.builtin.which_key.mappings["dM"] =
{ "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", "Test Method DAP" }
lvim.builtin.which_key.mappings["df"] = {
  "<cmd>lua require('neotest').run.run({vim.fn.expand('%')})<cr>",
  "Test Class",
}
lvim.builtin.which_key.mappings["dF"] = {
  "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>",
  "Test Class DAP",
}
lvim.builtin.which_key.mappings["dS"] = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Test Summary" }

-- Noice
lvim.builtin.which_key.mappings["nl"] = { ":lua require('noice').cmd('last')<CR>", "show last notification" }
lvim.builtin.which_key.mappings["nh"] = { ":lua require('noice').cmd('history')<CR>", "show notification history" }
lvim.builtin.which_key.mappings["nd"] = {
  ":lua require('noice').cmd('dismiss')<CR>",
  "Dismis all visible notification",
}
-- Trouble
lvim.builtin.which_key.mappings["x"] = {
  name = "Trouble",
  t = { "<cmd>TroubleToggle<cr>", "trouble" },
  w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
  D = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
  q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
  l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
  i = { "<cmd>TroubleToggle lsp_implementations<cr>", "implementations" },
  r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
  d = { "<cmd>TroubleToggle lsp_definitions<cr>", "definitions" },
  T = { "<cmd>TroubleToggle lsp_type_definitions<cr>", "type definitions" },
}
-- Mini.files
lvim.builtin.which_key.mappings["m"] = {
  name = "Minifiles",
  f = {
    ":lua require('mini.files').open(vim.api.nvim_buf_get_name(0), true)<cr>",
    "Open mini.files (directory of current file)",
  },
}

-- Spectre/Search
lvim.builtin.which_key.mappings["s"] = {
  name = "Search / Replace (Spectre)",
  s = { ":lua require('spectre').toggle()<cr>", "Toggle spectre" },
  t = { ":TodoTelescope<cr>", "Search all project  Todos" },
}

-- Oil.nvim (another option is -)
lvim.keys.normal_mode["<leader>O"] = ":Oil<CR>"

-- -- Change theme settings
-- lvim.colorscheme = "onedark"
-- lvim.colorscheme = "everforest"
-- lvim.colorscheme = "nordic"
-- lvim.colorscheme = "catppuccin"
-- lvim.colorscheme = "NeoSolarized"
-- lvim.colorscheme = "onedark_vivid" -- onedark, onelight, onedark_vivid, onedark_dark
lvim.colorscheme = "github_dark_dimmed"

-- After changing plugin config exit and reopen LunarVim, Run :PackerSync
lvim.builtin.dap.active = true
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.breadcrumbs.active = false
lvim.builtin.lualine.icons_enabled = true
-- lvim.builtin.lualine.sections.lualine_a = { "mode" }
lvim.builtin.lualine.sections.lualine_c = { { "filename", path = 1, file_status = true } }
lvim.builtin.terminal.active = true

-- Nvim-tree
lvim.builtin.nvimtree.setup.view.side = "right"
lvim.builtin.nvimtree.setup.filters.custom = { ".git" }
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.nvimtree.setup.diagnostics.enable = true

-- Telescope
lvim.builtin.telescope.defaults.layout_strategy = "horizontal"
lvim.builtin.telescope.defaults.sorting_strategy = "ascending"
lvim.builtin.telescope.defaults.layout_config.width = 0.87
lvim.builtin.telescope.defaults.layout_config.height = 0.80
lvim.builtin.telescope.defaults.layout_config.preview_cutoff = 120
lvim.builtin.telescope.defaults.layout_config.prompt_position = "top"
lvim.builtin.telescope.defaults.borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }
lvim.builtin.telescope.defaults.path_display = { "truncate" }

-- Setup vim-matchup
lvim.builtin.treesitter.matchup.enable = true

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true

-- (TreeSitter) Automatically install syntax highlighting for these languages
lvim.builtin.treesitter.ensure_installed = {
  "html",
  "scss",
  "javascript",
  "ruby",
  "rust",
  "go",
  "c",
  "yaml",
  "embedded_template",
  "json",
  "markdown",
  "markdown_inline",
  "python",
  "regex",
  "scss",
  "typescript",
  "toml",
  "yaml",
  "lua",
}
lvim.builtin.mason.ensure_installed = {
  "ruby_ls",
  "emmet_ls",
  "eslint_d",
  "bashls",
  "clangd",
  "cmake-language-server",
  "cssls",
  "html",
  "jsonls",
  "prettierd",
  "shellcheck",
  "stylua",
  "lua_ls",
  "tailwindcss",
  "sumneko_lua",
  "tsserver",
  "yamlfmt",
  "yamllint",
  "yamlls",
  "actionlint",
  -- "haml_lint",
  "stimulus_ls"
}

-- Telescope key mappings(check this to refactor this: https://github.com/rochacbruno/dotfiles)
local get_telescope_mappings = function()
  local actions = require("telescope.actions")
  -- If multiple file selections are detected, open each file. If hitting
  -- <CR> on a single selection fall back to the default behaviour.
  -- https://github.com/nvim-telescope/telescope.nvim/issues/1048#issuecomment-1679797700
  local select_one_or_multi = function(prompt_bufnr)
    local picker = require('telescope.actions.state').get_current_picker(prompt_bufnr)
    local multi = picker:get_multi_selection()
    if not vim.tbl_isempty(multi) then
      require('telescope.actions').close(prompt_bufnr)
      for _, j in pairs(multi) do
        if j.path ~= nil then
          vim.cmd(string.format("%s %s", "edit", j.path))
        end
      end
    else
      require('telescope.actions').select_default(prompt_bufnr)
    end
  end

  return {
    i = {
      ["<CR>"] = select_one_or_multi,
    },
    n = {
      ["<CR>"] = select_one_or_multi,
      ['K'] = actions.preview_scrolling_up,
      ['J'] = actions.preview_scrolling_down,
    },
  }
end
lvim.builtin.telescope.defaults.mappings = get_telescope_mappings()
-- Show previewer when searching git files with default <leader>f
-- lvim.builtin.which_key.mappings["f"] = {
--   require("lvim.core.telescope.custom-finders").find_project_files,
--   "Find File"
-- }
-- Show previewer when searching buffers with <leader>bf
lvim.builtin.which_key.mappings.b.f = {
  "<cmd>Telescope buffers<cr>",
  "Find",
}
lvim.builtin.which_key.mappings["f"] = {
  name = "Find",
  b = { "<cmd>Telescope buffers<cr>", "Find buffers" },
  c = { "<cmd>Telescope grep_string<cr>", "Find for word under cursor" },
  C = { "<cmd>Telescope commands<cr>", "Find commands" },
  f = { "<cmd>Telescope find_files ignore=false, hidden=false<cr>", "Find files" },
  F = { "<cmd>Telescope find_files<cr>", "Find all files" },
  h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
  i = { "<cmd>lua require('telescope').extensions.media_files.media_files()<cr>", "Media" },
  k = { "<cmd>Telescope keymaps<cr>", "Find keymaps" },
  l = { "<cmd>Telescope resume<cr>", "Last Search" },
  m = { "<cmd>Telescope man_pages<cr>", "Find man pages" },
  o = { "<cmd>Telescope oldfiles<cr>", "Find history" },
  r = { "<cmd>Telescope registers<cr>", "Find registers" },
  s = {
    "<cmd>:lua require('telescope.builtin').find_files({ search_dirs = {vim.fn.expand('%:p:h')} })<cr>",
    "Find file in this buffer's working directory",
  },
  t = { "<cmd>Telescope themes<cr>", "Find themes" },
  u = { "<cmd>lua require('telescope').extensions.undo.undo()<cr>", "Telescope undo" },
  w = { "<cmd>Telescope live_grep<cr>", "Find words" },
  W = {
    function()
      require("lvim.core.telescope.builtin").live_grep({
        additional_args = function(args)
          return vim.list_extend(args, { "--hidden", "--no-ignore" })
        end,
      })
    end,
    "Find words in all files",
  },
}


local nvim_lsp = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Setup ruby-lsp
local enabled_features =
    nvim_lsp.ruby_ls.setup({
      cmd = { "ruby-lsp" },
      filetypes = { "ruby", "rakefile" },
      root_dir = nvim_lsp.util.root_pattern("Gemfile", ".git"),
      init_options = {
        enabledFeatures = {
          "documentHighlights",
          "documentSymbols",
          "foldingRanges",
          "selectionRanges",
          "semanticHighlighting",
          "codeActions",
          "formatting",
        }
      },
      settings = {},
    })

nvim_lsp.solargraph.setup({
  filetypes = { "ruby", "rakefile" },
  root_dir = nvim_lsp.util.root_pattern("Gemfile", ".git", "."),
  settings = {
    solargraph = {
      autoformat = true,
      completion = true,
      diagnostic = true,
      folding = true,
      references = true,
      rename = true,
      symbols = true,
    },
  },
})

-- nvim_lsp.stimulus_ls.setup {}
nvim_lsp.tailwindcss.setup({})
-- nvim_lsp.emmet_ls.setup({
--   capabilities = capabilities,
--   cmd = { "ls_emmet", "--stdio" },
--   filetypes = {
--     "html",
--     "css",
--     "scss",
--     "javascriptreact",
--     "haml",
--     "sass",
--     "sss",
--   },
-- })

-- Formatting
-- local formatters = require("lvim.lsp.null-ls.formatters")
-- formatters.setup({
--   { exe = "rubocop" },
-- })

-- Dap
-- local dap = require("dap")

-- Diagnostics
local null_ls = require("null-ls")

local sources = {
  null_ls.builtins.diagnostics.rubocop,
  null_ls.builtins.diagnostics.erb_lint.with({}),
  null_ls.builtins.diagnostics.haml_lint.with({
    -- extra_args = { "--dialect", "sqlite" },
    env = {
      RUBYOPT = "-W0",
    },
  }),
  null_ls.builtins.formatting.erb_lint,
  null_ls.builtins.formatting.erb_format,
}
null_ls.register({ sources = sources })

-- -- Additional Plugins <https://www.lunarvim.org/docs/plugins#user-plugins>
lvim.plugins = {
  -- General
  {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "ellisonleao/glow.nvim",
    cmd = "Glow",
    opts = {
      width = 200,
      height = 150,
      width_ratio = 0.9, -- maximum width of the Glow window compared to the nvim window size (overrides `width`)
      height_ratio = 0.8,
    }
  },
  {
    "kylechui/nvim-surround",
    event = "BufEnter",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
  },

  -- Linting
  -- {
  --   "mfussenegger/nvim-lint",
  --   enabled = false,
  --   config = function()
  --     require("lint").linters_by_ft = {
  --       gitcommit = { 'gitlint' },
  --       markdown = { "markdownlint" },
  --       javascript = { 'eslint_d' },
  --       typescript = { 'eslint_d' },
  --       eruby = { 'erb_lint' },
  --       json = { 'jsonlint' },
  --       scss = { 'stylelint' }
  --     }

  --     vim.api.nvim_create_autocmd({
  --       "BufReadPost",
  --       "BufWritePost",
  --       "InsertLeave",
  --     }, {
  --       desc = "Lint",
  --       callback = function()
  --         require("lint").try_lint()
  --       end,
  --     })
  --   end,
  -- },
  -- TreeSitter extensions
  {
    "andymass/vim-matchup", -- {{{
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup", fullwidth = 1, highlight = "Normal", syntax_hl = 1 }
    end,
  },
  -- {
  --   "romgrk/nvim-treesitter-context",
  --   config = function()
  --     require("treesitter-context").setup {
  --       enable = true,
  --       throttle = true,
  --       max_lines = 0,
  --       patterns = {
  --         default = {
  --           'class',
  --           'function',
  --           'method',
  --         },
  --       },
  --     }
  --   end
  -- },
  -- UI(Breadcrumbs etc)
  { "Bekaboo/dropbar.nvim", event = "UIEnter", opts = {} },
  {
    "nvimdev/lspsaga.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      { "nvim-tree/nvim-web-devicons", lazy = true },
    },
    -- after = { "nvim-lspconfig" },
    opts = {
      ui = {
        border = "rounded",
      },
      lightbulb = {
        enable = false,
      },
      symbol_in_winbar = {
        enable = true,
        hide_keyword = true,
        show_file = true,
        folder_level = 2,
      },
      outline = {
        max_height = 0.8,
        left_width = 0.4,
      },
      definition = {
        -- width = 0.8,
        height = 0.8,
      }
    }
  },
  -- Performance
  {
    'zeioth/garbage-day.nvim', -- Stops inactive LSP clients to free RAM
    event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
    dependencies = 'neovim/nvim-lspconfig',
    opts = { notifications = true },
  },
  -- Git and friends
  {
    "folke/neodev.nvim",
    opts = {
      inlay_hints = {
        enabled = true,
      },
    }
  },
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
  },
  {
    "f-person/git-blame.nvim",
    event = "BufRead",
    config = function()
      vim.cmd "highlight default link gitblame SpecialComment"
      vim.g.gitblame_enabled = 1
    end,
  },
  -- Testing and Dap
  {
    "theHamsta/nvim-dap-virtual-text",
  },
  {
    "suketa/nvim-dap-ruby", -- An extension for nvim-dap providing configurations for launching debug.rb
    event = "BufRead",
    config = function()
      require("dap-ruby").setup()
    end,
  },
  {
    "nvim-neotest/neotest",
    event = "BufRead",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "olimorris/neotest-rspec",
      -- "zidhuss/neotest-minitest"
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-rspec"),
          -- require('neotest-minitest'),
        },
      })
    end,
  },
  -- Go language
  "olexsmir/gopher.nvim",
  "leoluz/nvim-dap-go",
  -- Rust language
  {
    "saecki/crates.nvim",
    version = "v0.3.0",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "BufRead",
    config = function()
      require("crates").setup({
        null_ls = {
          enabled = true,
          name = "crates.nvim",
        },
        popup = {
          border = "rounded",
        },
      })
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    event = "BufRead",
    config = function()
      require("rust-tools").setup({
        tools = {
          executor = require("rust-tools/executors").termopen, -- can be quickfix or termopen
          reload_workspace_from_cargo_toml = true,
          inlay_hints = {
            auto = true,
            only_current_line = false,
            show_parameter_hints = true,
            parameter_hints_prefix = "<-",
            other_hints_prefix = "=>",
            max_len_align = false,
            max_len_align_padding = 1,
            right_align = false,
            right_align_padding = 7,
            highlight = "Comment",
          },
          hover_actions = {
            border = {
              { "╭", "FloatBorder" },
              { "─", "FloatBorder" },
              { "╮", "FloatBorder" },
              { "│", "FloatBorder" },
              { "╯", "FloatBorder" },
              { "─", "FloatBorder" },
              { "╰", "FloatBorder" },
              { "│", "FloatBorder" },
            },
            auto_focus = true,
          },
        },
        server = {
          on_init = require("lvim.lsp").common_on_init,
          on_attach = function(client, bufnr)
            require("lvim.lsp").common_on_attach(client, bufnr)
            local rt = require("rust-tools")
            -- Hover actions
            vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<leader>lA", rt.code_action_group.code_action_group, { buffer = bufnr })
          end,
        },
      })
    end,
  },
  -- Other plugins
  {
    'stevearc/conform.nvim',
    event = "BufRead",
    config = function()
      require("conform").setup({
      })
    end
  },
  {
    "L3MON4D3/LuaSnip",
    event = "BufRead",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      require("luasnip.loaders.from_vscode").load()
      require("luasnip").filetype_extend("ruby", { "rails" })
      require("luasnip").filetype_extend("haml", { "ruby" })
    end,
  },
  {
    "lewis6991/hover.nvim",
    event = "BufRead",
    config = function()
      require("hover").setup({
        init = function()
          -- Require providers
          require("hover.providers.lsp")
          require("hover.providers.gh")
          require("hover.providers.man")
          require("hover.providers.dictionary")
        end,
        preview_opts = {
          border = "single",
        },
        -- Whether the contents of a currently open hover window should be moved
        -- to a :h preview-window when pressing the hover keymap.
        preview_window = false,
        title = true,
      })
      -- Setup keymaps
      -- vim.keymap.set("n", "K", require("hover").hover, { desc = "hover.nvim" })
      vim.keymap.set("n", "gK", require("hover").hover_select, { desc = "hover.nvim (select)" })
    end,
  },
  -- Aesthetics
  {
    "echasnovski/mini.indentscope",
    config = function()
      require("mini.indentscope").setup({})
    end,
  },
  {
    "echasnovski/mini.files",
    config = function()
      require("mini.files").setup({
        windows = {
          preview = true,
          width_focus = 30,
          width_preview = 30,
        },
        options = {
          -- Whether to use for editing directories
          -- Disabled by default in LazyVim because neo-tree is used for that
          use_as_default_explorer = false,
        },
      })
    end,
  },
  {
    "folke/noice.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
    config = function()
      require("noice").setup({
        routes = {
          {
            view = "notify",
            filter = { event = "msg_showmode" },
          },
        },
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
          hover = {
            enabled = false,
          },
          signature = {
            enabled = false,
          },
        },
      })
    end,
  },
  {
    "kevinhwang91/nvim-ufo", --code folding
    dependencies = { "kevinhwang91/promise-async" },
    config = function()
      local handler = function(virtText, lnum, endLnum, width, truncate)
        local newVirtText = {}
        local suffix = ("  %d "):format(endLnum - lnum)
        local sufWidth = vim.fn.strdisplaywidth(suffix)
        local targetWidth = width - sufWidth
        local curWidth = 0
        for _, chunk in ipairs(virtText) do
          local chunkText = chunk[1]
          local chunkWidth = vim.fn.strdisplaywidth(chunkText)
          if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
          else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, { chunkText, hlGroup })
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            -- str width returned from truncate() may less than 2nd argument, need padding
            if curWidth + chunkWidth < targetWidth then
              suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
            end
            break
          end
          curWidth = curWidth + chunkWidth
        end
        table.insert(newVirtText, { suffix, "MoreMsg" })
        return newVirtText
      end
      require("ufo").setup({
        fold_virt_text_handler = handler,
        provider_selector = function(bufnr, filetype, buftype)
          return { "treesitter", "indent" }
        end,
      })
    end,
  },
  -- {
  --   "simrat39/symbols-outline.nvim",
  --   config = function()
  --     require("symbols-outline").setup({
  --       position = 'left',
  --       auto_preview = true,
  --     })
  --   end
  -- },
  {
    "stevearc/aerial.nvim", -- code outline
    event = "BufRead",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("aerial").setup({
        layout = {
          default_direction = "prefer_left",
        },
        on_attach = function(bufnr)
          vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
          vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
        end,
      })
    end,
  },
  {
    "debugloop/telescope-undo.nvim",
  },
  {
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup()
    end,
  },
  -- TreeSitter plugins
  {
    "windwp/nvim-ts-autotag", -- autoclose and autorename html tag
    event = "BufRead",
    config = function()
      require("nvim-ts-autotag").setup({
        filetypes = { "html", "xml", "eruby", "embedded_template" }
      })
    end,
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require("lsp_signature").on_attach()
    end,
  },
  {
    "felipec/vim-sanegx",
    event = "BufRead",
  },
  { "ray-x/web-tools.nvim" },
  {
    "ThePrimeagen/refactoring.nvim",
    event = "BufRead",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("refactoring").setup({})
    end,
  },
  -- Rails
  {
    "mihyaeru21/nvim-ruby-lsp",
    event = "BufRead",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      require("ruby-lsp").setup({
        -- vscode = true,
      })

      local lspconfig = require("lspconfig")
      lspconfig.ruby_ls.setup({})
    end,
  },
  {
    "RRethy/nvim-treesitter-endwise",
    event = "BufRead",
    config = function()
      require("nvim-treesitter.configs").setup({
        endwise = {
          enable = true,
        },
      })
    end,
  },
  {
    "stevearc/dressing.nvim", -- for ror.nvim plugin
    config = function()
      require("dressing").setup({
        input = {
          get_config = function()
            -- disable for NvimTree
            if vim.api.nvim_buf_get_option(0, "filetype") == "NvimTree" then
              return { enabled = false }
            end
          end,
          min_width = { 60, 0.9 },
        },
        select = {
          -- telescope = require('telescope.themes').get_ivy({...})
          telescope = require("telescope.themes").get_dropdown({
            layout_config = { height = 15, width = 90 },
          }),
        },
      })
    end,
  },
  {
    "weizheheng/ror.nvim",
    dependencies = { "rcarriga/nvim-notify" },
    config = function()
      require("ror").setup({})
    end,
  },
  {
    "tpope/vim-rails",
    ft = { "ruby", "eruby", "haml", "slim" },
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
    "tpope/vim-haml",
    ft = "haml",
    config = function()
      vim.cmd("autocmd BufRead,BufNewFile *.hamlc set ft=haml")
    end,
  },
  "tpope/vim-repeat",
  "tpope/vim-rake",
  "sunaku/vim-ruby-minitest",
  {
    "tpope/vim-bundler",
    cmd = { "Bundler", "Bopen", "Bsplit", "Btabedit" },
  },
  {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
      require("neoscroll").setup({
        -- All these keys will be mapped to their corresponding default scrolling animation
        mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
        hide_cursor = true,          -- Hide cursor while scrolling
        stop_eof = true,             -- Stop at <EOF> when scrolling downwards
        use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
        respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        easing_function = nil,       -- Default easing function
        pre_hook = nil,              -- Function to run before the scrolling animation starts
        post_hook = nil,             -- Function to run after the scrolling animation ends
      })
    end,
  },
  {
    "itchyny/vim-cursorword",
    event = { "BufEnter", "BufNewFile" },
    config = function()
      vim.api.nvim_command("augroup user_plugin_cursorword")
      vim.api.nvim_command("autocmd!")
      vim.api.nvim_command("autocmd FileType NvimTree,lspsagafinder,dashboard,vista let b:cursorword = 0")
      vim.api.nvim_command("autocmd WinEnter * if &diff || &pvw | let b:cursorword = 0 | endif")
      vim.api.nvim_command("autocmd InsertEnter * let b:cursorword = 0")
      vim.api.nvim_command("autocmd InsertLeave * let b:cursorword = 1")
      vim.api.nvim_command("augroup END")
    end,
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    lazy = true,
    config = function()
      require("persistence").setup({
        dir = vim.fn.expand(vim.fn.stdpath("config") .. "/session/"),
        options = { "buffers", "curdir", "tabpages", "winsize" },
      })
    end,
  },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require("lsp_signature").on_attach()
    end,
  },
  {
    "ggandor/leap.nvim", --
    name = "leap",
    config = function()
      require("leap").add_default_mappings()
    end,
  },
  {
    "windwp/nvim-spectre", -- search and replace
    event = "BufRead",
    config = function()
      require("spectre").setup()
    end,
  },
  {
    "peterhoeg/vim-qml",
    event = "BufRead",
    ft = { "qml" },
  },
  {
    "turbio/bracey.vim",
    cmd = { "Bracey", "BracyStop", "BraceyReload", "BraceyEval" },
    build = "npm install --prefix server",
  },
  -- HTML, CSS, JavaScript, JSON, Yaml etc
  {
    "b0o/SchemaStore.nvim",
    config = function()
      require("lspconfig").jsonls.setup({
        settings = {
          json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
          },
          yaml = {
            schemaStore = {
              enable = true,
              url = "",
            },
            schemas = require("schemastore").yaml.schemas(),
          },
        },
      })
    end,
  },
  {
    "aca/emmet-ls",
    config = function()
      local lspconfig = require("lspconfig")
      local configs = require("lspconfig/configs")

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      capabilities.textDocument.completion.completionItem.resolveSupport = {
        properties = {
          "documentation",
          "detail",
          "additionalTextEdits",
        },
      }

      if not lspconfig.emmet_ls then
        configs.emmet_ls = {
          default_config = {
            cmd = { "emmet-ls", "--stdio" },
            filetypes = {
              "html",
              "css",
              "javascript",
              "typescript",
              "eruby",
              "typescriptreact",
              "javascriptreact",
              "svelte",
              "vue",
            },
            root_dir = function(fname)
              return vim.loop.cwd()
            end,
            settings = {},
          },
        }
      end
      lspconfig.emmet_ls.setup({ capabilities = capabilities })
    end,
  },
  -- Themes
  {
    -- "navarasu/onedark.nvim",
    -- config = function()
    --   require('onedark').setup({
    --     style = 'deep', -- warm, warmer, cool, deep, dark, darker
    --     term_colors = true,
    --     ending_tildes = true,
    --     code_style = {
    --       comments = 'italic',
    --       -- keywords = 'italic,bold',
    --       functions = 'bold',
    --       -- strings = 'italic',
    --     },
    --   })
    -- end
  },
  {
    "neanias/everforest-nvim",
    config = function()
      require("everforest").setup({
        background = "medium", -- soft, medium, hard
        -- italics = true,
      })
    end,
  },
  {
    "catppuccin/nvim",
    config = function()
      require("catppuccin").setup({
        flavour = "macchiato",     -- latte, frappe, macchiato, mocha
        term_colors = false,
        show_end_of_buffer = true, -- shows the '~' characters after the end of buffers
        styles = {                 -- Handles the styles of general hi groups (see `:h highlight-args`):
          comments = { "italic" }, -- Change the style of comments
          -- conditionals = { "italic" },
          functions = { "bold" },
          keywords = { "bold" },
          variables = { "italic" },
          -- strings = { 'italic' },
        },
      })
    end,
  },
  {
    "AlexvZyl/nordic.nvim",
    config = function()
      require("nordic").setup({
        bold_keywords = true,
        -- bright_border = true,
        -- swap_backgrounds = true,
        ts_context = {
          -- Enables dark background for treesitter-context window
          -- dark_background = false,
        },
      })
    end,
  },
  {
    "Tsuzat/NeoSolarized.nvim",
    config = function()
      require("NeoSolarized").setup({
        styles = {                      -- Handles the styles of general hi groups (see `:h highlight-args`):
          comments = { italic = true }, -- Change the style of comments
          functions = { bold = true },
          class = { bold = true, italic = true },
          string = { italic = false },
          keywords = { italic = false, bold = true },
        },
      })
    end,
  },
  {
    "olimorris/onedarkpro.nvim",
    config = function()
      require("onedarkpro").setup({
        styles = {
          methods = "bold,italic",
          comments = "italic",
          keywords = "NONE",
          constants = "bold",
          functions = "bold",
          parameters = "italic",
        },
      })
    end,
  },
  {
    "projekt0n/github-nvim-theme",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("github-theme").setup({
        options = {
          terminal_colors = true,
          hide_end_of_buffer = false,
          styles = {
            comments = "italic",
            functions = "NONE",
            keywords = "italic",
            constants = "bold",
            operators = "bold",
            types = "italic,bold",
          },
        },
      })
    end,
  },
  "oxfist/night-owl.nvim",
  {
    "marko-cerovac/material.nvim",
    config = function()
      require('material').setup({
        disable = {
          colored_cursor = true
        }
      })
    end
  },
}

-- -- Autocommands (`:help autocmd`) <https://neovim.io/doc/user/autocmd.html>
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- }
--
lvim.autocommands = {
  {
    "BufReadPost",
    {
      pattern = { "*.erb", "*.eruby" },
      command = "set syntax=html",
    },
  },
  {
    "BufRead",
    {
      pattern = { "*.erb", "*.eruby" },
      command = "set syntax=html",
    },
  },
  {
    "BufWinEnter", -- this works!
    {
      pattern = { "*.erb", "*.eruby" },
      command = "set syntax=html",
    },
  },
}
