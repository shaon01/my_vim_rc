#!/bin/sh
#installing vim 
echo "Installing vim "
apt-get install vim
#installing vim-nox for ycm
echo "Installing VIM-nox"
apt-get install vim-nox -y
#clone vundle for package mangement 
echo "cloning vundle for VIM"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
#copy the bashrc as vim rc
echo "Copying .vimrc as default vimrc"
cp .vimrc ~/.vimrc
