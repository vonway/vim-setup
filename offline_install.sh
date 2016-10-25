#/bin/bash

if [ -f "~/.vimrc" ]; then
 mv ~/.vimrc ~/.vimrc.bak
fi
cp ./vimrc ~/.vimrc

if [ ! -d "~/.vim" ];then
 mkdir -p ~/.vim/view
fi

cp -rf vim_offline/* ~/.vim



