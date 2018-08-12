
"   ██╗███╗   ██╗██╗████████╗██╗   ██╗██╗███╗   ███╗
"   ██║████╗  ██║██║╚══██╔══╝██║   ██║██║████╗ ████║
"   ██║██╔██╗ ██║██║   ██║   ██║   ██║██║██╔████╔██║
"   ██║██║╚██╗██║██║   ██║   ╚██╗ ██╔╝██║██║╚██╔╝██║
"   ██║██║ ╚████║██║   ██║██╗ ╚████╔╝ ██║██║ ╚═╝ ██║
"   ╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
                                                
set nocompatible              " be iMproved, required

" Plugins {{{

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')
Plug 'junegunn/vim-plug'

" Code completion {{{
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/echodoc.vim'
Plug 'Shougo/neco-vim'
Plug 'Shougo/neco-syntax'
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
Plug 'zchee/deoplete-clang'
Plug 'zchee/deoplete-zsh'
Plug 'wellle/tmux-complete.vim'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'lervag/vimtex'
Plug 'lionawurscht/deoplete-biblatex'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Plug 'zchee/deoplete-jedi'
" Plug 'ncm2/ncm2'
" Plug 'roxma/nvim-yarp'
" Plug 'neoclide/coc.nvim', { 'do': 'yarn install' }
" Plug 'chemzqm/jsonc.vim'
" }}}

" Syntax and Folds {{{
Plug 'plasticboy/vim-markdown'
Plug 'chrisbra/vim-zsh'
Plug 'chrisbra/csv.vim', { 'on': 'CSVInit' }
Plug 'vim-python/python-syntax'
Plug 'tmhedberg/SimpylFold'
Plug 'KeitaNakamura/highlighter.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Konfekt/FastFold'
" Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
" Plug 'jaxbot/semantic-highlight.vim'
" }}}

" File, Buffer Browsers {{{
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'ivalkeen/nerdtree-execute'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'francoiscabrol/ranger.vim', {'on': 'Ranger'}
Plug 'mileszs/ack.vim'
Plug 'jlanzarotta/bufexplorer'
Plug 'junegunn/fzf', { 'dir': '~/.fzf' }
Plug 'junegunn/fzf.vim'
" }}}

" Colors {{{
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'RRethy/vim-illuminate'
Plug 'morhetz/gruvbox'
" Plug 'andreypopp/vim-colors-plain'
" Plug 'lifepillar/vim-solarized8'
" Plug 'ajmwagar/vim-deus'
" Plug 'flazz/vim-colorschemes'
" Plug 'romainl/flattened'
" Plug 'nightsense/stellarized'
" Plug 'guns/xterm-color-table.vim'
" Plug 'nightsense/vrunchbang'
" Plug 'nightsense/seagrey'
" }}}

" Utils {{{  
Plug 'w0rp/ale'
Plug 'joonty/vdebug', {'on': 'VdebugStart'}
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'}
Plug 'simnalamburt/vim-mundo', {'on': 'MundoToggle'}
Plug 'vim-utils/vim-man', {'on': 'Man'}
Plug 'chrisbra/vim-diff-enhanced'
Plug 'kassio/neoterm'
Plug 'moll/vim-bbye'
Plug 'lambdalisue/suda.vim'
Plug 'wesQ3/vim-windowswap'
Plug 'skywind3000/vim-preview', {'on': 'Preview'}
Plug 'tommasolaurenzi/nvim-historian', {'branch': 'devel'}
Plug 'itchyny/calendar.vim', {'on': 'Calendar'}
" Plug 'mhinz/vim-signify'
" }}}

" Editing Tools {{{
Plug 'godlygeek/tabular', {'on': 'Tabularize'}
Plug 'dhruvasagar/vim-table-mode', {'on': 'TableModeToggle'}
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'raimondi/delimitmate'
Plug 'wellle/targets.vim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-repeat'
Plug 'chrisbra/NrrwRgn'
" }}}

" Tmux {{{
Plug 'benmills/vimux'
Plug 'tmux-plugins/vim-tmux'
Plug 'tmux-plugins/vim-tmux-focus-events'
" }}}

call plug#end()
" }}}

" Plugin Options {{{

" Code completion {{{
" Deoplete {{{
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('min_pattern_length', 2)
if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#input_patterns.tex = g:vimtex#re#deoplete
let g:deoplete#sources#clang#libclang_path = "/opt/local/libexec/llvm-6.0/lib/libclang.dylib"
let g:deoplete#sources#clang#clang_header = "/opt/local/libexec/llvm-6.0/lib/c++/v1"

call deoplete#custom#source('omni',          'mark', '')
call deoplete#custom#source('LanguageClient','mark', '')
call deoplete#custom#source('zsh',           'mark', '')
call deoplete#custom#source('clang',         'mark', '')
call deoplete#custom#source('julia',         'mark', '')
call deoplete#custom#source('jedi',          'mark', '')
call deoplete#custom#source('vim',           'mark', '')
call deoplete#custom#source('ultisnips',     'mark', '')
call deoplete#custom#source('tag',           'mark', '炙')
call deoplete#custom#source('around',        'mark', '↻')
call deoplete#custom#source('buffer',        'mark', 'ℬ')
call deoplete#custom#source('tmux-complete', 'mark', '侀')
call deoplete#custom#source('syntax',        'mark', '')
call deoplete#custom#source('member',        'mark', '.')
call deoplete#custom#source('file',          'mark', '')
call deoplete#custom#source('dictionary',    'mark', '')
call deoplete#custom#source('biblatex',      'mark', '"..."')
call deoplete#custom#source('include',       'mark', '#')
"                  舘侀炙    ⌾
" }}}

" Language Client {{{
let g:LanguageClient_autoStart = 1
let g:LanguageClient_waitOutputTimeout = 500
let g:LanguageClient_diagnosticsEnable = 0
let g:LanguageClient_serverCommands = {
        \ 'sh': ['bash-language-server','start'],
        \ 'r': ['R', '--quiet', '--slave', '-e', 'languageserver::run()'],
        \ 'c': ['cquery', '--language-server'],
        \ 'python': ['python', '-m', 'pyls'],
        \ 'julia': ['/Applications/Julia-0.6.app/Contents/Resources/julia/bin/julia', '--startup-file=no', '--history-file=no', '-e', '
        \       using LanguageServer;
        \       server = LanguageServer.LanguageServerInstance(STDIN, STDOUT, false);
        \       server.runlinter = true;
        \       run(server);
        \   ']
        \}
" }}}

let g:tmuxcomplete#trigger = ''

let g:default_julia_version = '0.6.4'

let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_view_method = 'skim'

let g:echodoc_enable_at_startup = 1

let g:UltiSnipsExpandTrigger = '<c-j>'

" }}}

" Syntax and Folds {{{
let g:python_highlight_all = 1
let g:python_highlight_file_headers_as_comments = 1
let g:python_highlight_space_errors = 0

let g:fastfold_fold_command_suffixes = ['x', 'X', 'a', 'A', 'o', 'O', 'c', 'C', 'r', 'R', 'm', 'M', 'i', 'n', 'N']
" let g:tex_fold_enabled = 1
" let g:vimsyn_folding ='af'
" let g:sh_fold_enabled = 7
" let g:markdown_folding = 0

" let g:semshi#error_sign = 0
" let g:semshi#always_update_all_highlights = 1
" let g:semshi#simplify_markup = 0
" }}}

" File, Buffer, Browsers {{{
call denite#custom#var('file/rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
call denite#custom#map('insert', '<C-n>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-p>', '<denite:move_to_previous_line>', 'noremap')

let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1

let g:ackprg = 'ag --vimgrep'

let g:ctrlp_map = '<leader>f'
let g:ctrlp_cmd = 'CtrlPMixed'

let g:fzf_tags_command = '/opt/bin/ctags -R'

let g:ranger_map_keys = 0
" }}}

" Colors {{{
let g:gruvbox_italic = 1
let g:gruvbox_sign_column = "bg0"

let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#tab_nr_type = 2
let g:airline#extensions#csv#column_display = 'Name'
let g:airline_powerline_fonts = 1
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline_theme = "gruvbox"
" onedark molokai

let g:limelight_default_coefficient = 0.7
let g:limelight_priority = -1

let g:Illuminate_ftblacklist = ['nerdtree', 'ctrlp', 'Mundo']
let g:Illuminate_delay = 250
" }}}

" Utils {{{
let g:gutentags_ctags_exclude = [".mypy_cache"]
let g:gutentags_project_root = ["__init__.py"]

let g:gitgutter_map_keys = 0
let g:gitgutter_override_sign_column_highlight = 0

let g:ale_set_highlights = 1
let g:ale_sign_error = '' "  ⤫
let g:ale_sign_warning = '' " ⚠    
let g:ale_lint_on_text_changed = "always"
let g:ale_fixers = { 'python': 'autopep8', 'sh': 'shfmt'}
let g:ale_python_mypy_options = "--ignore-missing-imports"
let g:ale_python_pylint_options = "--disable=C"
let g:ale_python_flake8_options = "--ignore=E221,E241,E201"
let g:ale_linter_aliases = { 'zsh': 'sh' }
let g:ale_linters = { 'zsh': ['language_server', 'shell', 'shellcheck'] }

let g:suda#prefix = 'sudo:'
call suda#init('sudo:*,sudo:*/*')

let g:historian_registers = ['+', '"']

let g:windowswap_map_keys = 0

" Tagbar {{{
let g:tagbar_ctags_bin = "/opt/bin/ctags"
let g:tagbar_type_markdown= {
    \ 'ctagstype': 'markdown',
    \ 'ctagsbin' : '/Users/laurenzi/.vim/mystuff/markdown2ctags/markdown2ctags.py',
    \ 'ctagsargs' : '-f - --sort=yes',
    \ 'kinds' : [
        \ 's:sections',
        \ 'i:images'
    \ ],
    \ 'sro' : '|',
    \ 'kind2scope' : {
        \ 's' : 'section',
    \ },
    \ 'sort': 0,
\ }
let g:tagbar_type_PDB= {
    \ 'ctagstype': 'PDB',
    \ 'ctagsargs' : '-f - --sort=yes',
    \ 'kinds' : [
        \ 'a:atom',
    \ ],
\ }
" }}}
" }}}

" Editing Tools {{{
let g:delimitMate_expand_inside_quotes = 1
let g:delimitMate_jump_expansion = 1
let g:delimitMate_expand_cr = 2
let g:delimitMate_expand_space = 1
let g:delimitMate_nesting_quotes = ['"','`']
" }}}

" }}}

" Functions {{{

function! VimuxSlime()
  let l:text = @v
  let l:text = substitute(l:text, "\n$", "", "")
  call VimuxSendText(l:text)
  call VimuxSendKeys("Enter")
endfunction

" }}}

" Commands {{{

command! -nargs=1 -complete=file   SudoEdit  edit  sudo:<args>
command! -nargs=1 -complete=buffer SudoWrite write sudo:<args>

command! CD lcd %:p:h

command! LCMenu call LanguageClient_contextMenu()

augroup MyAutoCommands
    autocmd!
    
    " Science
    autocmd BufNewFile,BufRead *.pdb        set filetype=PDB
    autocmd BufNewFile,BufRead *.aln        set filetype=clustal
    autocmd BufNewFile,BufRead *.fasta,*.fa set filetype=fasta

    " Distraction Free
    autocmd User GoyoEnter Limelight
    autocmd User GoyoLeave Limelight!
    
    " Competions Preview
    autocmd CompleteDone * silent if pumvisible() == 0 && bufname("%") != "[Command Line]" | pclose | endif
    
    " Set SpellCheck
    " autocmd FileType latex,tex,markdown,txt setlocal spell

    " Line Wrapping
    autocmd FileType latex,tex,markdown,txt setlocal wrap 

    " DelimitMate
    autocmd FileType python   let b:delimitMate_nesting_quotes = ['"']
    autocmd FileType markdown let b:delimitMate_nesting_quotes = ['`']

    " syntax filetype
    autocmd BufNewFile,BufRead *.coffee set filetype=coffee

    " Delete Hidden [No Name] buffers
    " autocmd BufHidden * if expand("<afile>") == "" && &modified == 0 | bdel | endif

augroup END

" }}}

" Settings {{{
let g:python3_host_prog = "/Users/laurenzi/venv/bin/python"

syntax on                " enable syntax highlighting
set termguicolors        " enable gui colors for terminal
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum" 
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
                         " Failsafe to enable True Colors in tmux; is it really required?
set encoding=utf-8       " enconding
set guifont=Menlo\ Regular\ Nerd\ Font\ Complete:h12 " select font for gui
set modeline             " enable vim modelines
set mouse=a              " enable mouse for all modes
set noeb vb t_vb=		 " remove all errors; 'set visualbell noeb' to revert
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set nobackup             " no backup file 
set noswapfile           " don't write .swp files
set undofile             " set permanent undo (default `undodir = ~/.local/share/nvim/undo/` 
set nowrap               " don't wrap lines
set tabstop=4            " a tab is four spaces
let &shiftwidth=&tabstop " number of spaces to use for autoindenting
set shiftround           " use multiple of shiftwidth when indenting with '<' and '>'
set expandtab            " expand tab to count tabstop n° of spaces
set backspace=indent,eol,start
                         " allow backspacing over everything in insert mode
set autoindent           " always set autoindenting on
set copyindent           " copy the previous indentation on autoindenting
set number               " always show line numbers
set showmatch            " show matching parenthesis with a quick jump
set ignorecase           " ignore case when searching with / or ?
set smartcase            " ignore case if search pattern is all lowercase,
                         "    case-sensitive otherwise
set smarttab             " insert tabs on the start of a line according to
                         "    shiftwidth, not tabstop
set hlsearch             " highlight search terms
set incsearch            " show search matches as you type
set hidden               " allow modified buffers to be hidden 
set wildmode=longest,list:longest,full
set wildmenu             " diplay command completion listing and choice menu
set wildignorecase       " ignore case command completion menu 
set shell=zsh\ --login   " default shell (iteractive)
set shellcmdflag=-c      " default shell command for non interactive invocations
"set clipboard=unnamed   " send yanks to system clipboard (buggy with v-block)
set showcmd              " show key spressed in lower-right corner
set sidescroll=1         " smooth side scrolling
set conceallevel=2       " conceal marked text
" set completeopt="menuone,preview,noinsert,noselect
                         " set the behavior of the completion menu 
set fillchars=vert:┃,fold:\ 
                         " set various fillchars; in this case removes clobbering signs from folds ('\ ')
set inccommand=split     " real time preview of substitution commands
set noshowmode           " Do not show -- MODE -- in cmdline"
set cmdheight=1          " Height of the command line
set updatetime=250       " time required to update CursorHold hook
set shortmess+=c         " remove 'match x of y' echoing line
" }}}

" Colorscheme {{{
colorscheme gruvbox 
set background=dark
" }}}

" Highlights {{{
" transparent bg {{{
" hi Normal guibg=NONE
" hi SignColumn guibg=NONE
" hi VertSplit guibg=NONE
" }}}

" Colorscheme Overrides {{{
hi! link SpecialKey GruvboxBlue
hi! link pythonDot GruvboxRed
"}}}

" Spell {{{
hi clear SpellBad
hi clear SpellCap
hi clear SpellLocal
hi clear SpellRare
" Works well with iTerm2 underline color
hi SpellBad   gui=underline     " guifg=red 
hi SpellLocal gui=underline     " guifg=yellow
hi SpellCap   gui=underline     " guifg=orange
hi SpellRare  gui=underline     " guifg=darkyellow
" }}}

" ALE {{{
hi ALEInfo                  gui=underline
hi ALEError                 gui=underline
hi ALEWarning               gui=underline
hi ALEStyleError            gui=underline
hi ALEStyleWarning          gui=underline
hi link ALEInfoSign         GruvboxYellow
hi link ALEErrorSign        GruvboxRed
hi link ALEWarningSign      GruvboxOrange
hi link ALEStyleErrorSign   GruvboxAqua
hi link ALEStyleWarningSign GruvboxBlue
" }}}

" Semshi {{{
function! SemshiHighlightGroups() 
    hi! link semshiLocal      GruvboxBlue   
    hi! link semshiGlobal     GruvboxBlueBold
    hi! link semshiImported   GruvboxOrange
    hi! link semshiParameter  GruvboxGreen
    hi! link semshiParameterUnused GruvboxGray  
    hi! link semshiFree       GruvboxAqua   
    hi! link semshiBuiltin    GruvboxOrange 
    hi! link semshiAttribute  GruvboxAqua
    hi! link semshiSelf       GruvboxGray
    hi! link semshiUnresolved GruvboxGray
    hi! link semshiSelected   CursorLine 
endfunction
" autocmd FileType python call SemshiHighlightGroups()
" }}}

" }}}

" Mappings {{{
let mapleader = ","

" fast [e]dit and [s]ourcing .[v]imrc
nnoremap <leader>ev :tabedit $MYVIMRC<CR>
nnoremap <silent><leader>sv :source $MYVIMRC<CR>:noh<CR>

" Tab S-Tab prev/next candidate, CR confirm, BS delete completion,
" C-l refresh/escape delimiters, C-Space invoke completion,
" C-U C-D scroll Up/Down
imap <silent><BS> <C-R>=pumvisible() ? deoplete#smart_close_popup() : ""<CR><Plug>delimitMateBS
imap <expr><CR> pumvisible() ? deoplete#close_popup() : "<Plug>delimitMateCR"
inoremap <expr><Tab> pumvisible() ? "\<C-n>"  : "\<Tab>" 
imap <expr><S-Tab> pumvisible() ? "\<C-p>"  : "<Plug>delimitMateS-Tab"
imap <expr><C-l> pumvisible() ? deoplete#refresh() : "<Plug>delimitMateS-Tab"
inoremap <expr><C-Space> pumvisible() ? deoplete#complete_common_string() : deoplete#manual_complete()
inoremap <expr><C-d> pumvisible() ? "\<PageDown>"  : "\<C-d>" 
inoremap <expr><C-u> pumvisible() ? "\<PageUp>"    : "\<C-u>"

" laguage client [K]doc, [D]efinition, [M]enu, [A]ction, [R]ename, [U]sage, [F]ormat
nnoremap <silent><leader>lck :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent><leader>lcd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent><leader>lcm :call LanguageClient_contextMenu()<CR>
nnoremap <silent><leader>lca :call LanguageClient_textDocument_codeAction()<CR>
nnoremap <silent><leader>lcr :call LanguageClient_textDocument_rename()<CR>
nnoremap <silent><leader>lcu :call LanguageClient_textDocument_references()<CR>
nnoremap <silent><leader>lcf :call LanguageClient_textDocument_formatting()<CR>
nnoremap <silent><leader>lcs :call LanguageClient_textDocument_documentSymbol()<CR>
nnoremap <silent><leader>lcS :call LanguageClient_workspace_symbol()<CR>

" `"'({[<surrounds>]})'"`
vnoremap s( <Esc>`>a)<Esc>`<i(<Esc>
vnoremap s[ <Esc>`>a]<Esc>`<i[<Esc>
vnoremap s{ <Esc>`>a}<Esc>`<i{<Esc>
vnoremap s" <Esc>`>a"<Esc>`<i"<Esc>
vnoremap s' <Esc>`>a'<Esc>`<i'<Esc>
vnoremap s< <Esc>`>a><Esc>`<i<<Esc>
vnoremap s` <Esc>`>a`<Esc>`<i`<Esc>
vnoremap s_ <Esc>`>a_<Esc>`<i_<Esc>
vnoremap s* <Esc>`>a*<Esc>`<i*<Esc>

" remap <Esc> to jk in insert mode
inoremap jk <Esc>
inoremap kj <Esc>

" toggle [r]elative line [n]umbers
nnoremap <silent><leader>rn :set invrelativenumber<CR>

" move around and resize windows
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <m->> <C-W>>
nnoremap <m-<> <C-W><
nnoremap <m-+> <C-W>+
nnoremap <m--> <C-W>-

" WindowSwap
nnoremap <leader>ww :call WindowSwap#EasyWindowSwap()<CR>

" Vertical/Horizontal Scrolling
nnoremap <m-l> zl
nnoremap <m-h> zh
nnoremap <m-j> <C-E>
nnoremap <m-k> <C-Y>

" close window/buffer
nnoremap <leader>Q :bdelete<CR>
nnoremap <leader>bd :Bdelete<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>bo :%bd \| e# \| bd #<CR>

" switch between buffers
nnoremap <silent><m-n> :bnext<CR>
nnoremap <silent><m-p> :bprev<CR>
nnoremap gb :ls<CR>:b 

" [s]ave buffer (normal or insert)
nnoremap <leader>s :w<cr>
" inoremap <leader>s <C-c>:w<cr>

" copy to system clipboard
" vnoremap <C-c> :w !pbcopy<CR><CR>
" noremap <C-v> :r !pbpaste<CR><CR>

" redraw screen and c[l]ear highlights
nnoremap <silent><leader>l :noh<CR>:redraw!<CR>

" [re]load buffer
nnoremap <leader>re :e%<CR>

" [e]dit, [v]ertical, horizontal [s]plit ot [t]ab a [n]ew buffer
nnoremap <leader>en :enew<CR>
nnoremap <leader>vn :rightbelow vnew<CR>
nnoremap <leader>sn :belowright new<CR>
nnoremap <leader>tn :tabnew<cr>

" toggle tagbar
nnoremap <silent><F8> :TagbarToggle<CR>

" [N]ERDTree
nnoremap <silent><leader>nt :NERDTreeToggle<CR>
nnoremap <silent><leader>nf :NERDTreeFind<CR>

" Toggle [Mu]ndo
nnoremap <silent><leader>mu :MundoToggle<CR>

" [F]uzzy [m]ost recent, [b]uffers, [l]ines, [h]elptags
nnoremap <leader>fm :CtrlPMRUFiles<CR>
nnoremap <leader>fb :CtrlPBuffer<CR>
nnoremap <leader>fl :Lines<CR>
nnoremap <leader>fh :Helptags<CR>

"Vimux
vnoremap <leader>vs "vy :call VimuxSlime()<CR>
nnoremap <leader>vp :VimuxPromptCommand<CR>

" Edit or select [R/r]egister
nnoremap <silent><leader>r :reg<CR>:execute 'norm! "' . input("Select register: ") . "p"<CR>
nnoremap <leader>R :<C-U><C-R><C-R>='let @'. v:register .' = '. string(getreg(v:register))<CR><C-F><left>

" Easier increase/decrease indents
vnoremap > >gv
vnoremap < <gv

" select [a]ll
nnoremap <leader>a ggVG

" [y]ank to clipnoard
nnoremap <leader>y "+y
vnoremap <leader>y "+y

" [p]aste from clipboard
nnoremap <leader>p "+p
vnoremap <leader>p "+p

" Qui[c]kFix [O]pen, [N]ext, [P]revious
nnoremap <leader>co :copen<CR>
nnoremap <leader>cn :cnext<CR>
nnoremap <leader>cp :cNext<CR>

" Location[L]ist [O]pen [N]ext [P]revious
nnoremap <leader>lo :lopen<CR>
nnoremap <leader>ln :lnext<CR>
nnoremap <leader>lp :lNext<CR>

" }}}

" vim: ts=2 sw=2 fdm=marker
