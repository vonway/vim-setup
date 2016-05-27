#/bin/bash
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
if [ -f "~/.vimrc" ]; then
 mv ~/.vimrc ~/.vimrc.bak
 cp ./vimrc ~/.vimrc
fi

if [ ! -d "~/.vim" ];then
 mkdir -p ~/.vim/view
fi

vim +PluginInstall +qall
