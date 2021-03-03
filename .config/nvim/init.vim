let mapleader = "\<Space>"

if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
"Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'junegunn/goyo.vim'
" Git support
Plug 'tpope/vim-fugitive'
"Plug 'jreybert/vimagit'
Plug 'mhinz/vim-signify'                       " Show git diff margin

"Plug 'lukesmithxyz/vimling'
"Plug 'kovetskiy/sxhkd-vim'

Plug 'vimwiki/vimwiki'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-navigator'          " tmux navigation
Plug 'kshenoy/vim-signature'                   " Show marks in margin
" Theme
Plug 'bling/vim-airline'
Plug 'morhetz/gruvbox'
" show color
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
" vifm inside vim
Plug 'vifm/vifm.vim'

Plug 'majutsushi/tagbar'
Plug 'neoclide/coc.nvim', {'branch': 'release'}  " Autocompletion
Plug 'dense-analysis/ale'                        " linters
Plug 'sbdchd/neoformat'                          " auto format
"Plug 'SirVer/ultisnips'
" lisp language family
"Plug 'bhurlow/vim-parinfer'
" clojure
"Plug 'Olical/conjure', {'tag': 'v4.0.0'}
" vlang
Plug 'ollykel/v-vim'
" elixir
Plug 'elixir-lang/vim-elixir'
Plug 'avdgaag/vim-phoenix'
"Plug 'mmorearty/elixir-ctags'
Plug 'mattreduce/vim-mix'
"Plug 'BjRo/vim-extest'

Plug 'vim-erlang/vim-erlang-runtime' " erlang support

Plug 'editorconfig/editorconfig-vim'

call plug#end()

if has("termguicolors")
  set termguicolors
  "let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  "let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
"let g:gruvbox_contrast_dark = 'hard'
"let g:gruvbox_invert_selection='0'
colorscheme gruvbox
set bg=dark
set go=a
set mouse=a
set nohlsearch

set clipboard+=unnamedplus
"set clipboard^=unnamed,unnamedplus

" Override the search highlight color with a combination that is easier to
" read. The default PaperColor is dark green backgroun with black foreground.
"
" Reference:
" - http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim
"highlight Search guibg=DeepPink4 guifg=White ctermbg=53 ctermfg=White

" Toggle background with <leader>bg
map <leader>bg :let &background = (&background == "dark"? "light" : "dark")<CR>

nmap <leader>l :set list!<CR>

" Some basics:
	nnoremap c "_c
	set nocompatible
	filetype plugin on
	syntax on
	set encoding=utf-8
	set number relativenumber
	set autoindent                    " take indent for new line from previous line
	set smartindent                   " enable smart indentation
	set autoread                      " reload file if the file changes on the disk
	"set autowrite                    " write when switching buffers
	"set autowriteall                 " write on :quit
	set colorcolumn=81                " highlight the 80th column as an indicator
	"highlight ColorColumn ctermbg=1 guibg=lightgrey
	set completeopt+=noselect
	set cursorline                    " highlight the current line for the cursor
	set expandtab                     " expands tabs to spaces
	set list                          " show trailing whitespace
	"set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
	"set listchars=eol:¬,tab:→\ ,trail:~,extends:>,precedes:<,space:·
	"set listchars=tab:▸\ ,eol:¬,space:·
	"set listchars=tab:\|\ ,trail:▫
	set listchars=nbsp:␣,tab:\|\ ,trail:▫,eol:¬
	"set listchars=tab:\|\ ,trail:▫,eol:¬,space:·
	"set listchars=tab:\|\ ,trail:▫
  set nospell                       " disable spelling
  set noswapfile                    " disable swapfile usage
	set nowrap
	set noerrorbells                  " No bells!
	set novisualbell                  " I said, no bells!
	set ruler
	set formatoptions=tcqronj         " set vims text formatting options
	set softtabstop=2
	set tabstop=2
	set title                         " let vim set the terminal title
	set updatetime=100                " redraw the status bar often
	set foldmethod=syntax             " syntax folding method
	set foldlevelstart=30             " default foldlevel to 30 folds
	" Use all the memory needed, for maximum performance.
	set maxmempattern=2000000


" Fix some common typos
	cnoreabbrev W! w!
	cnoreabbrev Q! q!
	cnoreabbrev Qall! qall!
	cnoreabbrev Wq wq
	cnoreabbrev Wa wa
	cnoreabbrev wQ wq
	cnoreabbrev WQ wq
	cnoreabbrev W w
	cnoreabbrev Q q
	cnoreabbrev Qall qall
" search
	set incsearch                     " move to match as you type the search query
	set hlsearch                      " disable search result highlighting
	if has('nvim')
	    set inccommand=split          " enables interactive search and replace
	endif

" Enable autocompletion:
	set wildmode=longest,list,full
" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Goyo plugin makes text more readable when writing prose:
	"map <leader>f :Goyo \| set bg=light \| set linebreak<CR>
  map <leader>f :Goyo \| set linebreak<CR>

" Spell-check set to <leader>o, 'o' for 'orthography':
	map <leader>o :setlocal spell! spelllang=en_us<CR>

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
	set splitbelow splitright

" Nerd tree
	map <leader>n :NERDTreeToggle<CR>
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    if has('nvim')
        let NERDTreeBookmarksFile = stdpath('data') . '/NERDTreeBookmarks'
    else
        let NERDTreeBookmarksFile = '~/.vim' . '/NERDTreeBookmarks'
    endif


" Shortcutting split navigation, saving a keypress:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

" Replace ex mode with gq
	map Q gq

" Check file in shellcheck:
	map <leader>s :!clear && shellcheck %<CR>

" Open my bibliography file in split
	map <leader>b :vsp<space>$BIB<CR>
	map <leader>r :vsp<space>$REFER<CR>

" Replace all is aliased to S.
	nnoremap S :%s//g<Left><Left>

" Shooz code documentation
	nnoremap <silent> K :call <SID>show_documentation()<CR>

" Compile document, be it groff/LaTeX/markdown/etc.
	map <leader>c :w! \| !compiler <c-r>%<CR>

" Open corresponding .pdf/.html or preview
	map <leader>p :!opout <c-r>%<CR><CR>

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
	autocmd VimLeave *.tex !texclear %

" Ensure files are read as what I want:
	let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
	map <leader>v :VimwikiIndex
	let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
	autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
	autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
	autocmd BufRead,BufNewFile *.tex set filetype=tex

" Save file as sudo on files that require root permission
	cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Enable Goyo by default for mutt writting
	autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=80
	autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo | set bg=light
	autocmd BufRead,BufNewFile /tmp/neomutt* map ZZ :Goyo\|x!<CR>
	autocmd BufRead,BufNewFile /tmp/neomutt* map ZQ :Goyo\|q!<CR>

" Automatically deletes all trailing whitespace and newlines at end of file on save.
	autocmd BufWritePre * %s/\s\+$//e
	autocmd BufWritepre * %s/\n\+\%$//e

" When shortcut files are updated, renew bash and ranger configs with new material:
	autocmd BufWritePost files,directories !shortcuts
" Run xrdb whenever Xdefaults or Xresources are updated.
	autocmd BufWritePost *Xresources,*Xdefaults !xrdb %
" Update binds when sxhkdrc is updated.
	autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd

" Move wrap lines
	noremap <buffer> <silent> k gk
	noremap <buffer> <silent> j gj

" Move between buffers with Shift + arrow key...
	nnoremap <S-Left> :bprevious<CR>
	nnoremap <S-Right> :bnext<CR>

" FZF plugin
	nnoremap <c-p> :FZF<CR>

" Tabs
	nnoremap <Tab> gt
	nnoremap <S-Tab> gT
	nnoremap <silent> <S-t> :tabnew<CR>
" Opens an edit command with the path of the currently edited file filled in
	noremap <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
" Opens a tab edit command with the path of the currently edited file filled
	noremap <leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>
" auto close ",',[,{,(
  inoremap " ""<left>
  inoremap ' ''<left>
  inoremap ( ()<left>
  inoremap [ []<left>
  inoremap { {}<left>
  inoremap {<CR> {<CR>}<ESC>O
  inoremap {;<CR> {<CR>};<ESC>O
" Turns off highlighting on the bits of code that are changed, so the line that is changed is highlighted but the actual text that has changed stands out on the line and is readable.
if &diff
    highlight! link DiffText MatchParen
endif

"----------------------------------------------
" Plugin: rrethy/vim-hexokinase
"----------------------------------------------
let g:Hexokinase_highlighters = ['backgroundfull']
nmap <leader>h :HexokinaseToggle<CR>

"----------------------------------------------
" Plugin: 'lukesmithxyz/vimling'
"----------------------------------------------
"nm <leader>d :call ToggleDeadKeys()<CR>
"imap <leader>d <esc>:call ToggleDeadKeys()<CR>a
"nm <leader>i :call ToggleIPA()<CR>
"imap <leader>i <esc>:call ToggleIPA()<CR>a
"nm <leader>q :call ToggleProse()<CR>

"----------------------------------------------
" Plugin: scrooloose/nerdtree
"----------------------------------------------
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <F2> :NERDTreeToggle<CR>

"----------------------------------------------
" Plugin: 'majutsushi/tagbar'
"----------------------------------------------
" Add shortcut for toggling the tag bar
nnoremap <F3> :TagbarToggle<CR>

"----------------------------------------------
" Plugin: 'majutsushi/tagbar'
"----------------------------------------------
nnoremap <F4> :Vifm<CR>
"----------------------------------------------
" Plugin: tpope/vim-fugitive
"----------------------------------------------
nmap <leader>gs :G<CR>
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>
"----------------------------------------------
" Plugin: neoclide/coc.nvim
"----------------------------------------------
let g:coc_global_extensions = ['coc-elixir', 'coc-diagnostic', 'coc-rust-analyzer']
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<Tab>" :
            \ coc#refresh()

" use <c-space>for trigger completion
inoremap <silent><expr> <c-space> coc#refresh()
" Use <Tab> and <S-Tab> to navigate the completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Use <cr> to confirm completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Close the preview window when completion is done
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
" Sementic code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)

"----------------------------------------------
" Plugin: dense-analysis/ale
"----------------------------------------------
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'eslint'],
\   'elixir': ['mix_format'],
\}
let g:ale_fix_on_save = 1

"----------------------------------------------
" Plugin: editorconfig/editorconfig-vim
"----------------------------------------------
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

"----------------------------------------------
" Plugin: sbdchd/neoformat
"----------------------------------------------
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END

"----------------------------------------------
" Plugin: ollykel/v-vim
"----------------------------------------------
" Enable automatically formatting file via "v fmt -" before writing buffer.
let g:v_autofmt_bufwritepre = 1

"----------------------------------------------
" nitrogen web framework
"----------------------------------------------
" if this has ft=nitrogen in the modeline
"     tell the system that it's actually an erlang filetype
"     but override the indentation rules such that it expands tabs to spaces,
"     uses tab width of 4 and uses vim's 'smartindent', which works much
"     better indentation rules for nitrogen elements.
if has("autocmd")
	" smartindenting will remove leading spaces when typing in a # as the
	" first character, so you don't want that with nitrogen, since *many,
	" many* lines will match that.  So the inoremap below fixes it
	autocmd Filetype nitrogen inoremap # X#
	autocmd FileType nitrogen set filetype=erlang smartindent autoindent expandtab shiftwidth=4 tabstop=4 softtabstop=4 indentexpr=""
endif
