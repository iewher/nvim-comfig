-- Настройки nvim.
vim.opt.number = true
vim.opt.syntax = "enable"
vim.opt.wrap = true
vim.opt.hlsearch = true

-- Neotree.
vim.keymap.set("n", "<tab>", ":Neotree reveal<CR>", {})

-- Cmdline
vim.keymap.set("n", ":", ":FineCmdline<CR>", {})

-- Stylua
vim.keymap.set("n", "<C-s>", ":lua require('stylua-nvim').format_file()<CR>:w<CR>", {})
