-- packer init
require('packer').startup(function(use)
	use 'wbthomason/packer.nvim' -- Package manager
	use 'phaazon/hop.nvim'
	use 'nvim-lua/plenary.nvim'
	use 'lewis6991/gitsigns.nvim'
	use 'nvim-lualine/lualine.nvim' -- Fancier statusline
	use 'vim-autoformat/vim-autoformat'
	use 'windwp/nvim-autopairs' -- Autopairs, integrates with both cmp and treesitt
	use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
	use 'nvim-treesitter/nvim-treesitter' -- Additional textobjects for treesitter
	use 'ellisonleao/gruvbox.nvim'
	use 'neovim/nvim-lspconfig'
	use 'williamboman/nvim-lsp-installer'
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-nvim-lua'
	use 'saadparwaiz1/cmp_luasnip'
	use 'L3MON4D3/LuaSnip'
	use 'rienty/friendly-snippets'
	use 'nvim-telescope/telescope.nvim'
	use 'nvim-telescope/telescope-fzf-native.nvim'
end)

-- Basic setting
local options = {
	backup = true, -- creates a backup file
	clipboard = "unnamedplus", -- allows neovim to access the system clipboard
	cmdheight = 1,
	completeopt = { "menuone", "noselect" }, -- mostly just for cmp
	fileencoding = "utf-8", -- the encoding written to a file
	hlsearch = true, -- highlight all matches on previous search pattern
	ignorecase = true, -- ignore case in search patterns
	mouse = "a", -- allow the mouse to be used in neovim
	pumheight = 10, -- pop up menu height
	showmode = false, -- we don't need to see things like -- insert -- anymore
	showtabline = 0, -- always show tabs
	smartcase = true, -- smart case
	smartindent = true, -- make indenting smarter again
	undofile = true, -- enable persistent undo
	tabstop = 4,
	shiftwidth = 4,
	updatetime = 300, -- faster completion (4000ms default)
	writebackup = false, -- if a file is being edited by another program
	laststatus = 2,
	cursorline = true, -- highlight the current line
	number = true, -- set numbered lines
	relativenumber = true, -- set relative numbered lines
	spell = true,
	numberwidth = 2, -- set number column width to 2 {default 4}
	signcolumn = "yes", -- always show the sign column
	wrap = true, -- display lines as one long line
	scrolloff = 8, -- is one of my fav
	sidescrolloff = 8,
	breakindent = true,
	termguicolors = true,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

-- Keymap config

-- Shorten function name
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
keymap("n", "<LEADER>q", ":q<CR>", opts)
keymap("n", "<LEADER>w", ":w<CR>", opts)

-- Insert --
keymap("i", ",a", "<ESC>A", opts)
keymap("i", ",q", "<ESC>0i", opts)
keymap("i", ",f", "<ESC>la", opts)

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

-- colorscheme config
vim.cmd [[colorscheme gruvbox]]

-- auto save palce
vim.cmd [[au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]]

-- auto format
vim.cmd [[au BufWrite * :Autoformat]]

-- loading tex keymap
--vim.cmd [[source ~/.config/nvim/latex-key.vim]]

--Set statusbar
require('lualine').setup {
	options = {
		icons_enabled = false,
		theme = 'gruvbox',
		component_separators = '|',
		section_separators = '|',
	},
}

-- Hop config
require('hop').setup { keys = 'etovxqpdygfblzhckisuran' }

keymap("n", "<LEADER>s", ":HopPattern<CR>", opts)

-- Indent blankline
require('indent_blankline').setup {
	char = '┊',
	show_trailing_blankline_indent = false,
}

-- Gitsigns
require('gitsigns').setup {
	signs = {
		add = { text = '+' },
		change = { text = '~' },
		delete = { text = '_' },
		topdelete = { text = '‾' },
		changedelete = { text = '~' },
	},
}

-- Treesitter configuration
require('nvim-treesitter.configs').setup {
	ensure_installed = {
		"python",
		"bash",
		"c",
		"bibtex",
		"latex",
	},
	sync_install = false,
	ignore_install = { "haskell" },
	highlight = {
		enable = true,
		disable = { "" },
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = false,
		disable = {},
	},
}

-- Autopairs
require('nvim-autopairs').setup {
	check_ts = true,
	ts_config = {
		lua = { "string", "source" },
		javascript = { "string", "template_string" },
		java = false,
	},
	disable_filetype = { "TelescopePrompt", "spectre_panel" },
	fast_wrap = {
		map = "<M-e>",
		chars = { "{", "[", "(", '"', "'" },
		pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
		offset = 0, -- Offset from pattern match
		end_key = "$",
		keys = "qwertyuiopzxcvbnmasdfghjkl",
		check_comma = true,
		highlight = "PmenuSel",
		highlight_grey = "LineNr",
	},
}

-- Lsp installler
require('nvim-lsp-installer').setup {}

--  Luasnip loading
require('luasnip.loaders.from_vscode').lazy_load()

-- Cmp config
local cmp = require('cmp')
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local luasnip = require('luasnip')

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	window = {},
	formatting = {
		fields = { 'menu', 'abbr' },
		format = function(entry, item)
			local menu_icon = {
				nvim_lsp = 'λ',
				luasnip = '⋗',
				buffer = 'w',
				cmdline = 's',
			}

			item.menu = menu_icon[entry.source.name]
			return item
		end,
	},
	mapping = cmp.mapping.preset.insert({
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
		['<C-d>'] = cmp.mapping(function(fallback)
			if luasnip.jumpable(1) then
				luasnip.jump(1)
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<C-b>'] = cmp.mapping(function(fallback)
			if luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { 'i', 's' }),
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp', keyword_length = 1 },
		{ name = 'luasnip', keyword_length = 2 },
		{ name = 'buffer', keyword_length = 2 },
		{ name = 'path' }
	})
})

cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'cmdline' }
	})
})

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })

-- Lsp config
keymap('n', 'ge', vim.diagnostic.open_float, opts)
keymap('n', '[d', vim.diagnostic.goto_prev, opts)
keymap('n', ']d', vim.diagnostic.goto_next, opts)
keymap('n', 'gq', vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	keymap('n', 'gD', vim.lsp.buf.declaration, bufopts)
	keymap('n', 'gd', vim.lsp.buf.definition, bufopts)
	keymap('n', 'K', vim.lsp.buf.hover, bufopts)
	keymap('n', 'gi', vim.lsp.buf.implementation, bufopts)
	keymap('n', 'gk', vim.lsp.buf.signature_help, bufopts)
	keymap('n', 'ga', vim.lsp.buf.add_workspace_folder, bufopts)
	keymap('n', 'gw', vim.lsp.buf.remove_workspace_folder, bufopts)
	keymap('n', 'gl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	keymap('n', 'gt', vim.lsp.buf.type_definition, bufopts)
	keymap('n', 'gr', vim.lsp.buf.rename, bufopts)
	keymap('n', 'gc', vim.lsp.buf.code_action, bufopts)
	keymap('n', 'gf', vim.lsp.buf.references, bufopts)
	keymap('n', 'go', vim.lsp.buf.formatting, bufopts)
end

local lsp_flags = {	debounce_text_changes = 150 }

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

require('lspconfig').texlab.setup {
	capabilities = capabilities,
	on_attach = on_attach,
	flags = lsp_flags,
	settings =
	{
		texlab = {
			auxDirectory = ".",
			bibtexFormatter = "texlab",
			build = {
				args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
				executable = "latexmk",
				forwardSearchAfter = false,
				onSave = true
			},
			chktex = { onEdit = false, onOpenAndSave = true },
			diagnosticsDelay = 300,
			formatterLineLength = 80,
			forwardSearch = {
				args = { "--synctex-forward", "%l:1:%f", "%p" },
				executable = "zathura"
			},
			latexFormatter = "latexindent",
			latexindent = { modifyLineBreaks = false }
		}
	}
}

require('lspconfig').sumneko_lua.setup {
	settings = {
		Lua = {
			runtime = { version = 'LuaJIT' },
			diagnostics = { globals = {'vim'} },
			workspace = { library = vim.api.nvim_get_runtime_file("", true) },
			telemetry = { enable = false },
		},
	},
	capabilities = capabilities,
	on_attach = on_attach,
	flags = lsp_flags
}

-- Telescope config
require('telescope').setup{
	defaults = {
		borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
	},
	pickers = {},
	extensions = {}
}

keymap("n", "<LEADER>fb", ":Telescope current_buffer_fuzzy_find<CR>", opts)
keymap("n", "<LEADER>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<LEADER>fc", ":Telescope commands<CR>", opts)


