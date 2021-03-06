set nocompatible              " be iMproved, required

filetype plugin on
set omnifunc=syntaxcomplete#Complete
filetype indent on
syntax on
filetype on

let g:solarized_termcolors=256
set hlsearch
syntax enable
set nu
set fileencoding=utf-8
set guifont=Monaco:h14    " OSX
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
set laststatus=2

" fix the jump issue with fzf and ale https://github.com/junegunn/fzf/issues/1166
set hidden
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Lean & mean status/tabline for vim that's light as air.
" github: https://github.com/vim-airline/vim-airline
" https://github.com/vim-airline/vim-airline-themes for more themes
Plugin 'bling/vim-airline'

Plugin 'octref/RootIgnore'


" fix issue https://github.com/w0rp/ale/issues/1700
set completeopt+=noinsert
" ale configration
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'typescript': ['tslint']
\}
let g:ale_lint_on_text_changed = 'nerver'
let g:ale_completion_enabled = 2
let g:ale_typescript_tslint_use_global = 1
let g:ale_typescript_tsserver_use_global = 1
Plugin 'w0rp/ale'
nmap gd :ALEGoToDefinition<CR>
nmap gr :ALEFindReferences<CR>
nmap <C-B> :ALEFix<CR>

" Plugin 'tpope/vim-repeat'
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

" Comment functions so powerful—no comment necessary.
" /cc comment a line
" /cu undo a comment
" /cA comment after a line
Plugin 'scrooloose/nerdcommenter'
let g:NERDSpaceDelims = 1
let g:NERDRemoveExtraSpaces = 1

"The NERD tree allows you to explore your filesystem and to open files and
"directories
"
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinSize = 30
let g:NERDTreeRespectWildIgnore = 1
" language check 高亮检查
Plugin 'vim-syntastic/syntastic'

Plugin 'leafgarland/typescript-vim'

" highlight
autocmd FileType typescript :set makeprg=tsc
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript
autocmd BufNewFile,BufRead *.tsx setlocal filetype=typescript

autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx
autocmd BufNewFile,BufRead *.js set filetype=javascript.jsx

" themes

" Plugin 'mhartington/oceanic-next'
Plugin 'morhetz/gruvbox'
syntax enable
set background=dark    " Setting dark mode
colorscheme gruvbox

let g:airline_theme ='gruvbox'

" document ================================
Plugin 'vimcn/vimcdoc'
"======================'

" This project is unmaintained
"" Plugin 'kien/ctrlp.vim'
"===================

" == COMPLETION ==========================================================
Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'
let g:UltiSnipsSearchPaths=['~/.vim/bundle/vim-snippets/UltiSnips']
Plugin 'hotoo/snippets'
"Plugin 'AutoComplPop'
" Emmet-vim is html extending from Zencoding
Plugin 'mattn/emmet-vim'
" map extend key into ctrl + e
imap <C-e> <C-y>,
nmap <C-e> <C-y>,
" Enable emmet-vim in jsx file & use className 
"
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\      'attribute_name': {'for': 'htmlFor', 'class': 'className'},
\  },
\}

" Plugin 'Valloric/YouCompleteMe'
Plugin 'ervandew/supertab'
"======================================
"
" Plugin 'ryanoasis/vim-devicons'

" SYNTAX ================================================================={{{
" Plugin 'hotoo/vimwiki'
" Plugin 'vimcn/vimwiki.vim.cnx'
Plugin 'digitaltoad/vim-jade'
Plugin 'groenewege/vim-less'
Plugin 'kchmck/vim-coffee-script'
" Plugin 'elzr/vim-json'
Plugin 'velocity.vim'
" Plugin 'itspriddle/vim-marked'
" let g:marked_app = "Marked"
Plugin 'kien/ctrlp.vim'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_working_path_mode = 'ra'
" Plugin 'dkprice/vim-easygrep'
Plugin 'pangloss/vim-javascript', { 'for': ['javascript.jsx', 'javascript'] }
" vim-jsx configuration
let g:jsx_ext_required = 0
let g:jsx_pragma_required = 1
Plugin 'mxw/vim-jsx', { 'for': ['javascript.jsx', 'javascript'] }
" make YCM compatible with UltiSnips (using supertab)
" let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

Plugin 'posva/vim-vue'
let g:vue_disable_pre_processors = 1

" for wepy
au BufRead,BufNewFile *.wpy setlocal filetype=vue.html.javascript.css

" for vue
au BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

Plugin 'tpope/vim-surround'
Plugin 'jparise/vim-graphql'
Plugin 'junegunn/fzf', { 'do': './install --all' }
Plugin 'junegunn/fzf.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" configure indent-guides
set ts=2 sw=2 et

:set spell spelllang=en_us

" Syntastic
highlight SyntasticErrorSign guifg=red guibg=#555555
highlight SyntasticWarningSign guifg=yellow guibg=#555555
highlight SignColumn guibg=#555555

set backspace=indent,eol,start

" define a command Find for super vimgrep
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case  --hidden --follow --glob "!.git/*" --glob "!node_modules/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
