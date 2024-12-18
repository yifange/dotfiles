local map = vim.keymap.set

-- general mappings
map("n", "<C-s>", "<cmd> w <CR>")
map("i", "<C-s>", "<cmd> w <CR>")
map("n", "<leader><tab>", "<cmd>e #<cr>", { desc = "Last buffer" })
map("n", "<Esc>", "<cmd>noh<cr>", { desc = "Clear highlights" })
map("n", "<leader>bd", "<cmd>lua MiniBufremove.delete() <cr>", { desc = "Close buffer" })

-- pick

map("n", "<leader>ff", function()
	require("mini.pick").builtin.files()
end, { desc = "Find File" })
map("n", "<leader><leader>", function()
	require("mini.pick").builtin.files()
end, { desc = "Find File" })
map("n", "<leader>.", function()
	require("mini.pick").builtin.resume()
end, { desc = "Resume Picker" })
map("n", "<leader>fb", function()
	require("mini.pick").builtin.buffers()
end, { desc = "Find Buffer" })
map("n", "<leader>bb", function()
	require("mini.pick").builtin.buffers()
end, { desc = "Find Buffer" })
map("n", "<leader>f/", function()
	require("mini.pick").builtin.grep()
end, { desc = "Search" })
map("n", "<leader>/", function()
	require("mini.pick").builtin.grep_live({ tool = "rg" })
end, { desc = "Search Live" })
map("n", "<leader>*", function()
	local cword = vim.fn.expand("<cword>")
	require("mini.pick").builtin.grep({ pattern = cword })
end, { desc = "Find Word" })

map("n", "<leader>fy", function()
	require("yazi").yazi()
end, { desc = "Find File in Yazi" })
map("n", "<leader>fY", "<cmd>Yazi<cr>", { desc = "Find File in Yazi" })
map("n", "<leader>fY", "<cmd>Yazi cwd<cr>", { desc = "Find CWD in Yazi" })
local function get_visual_selection()
	-- Yank current visual selection into the 'v' register
	--
	-- Note that this makes no effort to preserve this register
	vim.cmd('noau normal! "vy"')

	return vim.fn.getreg("v")
end

map("v", "<leader>/", function()
	require("mini.pick").builtin.grep({ pattern = get_visual_selection() })
end, { desc = "Search" })

map("n", "<leader>fo", function()
	require("mini.extra").pickers.oldfiles({ current_dir = true, preserve_order = true })
end, { desc = "Find Recent Files" })
map("n", "<leader>fv", function()
	require("mini.extra").pickers.visit_paths()
end, { desc = "Find Visit Paths" })
map("n", "<leader>fl", function()
	require("mini.extra").pickers.visit_labels()
end, { desc = "Find Visit Labels" })
map("n", "<leader>fgc", "<cmd> Pick git_commits <cr>", { desc = "Find Git Commits" })
map("n", "<leader>fgb", "<cmd> Pick git_branches <cr>", { desc = "Find Git Branches" })
map("n", "<leader>fgh", "<cmd> Pick git_hunks <cr>", { desc = "Find Git Hunks" })
map("n", "<leader>fd", "<cmd> Pick diagnostic <cr>", { desc = "Find Diagnostic" })

map("n", "<leader>fr", function()
	require("mini.extra").pickers.lsp({ scope = "references" })
end, { desc = "Find References" })
map("n", "<leader>fs", function()
	require("mini.extra").pickers.lsp({ scope = "document_symbol" })
end, { desc = "Find Symbols" })

map("n", "<leader>ll", function()
	require("mini.extra").pickers.visit_labels()
end, { desc = "Select Label" })
map("n", "<leader>la", function()
	require("mini.visits").add_label()
end, { desc = "Add Label" })
map("n", "<leader>ld", function()
	require("mini.visits").remove_label()
end, { desc = "Remove Label" })

map("n", "<leader>ss", function()
	vim.cmd("wa")
	require("mini.sessions").write()
	require("mini.sessions").select()
end, { desc = "Switch Session" })
map("n", "<leader>sw", function()
	local cwd = vim.fn.getcwd()
	local last_folder = cwd:match("([^/]+)$")
	require("mini.sessions").write(last_folder)
end, { desc = "Save Session" })
map("n", "<leader>sl", function()
	vim.cmd("wa")
	require("mini.sessions").select()
end, { desc = "Load Session" })

map("n", "<leader>gl", function()
	require("mini.extra").pickers.git_commits({ path = vim.fn.expand("%:p") })
end, { desc = "Git Log this File" })
map("n", "<leader>gp", "<cmd>Git pull<cr>", { desc = "Git Pull" })
map("n", "<leader>gP", "<cmd>Git push<cr>", { desc = "Git Push" })
map("n", "<leader>gA", "<cmd>Git add .<cr>", { desc = "Git Add All" })
map("n", "<leader>gC", '<cmd>Git commit -m "checkpoint" --no-verify<cr>', { desc = "Git Checkpoint" })
map("", "<leader>gh", function()
	require("mini.git").show_range_history()
end, { desc = "Git Range History" })
map("n", "<leader>gx", function()
	require("mini.git").show_at_cursor()
end, { desc = "Git Context Cursor" })

-- flash
map("n", "s", function()
	require("flash").jump()
end, { desc = "Flash Jump" })
map("n", "S", function()
	require("flash").treesitter()
end, { desc = "Flash Treesitter" })
map("c", "<c-s>", function()
	require("flash").toggle()
end, { desc = "Toggle Flash Search" })
map("n", "s", function()
	require("flash").jump()
end, { desc = "Flash Jump" })
map("x", "s", function()
	require("flash").jump()
end, { desc = "Flash Jump" })
map("o", "s", function()
	require("flash").jump()
end, { desc = "Flash Jump" })
map("n", "S", function()
	require("flash").treesitter()
end, { desc = "Flash treesitter" })
map("o", "r", function()
	require("flash").remote()
end, { desc = "Remote Flash" })
map("o", "R", function()
	require("flash").treesitter_search()
end, { desc = "Treesitter search" })

-- telescope
-- map("n", "<leader>ff", "<cmd> Telescope find_files <CR>")
-- map("n", "<leader><leader>", "<cmd> Telescope find_files <CR>")
-- map("n", "<leader>fr", "<cmd> Telescope oldfiles <CR>")
-- map("n", "<leader>bb", "<cmd> Telescope buffers <CR>")
-- map("n", "<leader>/", "<cmd> Telescope live_grep_args <CR>")
-- map("n", "<leader>.", "<cmd> Telescope resume <CR>")
-- map("n", "<leader>fs", "<cmd> Telescope lsp_document_symbols <CR>")
-- map("n", "<leader>fS", "<cmd> Outline <CR>", { desc = "Toggle outline"})
-- map("n", "<leader>fgs", "<cmd> Telescope git_status <CR>")
-- map("n", "<leader>fgc", "<cmd> Telescope git_bcommits <CR>")
-- map("v", "<leader>fgc", "<cmd> Telescope git_bcommits_range <CR>")
-- map("n", "<leader>fgb", "<cmd> Telescope git_branches <CR>")
-- map("n", "<leader>fy", "<cmd> Telescope neoclip <CR>")
-- map("n", "<leader>gr", "<cmd> Telescope lsp_references <CR>")
-- map("n", "<leader>*", function()
--   require("telescope-live-grep-args.shortcuts").grep_word_under_cursor()
-- end)
-- map("v", "<leader>/", function()
--   require("telescope-live-grep-args.shortcuts").grep_visual_selection()
-- end)
--
-- bufferline, cycle buffers
-- map("n", "<Tab>", "<cmd> BufferLineCycleNext <CR>")
-- map("n", "<S-Tab>", "<cmd> BufferLineCyclePrev <CR>")
-- map("n", "<C-q>", "<cmd> bd <CR>")

-- comment.nvim
-- map("n", "<C-/>", function()
--   require("Comment.api").toggle.linewise.current()
-- end)
-- map("n", "gcc", function()
--   require("Comment.api").toggle.linewise.current()
-- end)

-- map("v", "<C-/>", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>")
-- map("v", "gc", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>")

-- format
map("n", "<leader>cf", function()
	require("conform").format()
end)

-- windows
-- map("n", "<C-j>", "<C-w>j")
-- map("n", "<C-k>", "<C-w>k")
-- map("n", "<C-h>", "<C-w>h")
-- map("n", "<C-l>", "<C-w>l")
map("n", "<C-w>/", "<cmd>vsplit<cr>", { desc = "Vertical split" })
map("n", "<C-w>-", "<cmd>split<cr>", { desc = "Horizontal split" })
map("n", "<C-w><C-/>", "<cmd>vsplit<cr>", { desc = "Vertical split" })
map("n", "<C-w><C-->", "<cmd>split<cr>", { desc = "Horizontal split" })
-- map("n", "<C-w>m", "<C-w>_<c-w>|", { desc = "Max out window" })
-- map("n", "<C-w><C-m>", "<C-w>_<c-w>|", { desc = "Max out window" })
-- map("n", "<A-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
-- map("n", "<A-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
-- map("n", "<A-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
-- map("n", "<A-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- mini.files
map("n", "<leader>ft", function()
	require("mini.files").open(vim.api.nvim_buf_get_name(0))
end, { desc = "Focus File" })
map("n", "<leader>e", function()
	require("mini.files").open(require("mini.files").get_latest_path())
end, { desc = "Open MiniFile" })

-- terminal
map("n", "<C-`>", function()
	require("nvterm.terminal").toggle("float")
end, { desc = "Toggle terminal" })
map("t", "<C-`>", function()
	require("nvterm.terminal").toggle("float")
end, { desc = "Toggle terminal" })

-- lsp
map("n", "<C-.>", "<cmd>CodeActionMenu<CR>", { desc = "LSP Code Actions" })

-- git
-- map("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "LazyGit" })

-- Trouble
-- map("n", "<leader>xx", function()
--   require("trouble").open()
-- end, { desc = "Open Trouble" })
-- map("n", "<leader>xw", function()
--   require("trouble").open "workspace_diagnostics"
-- end, { desc = "Open Trouble Workspace Diagnostics" })
-- map("n", "<leader>xt", function()
--   require("trouble").open "todo"
-- end, { desc = "Open Trouble TODO" })
-- map("n", "gR", function()
--   require("trouble").open "lsp_references"
-- end, { desc = "Open Trouble Workspace Diagnostic" })
--
-- -- Hop
-- map("n", "<leader>jj", function()
--   require("hop").hint_char1()
-- end, { desc = "Hop Char" })
-- map("n", "<leader>jw", function()
--   require("hop").hint_words()
-- end, { desc = "Hop Word" })
-- map("n", "<leader>jl", function()
--   require("hop").hint_lines()
-- end, { desc = "Hop Line" })
--
-- vim.keymap.set("n", "<leader>ma", function()
--   require("harpoon"):list():append()
-- end)
-- vim.keymap.set("n", "<leader>mm", function()
--   require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
-- end)

-- Toggle previous & next buffers stored within Harpoon list
-- vim.keymap.set("n", "<leader>m[", function()
--   require("harpoon"):list():prev()
-- end)
-- vim.keymap.set("n", "<leader>m]", function()
--   require("harpoon"):list():next()
-- end)

if vim.g.neovide then
	map("n", "<D-v>", "+p<CR>")
	map("i", "<D-v>", "<C-R>+")
	-- map("t", "<D-v>", "<C-\\><C-n>+pi")
	map("t", "<D-v>", '<C-\\><C-o>"+p', { noremap = true, silent = true })
	map("v", "<D-c>", "+y<CR>")
	map("i", "<D-w>", ":bd<CR>")
	map("n", "<D-w>", ":bd<CR>")
	map("i", "<D-s>", "<esc>:w<cr>a")
	map("n", "<D-s>", ":w<cr>")
	map("t", "<S-Space>", "<Space>")
	vim.g.neovide_scale_factor = 1.0
	local change_scale_factor = function(delta)
		vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
		vim.api.nvim_command("redraw!")
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
