let g:python3_host_prog = "/Users/jdp/.pyenv/versions/py3nvim/bin/python"
let g:loaded_python_provider = 0
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

call plug#begin('~/.vim/plugged')
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'mechatroner/rainbow_csv'
Plug 'vim-scripts/SearchComplete'
"Plug 'junegunn/fzf', run = fn['fzf#install']
"Plug 'junegunn/fzf.vim'
Plug 'ojroques/nvim-lspfuzzy'
call plug#end()

lua require("lsp")
lua require("appearance")
"lua require('treesitter')
