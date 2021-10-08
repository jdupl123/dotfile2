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
"Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-rhubarb'
Plugin 'davidhalter/jedi-vim'
Plugin 'vim-airline/vim-airline'
" assumes git installed fzf
Plugin 'junegunn/fzf.vim'
Plugin 'ervandew/supertab'
"Plugin 'tell-k/vim-autopep8'
"Plugin 'alfredodeza/pytest.vim'
"Plugin 'dkprice/vim-easygrep'
Plugin 'airblade/vim-gitgutter'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'slim-template/vim-slim.git'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'hashivim/vim-terraform'
Plugin 'fatih/vim-go'
Plugin 'elzr/vim-json'

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

function! s:p(bang, ...)
  let preview_window = get(g:, 'fzf_preview_window', a:bang && &columns >= 80 || &columns >= 120 ? 'right': '')
  if len(preview_window)
    return call('fzf#vim#with_preview', add(copy(a:000), preview_window))
  endif
  return {}
endfunction

"https://stackoverflow.com/questions/1533565/how-to-get-visually-selected-text-in-vimscript
function! s:get_visual_selection()
    " Why is this not a built-in Vim script function?!
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    let lines = getline(line_start, line_end)
    if len(lines) == 0
        return ''
    endif
    let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
    let lines[0] = lines[0][column_start - 1:]
    return join(lines, "\n")
endfunction


command!      -bang -nargs=* Agw                        call fzf#vim#ag(expand("<cword>"), s:p(<bang>0), <bang>0)
command!      -bang -nargs=* Agv                        call fzf#vim#ag(s:get_visual_selection(), s:p(<bang>0), <bang>0)

nmap <C-n> :NERDTreeToggle<CR>
map <Leader>y "*y
map <Leader>d "*ygvd
map <Leader>p "*p
imap <Leader>s yss 
map <Leader>o o<Esc>
map <Leader>O O<Esc>
map <Leader>a <esc>ggVG
map <Leader>w :w<CR>
map <Leader>W :s/\v(.{80}\,)/\1\r/g "wrap commas
imap <c-x><c-f> <plug>(fzf-complete-path)
inoremap <expr> <c-x><c-j> fzf#complete("find ~/ -path '*/\.*' -prune -o -print \| sed '1d;s:^..::'")
nmap =j :%!python -m json.tool<CR>
nnoremap <Leader>* :<C-u>Agw<CR>
vnoremap <Leader>* :<C-u>Agv<CR>
nnoremap <Leader>h :History:<CR>
nnoremap <c-o> :Files<CR>
nnoremap <c-p> :GFiles<CR>
nnoremap <Leader>c :Gwrite<CR>:Gcommit<CR>
nnoremap <Leader>b :Gblame<CR>

" vim-go
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>q :cclose<CR>
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)

let g:go_fmt_command = "goimports"

" Pytest
"nmap <silent><Leader>f <Esc>:Pytest file<CR>
"nmap <silent><Leader>c <Esc>:Pytest class<CR>
"nmap <silent><Leader>m <Esc>:Pytest method<CR>

" navigation
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" settings
set undofile " Maintain undo history between sessions
set undodir=~/.vim/undodir


" #syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
"let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
"let g:syntastic_python_checkers = ['mypy --ignore-missing-imports', 'flake8']
"let g:syntastic_javascript_checkers=['eslint']

" general
set history=10000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set timeoutlen=1000 ttimeoutlen=0
syntax on
set smartindent
set autoindent                             " Keep the indent when creating a new line
set shiftwidth=4
set expandtab
set list!
set listchars=trail:.,tab:▸\ ,eol:¬,space:.       " Change the invisible characters
set ttyfast                                " More smooth screen redrawing
set lazyredraw
set ruler                                  " Show ruler
set linespace=2                            " Spacing between lines
set noswapfile                             " Disable creation of *.swp files
set autoread                               " Automatically reload externally modified files when clean
set autowriteall                           " Automatically write modified files
set spelllang=en_au                        " Set default spelling language to English (Australia)
set shortmess+=I                           " Disable splash screen
set noequalalways                          " Don't equalize when opening/closing windows
set synmaxcol=4096
set encoding=utf-8

" Searching
set ignorecase                             " Ignore case by default when searching
set smartcase                              " Switch to case sensitive mode if needle contains uppercase characters
set incsearch

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

autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2
autocmd FileType scss setlocal shiftwidth=2 tabstop=2

" terraform
let g:terraform_align = 1

" python jedi don't show popup
let g:jedi#popup_on_dot = 0

"autocmd FileType python setlocal completeopt-=preview
autocmd Filetype go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

if has("gui_running") || &t_Co == 88 || &t_Co == 256
  :colorscheme hybrid
end
