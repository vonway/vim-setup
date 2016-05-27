#/bin/bash
rm -rf ~/.vim
mkdir -p ~/.vim/view
rm ~/.vimrc

if [ -f ~/.vimrc.bak ];then 
 mv ~/.vimrc.bak ~/.vimrc
fi

