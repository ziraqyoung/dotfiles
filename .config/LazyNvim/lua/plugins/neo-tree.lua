return {
  "nvim-neo-tree/neo-tree.nvim",
  lazy = true,
  cmd = "Neotree",
  opts = {
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_by_name = {
          ".git",
        },
        never_show = {
          ".DS_Store",
        },
        always_show = {
          ".env",
        },
      },
    },
    window = {
      mappings = {
        ["l"] = "open",
        ["h"] = "close_all_subnodes",
        ["<cr>"] = "open",
        ["<space>"] = false, -- disable for leader
        ["<esc>"] = "revert_preview",
        ["P"] = { "toggle_preview", config = { use_float = true } },
        ["s"] = "open_split",
        ["S"] = "split_with_window_picker",
        ["v"] = "open_vsplit",
        ["V"] = "vsplit_with_window_picker",
        ["t"] = "open_tabnew",
        ["w"] = "open_with_window_picker",
        ["C"] = "close_node",
        ["M"] = "close_all_nodes",
        ["O"] = "expand_all_nodes",
        ["R"] = "refresh",
        ["a"] = { "add", config = { show_path = "relative" } }, -- "none", "relative", "absolute"
        ["A"] = "add_directory",                                -- also accepts the config.show_path option.
        ["d"] = "delete",
        ["r"] = "rename",
        ["y"] = "copy_to_clipboard",
        ["x"] = "cut_to_clipboard",
        ["p"] = "paste_from_clipboard",
        ["c"] = "copy", -- takes text input for destination, also accepts the config.show_path option
        ["m"] = "move", -- takes text input for destination, also accepts the config.show_path option
        ["e"] = "toggle_auto_expand_width",
        ["q"] = "close_window",
        ["?"] = "show_help",
        ["<"] = "prev_source",
        [">"] = "next_source",
      },
    },
    nesting_rules = {
      ["js"] = { "js.map" },
    },
  },
}
