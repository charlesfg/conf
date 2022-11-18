#!/bin/bash -x
function link_to_home(){
    local f=$1
    shift
    ln -s $(readlink -f ${f}) ~/${f}
}


# MAYBE USE THIS ONCE WE HAVE ONE FOR EACH SETUP

# unameOut="$(uname -s)"
# case "${unameOut}" in
#     Linux*)     machine=Linux;;
#     Darwin*)    machine=Mac;;
#     CYGWIN*)    machine=Cygwin;;
#     MINGW*)     machine=MinGw;;
#     *)          machine="UNKNOWN:${unameOut}"
# esac
# echo ${machine}

# brew search software-properties-common build-essential python3-dev gcc python-dev cmake3 python-pip



vim --version
brew remove vim
brew cleanup
# I don't know which one is working
# try this first and then open a new shell terminal, the issue was that vim was still
# resolving for the default  system's vim
brew install vim
# If the above does  not work try running the below and checking if python is there
# brew install vim -vd protobuf
brew install gcc cmake ctags cscope gnu-indent

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
