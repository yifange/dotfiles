-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- vim.keymap.set(
--   "n",
--   "<leader>sx",
--   require("telescope.builtin").resume,
--   { noremap = true, silent = true, desc = "Resume" }
-- )
--
local Util = require("lazyvim.util")
local wk = require("which-key")

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- https://github.com/folke/which-key.nvim/issues/349
local function deregister(prefix, lhs, mode)
  pcall(wk.register, { [lhs] = "which_key_ignore" }, { prefix = prefix })
  pcall(vim.api.nvim_del_keymap, mode or "n", prefix .. lhs)
end

-- tabs
-- map("n", "<leader><tab>", "")
-- map("n", "<leader><tab>N", "")
-- map("n", "<leader><tab>n", "")
-- map("n", "<leader><tab>p", "")
-- map("n", "<leader><tab>c", "")
--
-- map("n", "<leader><tab>l", "")
-- map("n", "<leader><tab>f", "")
-- map("n", "<leader><tab><tab>", "")
-- map("n", "<leader><tab>[", "")
-- map("n", "<leader><tab>]", "")
-- map("n", "<leader><tab>d", "")
--
-- vim.keymap.del("n", "<leader><tab>N")
-- vim.keymap.del("n", "<leader><tab>n")
-- vim.keymap.del("n", "<leader><tab>p")
-- vim.keymap.del("n", "<leader><tab>c")
--
vim.keymap.del("n", "<leader><tab>l")
vim.keymap.del("n", "<leader><tab>f")
vim.keymap.del("n", "<leader><tab><tab>")
vim.keymap.del("n", "<leader><tab>[")
vim.keymap.del("n", "<leader><tab>]")
vim.keymap.del("n", "<leader><tab>d")

wk.register({ ["<leader>"] = { T = { name = "tabs" } } })
map("n", "<leader>Tl", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<leader>Tf", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader>TT", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader>T]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader>T[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
map("n", "<leader>Td", "<cmd>tabclose<cr>", { desc = "Close Tab" })

-- deregister("<leader>", "<tab>")
-- deregister("<leader>", "<tab>l")
-- deregister("<leader>", "<tab>f")
-- deregister("<leader>", "<tab>[")
-- deregister("<leader>", "<tab>]")
-- deregister("<leader>", "<tab><tab>")
-- deregister("<leader>", "<tab>d")

-- terminal
-- local lazyterm = function()
--   Util.float_term(nil, { cwd = Util.get_root() })
-- end
map("n", "<leader>ft", "")
map("n", "<leader>fT", "")
map("n", "<c-/>", "")
map("n", "<c-_>", "")
map("t", "<C-/>", "")
map("t", "<c-_>", "")

-- use toggleterm instead
-- map("n", "<c-`>", lazyterm, { desc = "Terminal (root dir)" })
-- map("n", "<a-`>", lazyterm, { desc = "Terminal (cwd)" })
-- map("t", "<C-`>", "<cmd>close<cr>", { desc = "Hide Terminal" })
-- map("t", "<a-`>", "<cmd>close<cr>", { desc = "Hide Terminal" })

-- buffer
map("n", "<leader><tab>", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
if Util.has("bufferline.nvim") then
  map("n", "gT", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
  map("n", "gt", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
end

-- neovide

if vim.g.neovide then
  map("n", "<D-v>", "+p<CR>")
  map("i", "<D-v>", "<C-R>+")
  map("t", "<D-v>", "<C-\\><C-n>+pi")
  map("v", "<D-c>", "+y<CR>")
  map("i", "<D-w>", ":bd<CR>")
  map("n", "<D-w>", ":bd<CR>")
  map("i", "<D-s>", "<esc>:w<cr>a")
  map("n", "<D-s>", ":w<cr>")
  map("t", "<S-Space>", "<Space>")
  vim.g.neovide_scale_factor = 1.0
  local change_scale_factor = function(delta)
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
  end
  map("n", "<D-=>", function()
    change_scale_factor(1.25)
  end)
  map("n", "<D-->", function()
    change_scale_factor(1 / 1.25)
  end)
  map("i", "<D-=>", function()
    change_scale_factor(1.25)
  end)
  map("i", "<D-->", function()
    change_scale_factor(1 / 1.25)
  end)
  map("n", "<D-.>", function()
    vim.lsp.buf.code_action()
  end)
  map("i", "<D-.>", function()
    vim.lsp.buf.code_action()
  end)
  map("n", "<D-,>", function()
    vim.diagnostic.open_float()
  end)
  map("i", "<D-,>", function()
    vim.diagnostic.open_float()
  end)
end

map("n", "<c-.>", function()
  vim.lsp.buf.code_action()
end)
map("i", "<c-.>", function()
  vim.lsp.buf.code_action()
end)
map("n", "<c-,>", function()
  vim.diagnostic.open_float()
end)
map("i", "<c-,>", function()
  vim.diagnostic.open_float()
end)

map("v", "=", function()
  require("lazyvim.plugins.lsp.format").format({ force = true })
end)
map("n", "==", "V=<esc>", { remap = true })

-- windows
map("n", "<c-w>/", "<cmd>vsplit<cr>")
map("n", "<c-w>-", "<cmd>split<cr>")

-- comment
map("n", "<C-/>", "gcc", { remap = true })
map("i", "<C-/>", "<esc>gcca", { remap = true })
map("v", "<C-/>", "gc", { remap = true })
map("n", "<D-/>", "gcc", { remap = true })
map("i", "<D-/>", "<esc>gcca", { remap = true })
map("v", "<D-/>", "gc", { remap = true })

vim.keymap.del("n", "<leader>bb") -- previous buffer
vim.keymap.del("n", "<leader>ft") -- terminal

-- HACK: Fix this. Doesn't belong here. Should be in plugin config
map("n", "<leader>ft", "<cmd>Neotree reveal<cr>", { desc = "Reveal file in NeoTree" })

map("n", "<leader>gg", function() vim.cmd("Neogit cwd=".. Util.get_root()) end, { desc = "Neogit (root dir)" })
map("n", "<leader>gG", "<cmd>Neogit<cr>", { desc = "Neogit (cwd)" })

map("n", "<c-w>m", "<C-w>_<c-w>|", { desc = "Max out window"})
