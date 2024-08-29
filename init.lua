local plug = vim.fn["plug#"]

vim.call("plug#begin", "~/.vim/plugged")

vim.cmd.source("~/dotfiles/plugs.vim")

-- Coc-nvim
plug("neoclide/coc.nvim", {branch = "release"})

-- Editor plugs
plug("nvim-treesitter/nvim-treesitter", {["do"] = ":TSUpdate"})
plug("scrooloose/nerdtree", { on =  "NERDTreeToggle" })
plug("itchyny/lightline.vim")
plug("jreybert/vimagit")
plug("Lokaltog/vim-easymotion")
plug("tpope/vim-surround")
plug("junegunn/fzf", { dir = "~/.fzf", ["do"] = "./install --all --no-update-rc" })
plug("junegunn/fzf.vim")
plug("tpope/vim-repeat")
plug("jiangmiao/auto-pairs")
plug("vim-test/vim-test")

-- Elixir & Erlang
plug("elixir-editors/vim-elixir")
plug("mhinz/vim-mix-format")
vim.g.mix_format_on_save = 1
plug("fishcakez/vim-erlang")

-- Elm
plug("ElmCast/elm-vim")
vim.g.elm_format_autosave = 1

-- Ruby
plug("thoughtbot/vim-rspec")
plug("aklt/plantuml-syntax")

-- Go
plug("fatih/vim-go")
vim.g.go_fmt_autosave = 1
vim.g.go_metalinter_autosave = 0

-- Docker
plug("ekalinin/Dockerfile.vim")

-- CSS syntax highlight
plug("othree/csscomplete.vim")
-- Add Support css3 properties
plug("hail2u/vim-css3-syntax")
plug("cakebaker/scss-syntax.vim")
-- highlight hex colors in color
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = "*.scss",
    callback = function(_)
        vim.opt.filetype = "scss.css"
    end
})
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = "*.sass",
    callback = function(_)
        vim.opt.filetype = "sass.css"
    end
})
-- scss lint
plug("gcorne/vim-sass-lint")

------- Javascript
-- Syntax highlighting for .jsx (typescript)
plug("peitalin/vim-jsx-typescript")
-- Typescript -
plug("leafgarland/typescript-vim")
plug("Shougo/vimproc.vim", {
    build = {
        windows = "tools\\update-dll-mingw",
        cygwin = "make -f make_cygwin.mak",
        mac = "make -f make_mac.mak",
        linux = "make",
        unix = "gmake",
    },
})

plug("elzr/vim-json")
vim.g.vim_json_syntax_conceal = 0
-- GraphQL syntax highlighting
-- plug("jparise/vim-graphql")
-- plug("posva/vim-vue")


------- Brackets & Parentheses highlighting
-- Valloric/MatchTagAlways --
vim.keymap.set("n", "<Leader>%", ":MtaJumpToOtherTag<CR>", { remap = false })
vim.g.mta_filetypes = {
    html= 1,
    xhtml = 1,
    xml = 1,
    javascript = 1,
    [ "javascript.jsx" ] = 1,
    [ "javascript.tsx" ] = 1,
    [ "typescript.tsx" ] = 1,
    typescript = 1
}

-- C-m is synonymous with "enter", so will cause enter key to lag
vim.g.user_emmet_leader_key = "<C-k>"
vim.g.user_emmet_settings = { javascript = { extends = "jsx" }}

-- Color themes
plug("morhetz/gruvbox")
plug("jnurmine/Zenburn")
plug("petobens/colorish")
plug("dracula/vim", { as = "dracula" })
plug("NLKNguyen/papercolor-theme")

vim.call("plug#end")

vim.cmd.source("~/dotfiles/vimrc")

vim.opt.hidden = true           -- Allow buffers to become hidden (default)
vim.opt.encoding = "utf-8"      -- Use UTF-8 encoding (default)
vim.opt.incsearch = true        -- Move while searching (default)
vim.opt.laststatus = 2          -- Always show the status line (default)
vim.opt.report = 2              -- Tell us when anything is changed via :...
vim.opt.scrolloff = 10          -- Keep 10 lines (top/bottom) for scope
vim.opt.showcmd = true          -- Show the command being typed (default)
vim.opt.showmatch = true        -- Show matching brackets
vim.opt.backspace = { "indent", "eol" , "start" } -- (default)
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.virtualedit = "block"   -- Allow the cursor to go anywhere in visual block mode
vim.opt.relativenumber = true   -- Relative line numbers
vim.opt.number = true           -- Line numbers [:set number!] to turn off
vim.opt.numberwidth = 5         -- We are good up to 99999 lines
vim.opt.sidescrolloff = 10      -- Keep 5 lines at the size
vim.opt.list = true             -- Show whitespace and tabs
vim.opt.listchars = { tab = "¦·", trail = "·" } -- Show tabs and trailing whitespace
vim.opt.clipboard = "unnamed"   -- Copy and paste with *
vim.opt.mouse = "a"             -- Scrollable term-vim
vim.opt.autoread = true         -- (default)
-- TextEdit might fail if hidden is not set.

-- Some servers have issues with backup files, see #649.
vim.opt.backup = false          -- (default)
vim.opt.writebackup = false

-- Give more space for displaying messages.
vim.opt.cmdheight = 2

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 300

-- Don't pass messages to |ins-completion-menu|.
vim.opt.shortmess:append({ c = true })

-- Always show the signcolumn, otherwise it would shift the text each time
-- diagnostics appear/become resolved.
vim.opt.signcolumn = "yes"

-- Allow us to use Ctrl-s and Ctrl-q as keybinds
vim.cmd("silent !stty -ixon")

-- Restore default behaviour when leaving Vim.
vim.api.nvim_create_autocmd("VimLeave", {
    pattern = "*", -- default pattern
    command = "silent !stty ixon",
})

local function save()
    vim.cmd.write()
    vim.print("Saved")
end
vim.keymap.set({"n", "v", "o", "i"}, "<C-s>", save)

vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
    pattern = {"*.ts", "*.js"},
    callback = function(_)
        vim.print("set filetype to typescript")
        vim.opt.filetype = "typescript.tsx"
    end
})
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
    pattern = "*.vue",
    callback = function(_)
        vim.opt.filetype = "vue.typescript"
    end
})

-- replace tabs with 4 whitespace
-- nmap <F4> :%s/\t/    /g<CR>

vim.api.nvim_create_autocmd("FileType", {
    pattern = {"typescript.tsx", "javascript.tsx", "javascript", "typescript"},
    callback = function(_)
        vim.keymap.set("n", "<Leader>s", function()
            vim.cmd("%s/\t/    /g")
        end)
    end
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = {
        "vue.typescript",
        "typescript",
        -- "*.jsx",
        -- "*.tsx",
        "json"},
    callback = function(_)
        vim.opt_local.commentstring = "// %s"
    end
})

-- buffers
vim.keymap.set("", "gn", vim.cmd.bnext)
vim.keymap.set("", "gp", vim.cmd.bprev)
vim.keymap.set("n", "<Leader>b", vim.cmd.buffers)
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

------------- Color Schemes ----------------
vim.opt.termguicolors = true
vim.cmd.colorscheme("heraldish")

