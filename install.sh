cp -r colors ~/.vim/ 
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp .vimrc ~/.vimrc
cp .tmux.conf ~/.tmux.conf
mkdir ~/.vim/undodir 
vim +PluginInstall +qall
