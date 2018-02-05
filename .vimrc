let mapleader=","
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'junegunn/fzf.vim'
Plugin 'tpope/vim-repeat'
Plugin 'epeli/slimux'
" assumes git installed fzf
set rtp+=~/.fzf
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
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
nmap <C-n> :NERDTreeToggle<CR>
map <Leader>y "*y
map <Leader>p "*p
imap <Leader>s yss 
vmap <Leader>s :SlimuxREPLSendSelection<CR> 
map <Leader>o o<Esc>
map <Leader>O O<Esc>
map <Leader>a <esc>ggVG<CR>
map <Leader>w :w<CR>
map <Leader>W :s/\v(.{80}\,)/\1\r/g "wrap commas
imap <c-x><c-f> <plug>(fzf-complete-path)


" #syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }

" ctrlp
let g:ctrlp_show_hidden = 1

" general
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
syntax on
set smartindent
set autoindent                             " Keep the indent when creating a new line
set shiftwidth=4
set expandtab
set listchars=trail:.,tab:▸\ ,eol:¬        " Change the invisible characters
set ttyfast                                " More smooth screen redrawing
set ruler                                  " Show ruler
set linespace=2                            " Spacing between lines
set noswapfile                             " Disable creation of *.swp files
set autoread                               " Automatically reload externally modified files when clean
set autowriteall                           " Automatically write modified files
set spelllang=en_au                        " Set default spelling language to English (Australia)
set shortmess+=I                           " Disable splash screen
set noequalalways                          " Don't equalize when opening/closing windows

" Searching
set ignorecase                             " Ignore case by default when searching
set smartcase                              " Switch to case sensitive mode if needle contains uppercase characters

" Moving around / editing
set nostartofline                          " Avoid moving cursor to BOL when jumping around
set scrolloff=3                            " Keep 3 context lines above and below the cursor
set backspace=2                            " Allow backspacing over autoindent, EOL, and BOL
set showmatch                              " Briefly jump to a paren once it's balanced
set matchtime=2                            " (for only .2 seconds).

:set number relativenumber
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

" auto commands
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
" Makefile
autocmd FileType make set noexpandtab
" Enable spell check by default for git commits
autocmd FileType gitcommit set spell
" strip trailing white space
autocmd BufWritePre *.py :%s/\s\+$//e
" auto save
autocmd FocusLost * nested silent! wall


" python jedi don't show popup
autocmd FileType python setlocal completeopt-=preview


if has("gui_running") || &t_Co == 88 || &t_Co == 256
  :colorscheme hybrid
end
