local keymap = vim.keymap

-- Directory navigation
keymap.set("n", "<leader>m", ":NvimTreeFocus<CR>", { noremap = true, silent = true })
keymap.set("n", "<leader>f", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- Pane and Window Navigation
keymap.set("n", "<C-h>", "<C-w>h", opts)
keymap.set("n", "<C-j>", "<C-w>j", opts)
keymap.set("n", "<C-k>", "<C-w>k", opts)
keymap.set("n", "<C-l>", "<C-w>l", opts)
keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
keymap.set("t", "<c-j>", [[<Cmd>wincmd j<CR>]], opts)
keymap.set("t", "<c-k>", [[<Cmd>wincmd k<CR>]], opts)
keymap.set("t", "<c-l>", [[<Cmd>wincmd l<CR>]], opts)
keymap.set("n", "<C-h>", ":TmuxNavigateLeft<CR>", opts)
keymap.set("n", "<c-j>", ":TmuxNavigateDown<CR>", opts)
keymap.set("n", "<c-k>", ":TmuxNavigateUp<CR>", opts)
keymap.set("n", "<c-l>", ":TmuxNavigateRight<CR>", opts)

-- Window Management

keymap.set("n", "<leader>sv", ":vsplit<CR>", opts)
keymap.set("n", "<leader>sh", ":split<CR>", opts)

-- Indenting

keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")
