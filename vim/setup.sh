#!/bin/bash -x
function link_to_home(){
    local f=$1
    shift
    ln -s $(readlink -f ${f}) ~/${f}
}

VERSION_OS=$(lsb_release -r -s)

if [[ ${VERSION_OS} == 16.04 ]];
then 
    echo ${VERSION_OS}
    sudo apt install -y  software-properties-common build-essential python3-dev gcc python-dev cmake python-pip
else
    sudo apt install -y  software-properties-common build-essential python3-dev gcc python-dev cmake3 python-pip
fi

vim --version
# in newer then ubuntu 14.04
# sudo apt install cmake 
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update && sudo apt install vim
sudo apt install vim ctags vim-doc vim-scripts cscope gnome-icon-theme indent
vim --version



echo "Install Plugger"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Linking .vimrc"
link_to_home .vimrc

echo "Creating session dir"
mkdir -p ~/.vim/session


echo "Open vim and install the plugins with 'PlugInstall'"
read -p "Opening VIM, press any key " -n 1 -r
vim

echo "Install the YCM with support to clang bidings" 
if [ ! -d ~/.vim/plugged/YouCompleteMe/third_party/ycmd/third_party/clangd/cache/ ];
then
    mkdir -p ~/.vim/plugged/YouCompleteMe/third_party/ycmd/third_party/clangd/cache/
fi
cp -v clangd-9.0.0-x86_64-unknown-linux-gnu.tar.bz2 ~/.vim/plugged/YouCompleteMe/third_party/ycmd/third_party/clangd/cache/
cd ~/.vim/plugged/YouCompleteMe/
./install.py --clangd-completer

echo "Setup the default .ycm_extra_conf.py "
link_to_home .ycm_extra_conf.py
