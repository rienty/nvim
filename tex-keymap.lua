
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
keymap("i", ",g", "<esc>/<++><CR>:nohlsearch<CR>c4l", opts)
keymap("i", ",r", "$ <--> $<++><esc>?<--><CR>N:nohlsearch<CR>c4l", opts)
keymap("i", ",t", "$$ <--> $$<++><esc>?<--><CR>N:nohlsearch<CR>c4l", opts)
keymap("i", "_", "_{<-->}<++><esc>?<--><CR>N:nohlsearch<CR>di{i", opts)
keymap("i", "^", "^{<-->}<++><esc>?<--><CR>N:nohlsearch<CR>di{i", opts)
keymap("i", ",w", "<esc>:w<CR>a", opts)
keymap("i", ",c", "<esc>:w<CR>:TexlabBuild<CR>a", opts)
keymap("i", ",v", "<esc>:w<CR>:TexlabForward<CR>a", opts)
keymap("i", ",n", "<esc>:e .local/share/nvim/site/pack/packer/start/friendly-snippets/snippets/latex/latex-snippets.json<CR>", opts)

keymap("i", ".b", "\\beta", opts)
keymap("i", ".a", "\\alpha", opts)
keymap("i", ".g", "\\gamma", opts)
keymap("i", ".d", "\\delta", opts)
keymap("i", ".e", "\\epsilon", opts)
keymap("i", ".t", "\\eta", opts)
keymap("i", ".r", "\\rho", opts)
keymap("i", ".G", "\\Gamma", opts)
keymap("i", ".h", "\\theta", opts)
keymap("i", ".m", "\\sigma", opts)
keymap("i", ".f", "\\phi", opts)
keymap("i", ".p", "\\pi", opts)
keymap("i", ".u", "\\mu", opts)

keymap("i", ".I", "\\infty", opts)
keymap("i", ".R", "\\Ric", opts)
keymap("i", ".S", "\\sec", opts)
keymap("i", ".v", "\\vol", opts)


