vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.relativenumber = true
vim.opt.guicursor = "i:block" --  set cursor of insert mode as block.
vim.opt.list = true
vim.opt.listchars = {
  eol = '⤶',
  space = '⋅',
}

-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- vim.opt.foldlevel = 99

vim.o.foldcolumn = '1' -- '0' is not bad
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

vim.api.nvim_set_keymap("n", "<leader>ll", "<cmd>Other<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>lp", "<cmd>OtherSplit<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>lv", "<cmd>OtherVSplit<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>lc", "<cmd>OtherClear<CR>", { noremap = true, silent = true })

-- toggleterm
-- vim.api.nvim_set_keymap("t", "<Esc><Esc>", "<C-\\><C-n>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<C-v>", "<C-\\><C-n>", { noremap = true, silent = true })

-- Neotest
lvim.builtin.which_key.mappings["dm"] = { "<cmd>lua require('neotest').run.run()<cr>",
  "Test Method" }
lvim.builtin.which_key.mappings["dM"] = { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>",
  "Test Method DAP" }
lvim.builtin.which_key.mappings["df"] = {
  "<cmd>lua require('neotest').run.run({vim.fn.expand('%')})<cr>", "Test Class" }
lvim.builtin.which_key.mappings["dF"] = {
  "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>", "Test Class DAP" }
lvim.builtin.which_key.mappings["dS"] = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Test Summary" }

-- Noice
lvim.builtin.which_key.mappings["nl"] = { ":lua require('noice').cmd('last')<CR>", "show last notification" }
lvim.builtin.which_key.mappings["nh"] = { ":lua require('noice').cmd('history')<CR>", "show notification history" }
lvim.builtin.which_key.mappings["nd"] = {
  ":lua require('noice').cmd('dismiss')<CR>", "Dismis all visible notification"
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
  d = { "<cmd>TroubleToggle lsp_definitions<cr>", "definitions" },
  T = { "<cmd>TroubleToggle lsp_type_definitions<cr>", "type definitions" },
}

-- Spectre
lvim.builtin.which_key.mappings["s"] = {
  s = { ":lua require('spectre').toggle()<cr>", "Toggle spectre" },
}

-- Noice
lvim.builtin.which_key.mappings["nl"] = { ":lua require('noice').cmd('last')<CR>", "show last notification" }
lvim.builtin.which_key.mappings["nh"] = { ":lua require('noice').cmd('history')<CR>", "show notification history" }
lvim.builtin.which_key.mappings["nd"] = {
  ":lua require('noice').cmd('dismiss')<CR>", "Dismis all visible notification"
}

-- -- Change theme settings
-- lvim.colorscheme = "onedark"
-- lvim.colorscheme = "everforest"
-- lvim.colorscheme = "nordic"
-- lvim.colorscheme = "material-palenight"
lvim.colorscheme = "catppuccin"
-- lvim.colorscheme = "NeoSolarized"
-- lvim.colorscheme = "onedark_vivid" -- onedark, onelight, onedark_vivid, onedark_dark

-- After changing plugin config exit and reopen LunarVim, Run :PackerSync
lvim.builtin.alpha.active = true
lvim.builtin.dap.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.breadcrumbs.active = true

lvim.builtin.lualine.icons_enabled = true
-- lvim.builtin.lualine.sections.lualine_a = { "mode" }
lvim.builtin.lualine.sections.lualine_c = { { "filename", path = 1, file_status = true } }

lvim.builtin.terminal.active = true

-- Nvim-tree
lvim.builtin.nvimtree.setup.view.side = "right"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.nvimtree.setup.diagnostics.enable = true

-- Telescope
lvim.builtin.telescope.defaults.layout_strategy = 'horizontal'
lvim.builtin.telescope.defaults.sorting_strategy = "ascending"
lvim.builtin.telescope.defaults.layout_config.width = 0.87
lvim.builtin.telescope.defaults.layout_config.height = 0.80
lvim.builtin.telescope.defaults.layout_config.preview_cutoff = 120
lvim.builtin.telescope.defaults.layout_config.prompt_position = "top"
lvim.builtin.telescope.defaults.borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }
lvim.builtin.telescope.defaults.path_display = { "truncate" }

-- Telescope key mappings(check this to refactor this: https://github.com/rochacbruno/dotfiles)
local get_telescope_mappings = function()
  local actions = require("telescope.actions")
  return {
    i = {
      ["<C-j>"] = actions.move_selection_next,
      ["<C-k>"] = actions.move_selection_previous,
    },
    n = {
      ["<C-j>"] = actions.move_selection_next,
      ["<C-k>"] = actions.move_selection_previous,
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
  "Find"
}
lvim.builtin.which_key.mappings["f"] = {
  name = "Find",
  b = { "<cmd>Telescope buffers<cr>", "Find buffers" },
  c = { "<cmd>Telescope grep_string<cr>", "Find for word under cursor" },
  C = { "<cmd>Telescope commands<cr>", "Find commands" },
  f = { "<cmd>Telescope find_files<cr>", "Find files" },
  F = { "<cmd>Telescope find_files hidden=true, no_ignore=true<cr>", "Find all files" },
  h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
  i = { "<cmd>lua require('telescope').extensions.media_files.media_files()<cr>", "Media" },
  k = { "<cmd>Telescope keymaps<cr>", "Find keymaps" },
  l = { "<cmd>Telescope resume<cr>", "Last Search" },
  m = { "<cmd>Telescope man_pages<cr>", "Find man pages" },
  o = { "<cmd>Telescope oldfiles<cr>", "Find history" },
  r = { "<cmd>Telescope registers<cr>", "Find registers" },
  s = { "<cmd>:lua require('telescope.builtin').find_files({ search_dirs = {vim.fn.expand('%:p:h')} })<cr>",
    "Find file in this buffer's working directory" },
  t = { "<cmd>Telescope themes<cr>", "Find themes" },
  u = { "<cmd>lua require('telescope').extensions.undo.undo()<cr>", "Telescope undo" },
  w = { "<cmd>Telescope live_grep<cr>", "Find words" },
  W = { function()
    require("lvim.core.telescope.builtin").live_grep {
      additional_args = function(args) return vim.list_extend(args, { "--hidden", "--no-ignore" }) end,
    }
  end, "Find words in all files" },
}

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true

-- (TreeSitter) Automatically install syntax highlighting for these languages
lvim.builtin.treesitter.ensure_installed = {
  "html", "scss", "javascript", "ruby", "rust", "go", "c", "yaml",
  "embedded_template", "json", "markdown", "markdown_inline", "python", "regex", "scss", "typescript", "toml", "lua"
}

local nvim_lsp = require("lspconfig")

nvim_lsp.ruby_ls.setup({
  cmd = { "ruby-lsp" }
})

nvim_lsp.solargraph.setup {
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
      symbols = true
    }
  }
}


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
  null_ls.builtins.diagnostics.haml_lint.with({}),
  null_ls.builtins.formatting.erb_lint,
  null_ls.builtins.formatting.erb_format,
}
null_ls.register({ sources = sources })

-- -- Additional Plugins <https://www.lunarvim.org/docs/plugins#user-plugins>
lvim.plugins = {
  -- Git and friends
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
  },
  {
    "f-person/git-blame.nvim",
    event = "BufRead",
    config = function()
      -- vim.cmd "highlight default link gitblame SpecialComment"
      -- vim.g.gitblame_enabled = 0
    end,
  },
  -- Testing and Dap
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "olimorris/neotest-rspec",
      -- "zidhuss/neotest-minitest"
    },
    config = function()
      require('neotest').setup({
        adapters = {
          require("neotest-rspec"),
          -- require('neotest-minitest'),
        },
      })
    end
  },
  -- Go language
  "olexsmir/gopher.nvim",
  "leoluz/nvim-dap-go",
  -- Rust language
  {
    "saecki/crates.nvim",
    version = "v0.3.0",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("crates").setup {
        null_ls = {
          enabled = true,
          name = "crates.nvim",
        },
        popup = {
          border = "rounded",
        },
      }
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    config = function()
      require("rust-tools").setup {
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
            local rt = require "rust-tools"
            -- Hover actions
            vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<leader>lA", rt.code_action_group.code_action_group, { buffer = bufnr })
          end,
        },
      }
    end,
  },
  -- Other plugins
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
    config = function()
      require("noice").setup({
        lsp = {
          hover = {
            enabled = false
          },
          signature = {
            enabled = false
          }
        }
      })
    end
  },
  {
    "kevinhwang91/nvim-ufo", --code folding
    dependencies = { "kevinhwang91/promise-async" },
    config = function()
      local handler = function(virtText, lnum, endLnum, width, truncate)
        local newVirtText = {}
        local suffix = ('  %d '):format(endLnum - lnum)
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
              suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
            end
            break
          end
          curWidth = curWidth + chunkWidth
        end
        table.insert(newVirtText, { suffix, 'MoreMsg' })
        return newVirtText
      end
      require('ufo').setup({
        fold_virt_text_handler = handler,
        provider_selector = function(bufnr, filetype, buftype)
          return { 'treesitter', 'indent' }
        end
      })
    end
  },
  {
    "stevearc/aerial.nvim", -- code outline
    config = function()
      require('aerial').setup({
        layout = {
          default_direction = "prefer_left",
        },
        on_attach = function(bufnr)
          vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', { buffer = bufnr })
          vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', { buffer = bufnr })
        end
      })
    end
  },
  {
    "debugloop/telescope-undo.nvim"
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
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({ "css", "scss", "html", "javascript" }, {
        RGB = true,      -- #RGB hex codes
        RRGGBB = true,   -- #RRGGBB hex codes
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        rgb_fn = true,   -- CSS rgb() and rgba() functions
        hsl_fn = true,   -- CSS hsl() and hsla() functions
        css = true,      -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true,   -- Enable all CSS *functions*: rgb_fn, hsl_fn
      })
    end,
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require "lsp_signature".on_attach() end,
  },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
  },
  {
    "felipec/vim-sanegx",
    event = "BufRead",
  },
  { "ray-x/web-tools.nvim" },
  -- Rails
  {
    "RRethy/nvim-treesitter-endwise",
    config = function()
      require('nvim-treesitter.configs').setup {
        endwise = {
          enable = true,
        },
      }
    end
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
        },
      })
    end
  },
  {
    "weizheheng/ror.nvim",
    dependencies = { "rcarriga/nvim-notify" },
    config = function()
      require("ror").setup({
      })
    end
  },
  {
    "tpope/vim-rails",
    config = function()
      -- disable autocmd set filetype=eruby.yaml
      vim.api.nvim_create_autocmd(
        { 'BufNewFile', 'BufReadPost' },
        {
          pattern = { '*.yml' },
          callback = function()
            vim.bo.filetype = 'yaml'
          end

        }
      )
    end
  },
  "tpope/vim-repeat",
  "tpope/vim-rake",
  "tpope/vim-haml",
  "sunaku/vim-ruby-minitest",
  {
    "tpope/vim-bundler",
    cmd = { "Bundler", "Bopen", "Bsplit", "Btabedit" }
  },
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },
  {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
      require('neoscroll').setup({
        -- All these keys will be mapped to their corresponding default scrolling animation
        mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>',
          '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
        hide_cursor = true,          -- Hide cursor while scrolling
        stop_eof = true,             -- Stop at <EOF> when scrolling downwards
        use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
        respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        easing_function = nil,       -- Default easing function
        pre_hook = nil,              -- Function to run before the scrolling animation starts
        post_hook = nil,             -- Function to run after the scrolling animation ends
      })
    end
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
    end
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    lazy = true,
    config = function()
      require("persistence").setup {
        dir = vim.fn.expand(vim.fn.stdpath "config" .. "/session/"),
        options = { "buffers", "curdir", "tabpages", "winsize" },
      }
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
    config = function() require "lsp_signature".on_attach() end,
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
  {
    "navarasu/onedark.nvim",
    config = function()
      require('onedark').setup({
        style = 'deep', -- warm, warmer, cool, deep, dark, darker
        term_colors = true,
        ending_tildes = true,
        code_style = {
          comments = 'italic',
          -- keywords = 'italic,bold',
          functions = 'bold',
          -- strings = 'italic',
        },
      })
    end
  },
  {
    "neanias/everforest-nvim",
    config = function()
      require("everforest").setup({
        background = "medium", -- soft, medium, hard
        -- italics = true,
      })
    end
  },
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
          functions = { 'bold' },
          keywords = { 'bold' },
          -- strings = { 'italic' },
        },
      })
    end
  },
  {
    "AlexvZyl/nordic.nvim",
    config = function()
      require 'nordic'.setup({
        bold_keywords = true,
        -- bright_border = true,
        -- swap_backgrounds = true,
        ts_context = {
          -- Enables dark background for treesitter-context window
          -- dark_background = false,
        }
      })
    end
  },
  {
    "Tsuzat/NeoSolarized.nvim",
    config = function()
      require 'NeoSolarized'.setup({
        styles = {                      -- Handles the styles of general hi groups (see `:h highlight-args`):
          comments = { italic = true }, -- Change the style of comments
          functions = { bold = true },
          class = { bold = true, italic = true },
          string = { italic = false },
          keywords = { italic = false, bold = true },
        },
      })
    end
  },
  {
    -- "olimorris/onedarkpro.nvim",
    -- config = function()
    --   require('onedarkpro').setup({
    --     styles = {
    --       methods = "bold,italic",
    --       comments = "italic",
    --       keywords = "NONE",
    --       constants = "bold",
    --       functions = "bold",
    --       parameters = "italic",
    --     }
    --   })
    -- end
  },
  "rebelot/kanagawa.nvim",
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
    }
  },
  {
    "BufRead",
    {
      pattern = { "*.erb", "*.eruby" },
      command = "set syntax=html",
    }
  },
  {
    "BufWinEnter", -- this works!
    {
      pattern = { "*.erb", "*.eruby" },
      command = "set syntax=html",
    }
  },
}
