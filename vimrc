set nocompatible              " be iMproved, required

filetype plugin on
filetype indent on
syntax on
filetype on

let g:solarized_termcolors=256
set hlsearch
syntax enable
set nu
set background=dark
colorscheme solarized
set guifont=Monaco:h13    " OSX
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
set laststatus=2

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

" Comment functions so powerful—no comment necessary.
" /cc comment a line
" /cu undo a comment
" /cA comment after a line
Plugin 'scrooloose/nerdcommenter'
let g:NERDSpaceDelims = 1
let g:NERDRemoveExtraSpaces = 1

"The NERD tree allows you to explore your filesystem and to open files and
"directories
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
map <C-n> :NERDTreeToggle<CR>
" language check
Plugin 'scrooloose/syntastic'
Plugin 'marijnh/tern_for_vim'

" theme
Plugin 'solarized'
Plugin 'altercation/vim-colors-solarized'

" document ================================
Plugin 'vimcn/vimcdoc'
"======================'

Plugin 'Townk/vim-autoclose'

" This project is unmaintained
"" Plugin 'kien/ctrlp.vim'
"===================

" == COMPLETION ==========================================================
Plugin 'msanders/snipmate.vim'
Plugin 'vimcn/snipMate.vim.cnx'
Plugin 'hotoo/snippets'
let g:snippets_dir = '~/.vim/bundle/snippets'
"Plugin 'AutoComplPop'
" Emmet-vim is html extending from Zencoding
Plugin 'mattn/emmet-vim'
" map extend key into ctrl + e
imap <C-e> <C-y>,
nmap <C-e> <C-y>,
" Enable emmet-vim in jsx file & use className 
let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\}
Plugin 'Valloric/YouCompleteMe'
"======================================

" SYNTAX ================================================================={{{
Plugin 'hotoo/vimwiki'
Plugin 'vimcn/vimwiki.vim.cnx'
Plugin 'tpope/vim-markdown'
Plugin 'digitaltoad/vim-jade'
Plugin 'groenewege/vim-less'
Plugin 'kchmck/vim-coffee-script'
"Plugin 'gabrielelana/vim-markdown' " 与 Vimwiki 配合不好。
Plugin 'mxw/vim-jsx'
Plugin 'elzr/vim-json'
Plugin 'velocity.vim'
Plugin 'hotoo/jsgf.vim'
Plugin 'itspriddle/vim-marked'
let g:marked_app = "Marked"
Plugin 'vimcn/node-vimdoc'
Plugin 'kien/ctrlp.vim'
Plugin 'dkprice/vim-easygrep'
Plugin 'pangloss/vim-javascript'
"========================
"
" vim-jsx configuration
let g:jsx_ext_required = 0


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
