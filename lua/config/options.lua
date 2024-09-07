-- Настройки nvim.
vim.opt.number = true
vim.opt.syntax = "enable"
vim.opt.wrap = true
vim.opt.hlsearch = true

-- Neotree.
vim.keymap.set("n", "<C-t>", ":Neotree reveal<CR>", {})

-- Cmdline
vim.keymap.set("n", "<tab>", ":FineCmdline<CR>", {})
