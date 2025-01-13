local plug = vim.fn["plug#"]

vim.call("plug#begin", "~/.vim/plugged")

-- Mason
plug("williamboman/mason.nvim")
plug("williamboman/mason-lspconfig.nvim")

--LSP
plug("neovim/nvim-lspconfig")
plug("lukas-reineke/lsp-format.nvim")

-- Treesitter
plug("nvim-treesitter/nvim-treesitter", {["do"] = ":TSUpdate"})

-- Easy motion
plug("Lokaltog/vim-easymotion")

-- Nvim Tree
plug("nvim-tree/nvim-web-devicons")
plug("nvim-tree/nvim-tree.lua")

-- Plenary
plug("nvim-lua/plenary.nvim")

-- Ripgrep
plug("BurntSushi/ripgrep")

-- Telescope
plug("nvim-telescope/telescope.nvim", { ["tag"] = "0.1.8" })
plug("nvim-telescope/telescope-fzf-native.nvim", { ["do"] = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release" })
plug("sharkdp/fd")

-- Vim test
plug("vim-test/vim-test")

-- Color themes
plug("marko-cerovac/material.nvim")
plug("ellisonleao/gruvbox.nvim")
plug("vigoux/oak")
plug("jnurmine/Zenburn")
plug("petobens/colorish")
plug("dracula/vim", { ["as"] = "dracula" })
plug("NLKNguyen/papercolor-theme")
plug("haishanh/night-owl.vim")
plug("shaunsingh/nord.nvim")

vim.call("plug#end")

------------- Color Schemes ----------------
vim.opt.termguicolors = true
vim.cmd.colorscheme("nord")

-- Map Leader to space
 vim.keymap.set("n", "<Space>", "<Nop>", { silent = true, remap = false })

 vim.g.mapleader = " "

-- Relative line numbers
vim.opt.relativenumber = true

-- Shortcut to open this file
vim.keymap.set('n', '<Leader>v', function() vim.cmd.edit('~/.config/nvim/init.lua') end, { silent = false })

-- Use jj instead of esc
vim.keymap.set("i", "jj", "<ESC>", { silent = true })

-- Telescore binds
vim.keymap.set('n', '<Leader>f', function() vim.cmd('Telescope find_files') end)
vim.keymap.set('n', '<Leader>r', function() vim.cmd('Telescope live_grep') end)
vim.keymap.set('n', '<Leader>b', function() vim.cmd('Telescope buffers') end)

-- Vim test
vim.keymap.set("n", '<Leader><Leader>t', function() vim.cmd('TestNearest') end)
vim.keymap.set("n", '<Leader><Leader>a', function() vim.cmd('TestFile') end)
vim.keymap.set("n", '<Leader><Leader>l', function() vim.cmd('TestLast') end)

-- NvimTree toggle
require("nvim-tree").setup()
vim.keymap.set("n", '<Leader>n', function() vim.cmd('NvimTreeToggle') end)

-- Panel splitting
vim.keymap.set("n", '<Leader>vs', function() vim.cmd('execute "vsplit " bufname("#")') end)
vim.keymap.set("n", '<Leader>sp', function() vim.cmd('execute "split " bufname("#")') end)

-- Use <C-s> as save
local function save()
    vim.cmd.write()
    vim.print("Saved")
end
vim.keymap.set({"n", "v", "o", "i"}, "<C-s>", save)

-- buffers
vim.keymap.set("", "gn", vim.cmd.bnext)
vim.keymap.set("", "gp", vim.cmd.bprev)
vim.keymap.set("n", "<Leader>bd", ":bp<bar>sp<bar>bn<bar>bd<CR>")

----------- window navigation
function wincmd(direction)
    return function()
        vim.cmd.wincmd(direction)
    end
end
vim.keymap.set("n", "<C-k>", wincmd("k"), { silent = true })
vim.keymap.set("n", "<C-j>", wincmd("j"), { silent = true })
vim.keymap.set("n", "<C-h>", wincmd("h"), { silent = true })
vim.keymap.set("n", "<C-l>", wincmd("l"), { silent = true })

-- Don't give the intro message when starting
vim.opt.shortmess:append({ I = true })

-- use line numbers
vim.o.number = true

-- Disable word wrap
vim.o.wrap = false

-- Do not highlight all search hits
vim.o.hlsearch = false

-- Enable mouse support in normal and visual modes.
vim.o.mouse = 'nv'

-- Use system clipboard by default
vim.o.clipboard = 'unnamedplus'

-- Tab counts for 4 spaces
vim.o.tabstop = 4
-- Autoindent (>>, <<) will use tabstop value
vim.o.shiftwidth = 0
-- Insert 4 spaces instead of a tab char when pressing the tab key in insert modes
vim.o.expandtab = true

-- Disable swapfiles
vim.o.swapfile = false

-- Disable automatically adding comment leader to the next line
vim.api.nvim_create_autocmd('FileType', {
	pattern = '*',
	callback = function()
		vim.opt.formatoptions:remove({'r', 'o'})
	end
})

-- Allow recursive find
vim.opt.path:append('**')

-- No large banner at the top of netwr
vim.g.netrw_banner = 0

-- Open diffs in vertical splits by default
vim.opt.diffopt:append({ internal = false })
vim.opt.diffopt:remove({ 'vertical' })

-- Grep
vim.opt.grepprg = 'grep -RIn $* .'
vim.keymap.set('n', '<Leader>gg', ':grep -r ')

-- keymaps to yank file name
vim.keymap.set('n', '<Leader>yff', ':let @+ = expand("%")<cr>', { silent = true })
vim.keymap.set('n', '<Leader>yf', ':let @+ = expand("%:t")<cr>', { silent = true })

-- Shortcut to open workingMemory.txt
vim.keymap.set('n', '<Leader>wm', function() vim.cmd.edit('~/workingMemory.txt') end, { silent = false })

-- Try to prevent bad habits like using the arrow keys for movement. This is
-- not the only possible bad habit. For example, holding down the h/j/k/l keys
-- for movement, rather than using more efficient movement commands, is also a
-- bad habit. The former is enforceable through a .vimrc, while we don't know
-- how to prevent the latter.
vim.keymap.set('n', '<Left>',  ':echoe "Use h"<CR>')
vim.keymap.set('n', '<Right>', ':echoe "Use l"<CR>')
vim.keymap.set('n', '<Up>',    ':echoe "Use k"<CR>')
vim.keymap.set('n', '<Down>',  ':echoe "Use j"<CR>')

-- Shortcuts to navigate the buffer list
vim.keymap.set('n', ']b', vim.cmd.bnext, { noremap = true, silent = true })
vim.keymap.set('n', '[b', vim.cmd.bprev, { noremap = true, silent = true })

-- Open the altfile
vim.keymap.set('n', '[a', function() vim.cmd.edit("#") end, { noremap = true, silent = true })

-- Shortcuts for navigating quickfix list
vim.keymap.set('n', ']q', ":cnext<CR>", { noremap = true, silent = true })
vim.keymap.set('n', '[q', ":cprev<CR>", { noremap = true, silent = true })

-- Git conflict marker shortcuts
vim.keymap.set('n', '<Leader><', '/<<<<<<<<CR>', { silent = true })
vim.keymap.set('n', '<Leader>>', '/>>>>>>><CR>', { silent = true })
vim.keymap.set('n', '<Leader>=', '/=======<CR>', { silent = true })

-- from https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- Multipurpose tab key
function InsertTab()
	if (has_words_before()) then
		-- There's an identifier before the cursor, so complete the identifier.
		return "<c-p>"
    end

    return "<tab>"
end

vim.keymap.set('i', '<tab>', InsertTab, { expr = true })
vim.keymap.set('i', '<s-tab>', '<c-n>', { noremap = true })

-- Treesitter config
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the listed parsers MUST always be installed)
  ensure_installed = { "elixir", "java", "elm", "rust", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (or "all")
  ignore_install = { "javascript" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { "c" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

-- Mason config
require("mason").setup()
require("mason-lspconfig").setup()

-- LSP config
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local opts = { noremap=true, silent=true }
    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.keymap.set('n', '<Leader>d', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[w', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']w', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<Leader>q', vim.diagnostic.setqflist, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)

    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    -- vim.keymap.set('n', '<Leader>r', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)

    -- always show a sign column of width 1
    vim.wo.signcolumn = "yes:1"

    -- format on save if available
    if client.server_capabilities.documentFormattingProvider then
        -- use autocommand group so re-attach will reset
        local group_id = vim.api.nvim_create_augroup("Format", { clear = true })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = group_id,
            pattern = "<buffer>",
            callback = function() vim.lsp.buf.format({bufnr = bufnr}) end
        })
    end
end

local servers = { "elixirls", "jdtls" } -- any other servers you want

for _, lsp in pairs(servers) do
    local config = {
        on_attach = on_attach,
        flags = {
            debounce_text_changes = 150,
        },
    }

    nvim_lsp[lsp].setup(config)
end

vim.diagnostic.config({
  virtual_text = false,
  underline = { severity = vim.diagnostic.severity.ERROR },
  update_in_insert = false,
  signs = true,
})

-- always show
local signs = { Error = ">", Warn = "W", Hint = "H", Info = "I" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end


-- LSP format config
require("lsp-format").setup {}
require("lspconfig").gopls.setup { on_attach = require("lsp-format").on_attach }
