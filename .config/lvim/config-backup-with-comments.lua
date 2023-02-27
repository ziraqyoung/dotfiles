--[[
 THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
 `lvim` is the global options object
]]
-- vim options
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.relativenumber = true

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99

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

local options = { noremap = true }
vim.keymap.set("i", "jj", "<Esc>", options)

-- lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
-- lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

-- -- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["W"] = { "<cmd>noautocmd w<cr>", "Save without formatting" }
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["e"] = { "<cmd>NvimTreeFocus<CR>", "Explorer" }

-- -- Change theme settings
-- lvim.colorscheme = "onedark"
lvim.colorscheme = "terafox"

-- After changing plugin config exit and reopen LunarVim, Run :PackerSync
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "right"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true

-- lvim.builtin.treesitter.ignore_install = { "haskell" }

-- -- generic LSP settings <https://www.lunarvim.org/docs/languages#lsp-support>

-- --- disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---see the full default list `:lua =lvim.lsp.automatic_configuration.skipped_servers`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- linters and formatters <https://www.lunarvim.org/docs/languages#lintingformatting>
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "stylua" },
--   {
--     command = "prettier",
--     extra_args = { "--print-width", "100" },
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     command = "shellcheck",
--     args = { "--severity", "warning" },
--   },
-- }

-- -- Additional Plugins <https://www.lunarvim.org/docs/plugins#user-plugins>
lvim.plugins = {
    {
        "windwp/nvim-ts-autotag",
        config = function()
          require("nvim-ts-autotag").setup()
        end,
    },
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
          require("colorizer").setup({ "css", "scss", "html", "javascript" }, {
              RGB = true, -- #RGB hex codes
              RRGGBB = true, -- #RRGGBB hex codes
              RRGGBBAA = true, -- #RRGGBBAA hex codes
              rgb_fn = true, -- CSS rgb() and rgba() functions
              hsl_fn = true, -- CSS hsl() and hsla() functions
              css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
              css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
          })
        end,
    },
    {
        "rmagatti/goto-preview",
        config = function()
          require('goto-preview').setup {
              width = 120, -- Width of the floating window
              height = 25, -- Height of the floating window
              default_mappings = false, -- Bind default mappings
              debug = false, -- Print debug information
              opacity = nil, -- 0-100 opacity level of the floating window where 100 is fully transparent.
              post_open_hook = nil -- A function taking two arguments, a buffer and a window to be ran as a hook.
              -- You can use "default_mappings = true" setup option
              -- Or explicitly set keybindings
              -- vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>")
              -- vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>")
              -- vim.cmd("nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>")
          }
        end
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
    { "tpope/vim-repeat" },
    {
        "felipec/vim-sanegx",
        event = "BufRead",
    },
    {
        "tpope/vim-surround",
        -- make sure to change the value of `timeoutlen` if it's not triggering correctly, see https://github.com/tpope/vim-surround/issues/117
        -- setup = function()
        --  vim.o.timeoutlen = 500
        -- end
    },
    {
        "tpope/vim-bundler",
        cmd = { "Bundler", "Bopen", "Bsplit", "Btabedit" }
    },
    {
        "weizheheng/ror.nvim",
    },
    {
        "tpope/vim-rails",
        cmd = {
            "Eview",
            "Econtroller",
            "Emodel",
            "Smodel",
            "Sview",
            "Scontroller",
            "Vmodel",
            "Vview",
            "Vcontroller",
            "Tmodel",
            "Tview",
            "Tcontroller",
            "Rails",
            "Generate",
            "Runner",
            "Extract"
        },
        {
            "simrat39/rust-tools.nvim",
            -- ft = { "rust", "rs" }, -- IMPORTANT: re-enabling this seems to break inlay-hints
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
        {
            "karb94/neoscroll.nvim",
            event = "WinScrolled",
            config = function()
              require('neoscroll').setup({
                  -- All these keys will be mapped to their corresponding default scrolling animation
                  mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>',
                      '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
                  hide_cursor = true, -- Hide cursor while scrolling
                  stop_eof = true, -- Stop at <EOF> when scrolling downwards
                  use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
                  respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
                  cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
                  easing_function = nil, -- Default easing function
                  pre_hook = nil, -- Function to run before the scrolling animation starts
                  post_hook = nil, -- Function to run after the scrolling animation ends
              })
            end
        },
        {
            "simrat39/symbols-outline.nvim",
            cmd = "SymbolsOutline",
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
            module = "persistence",
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
        },
        {
            "sindrets/diffview.nvim",
            event = "BufRead",
        },
        {
            "phaazon/hop.nvim",
            event = "BufRead",
            config = function()
              require("hop").setup()
              vim.api.nvim_set_keymap("n", "s", ":HopLine<cr>", { silent = true })
              vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
            end,
        },
        {
            "catppuccin/nvim",
        },
        {
            "EdenEast/nightfox.nvim",
            require('nightfox').setup({
                options = {
                    terminal_colors = true,
                    styles = {
                        comments = "italic",
                        conditionals = "italic",
                        constants = "bold",
                        functions = "italic",
                        keywords = "bold,italic",
                        variables = "italic",
                        strings = "italic",
                        types = "bold",
                    }
                },
            })
        },
        {
            "navarasu/onedark.nvim",
            require('onedark').setup({
                style = 'deep',
                term_colors = true,
                ending_tildes = true,
                code_style = {
                    comments = 'italic',
                    keywords = 'bold,italic',
                    functions = 'bold,italic',
                    strings = 'italic',
                },
            })
        },
    }
}

-- -- Autocommands (`:help autocmd`) <https://neovim.io/doc/user/autocmd.html>
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- }
lvim.autocommands = {
    {
        "BufEnter",
        {
            pattern = { "*.thor" },
            command = "set syntax=ruby",
        }
    },
}
