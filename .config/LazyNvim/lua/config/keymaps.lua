-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- vim.keymap.set("i", "jj", "<ESC>", { noremap = true, silent = true, desc = "<ESC>" })

local mappings = {
  n = {},
  v = {},
  i = {
    ["jj"] = { "<ESC>", desc = "Exit insert mode using 'jj'" },
  },
  t = {},
}

for mode, map in pairs(mappings) do
  for lhs, rhs in pairs(map) do
    local desc = rhs.desc or ""
    local cmd = rhs[1] or ""
    vim.keymap.set(mode, lhs, cmd, { desc = desc })
  end
end
