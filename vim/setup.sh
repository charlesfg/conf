vim --version
sudo apt install build-essential python3-dev gcc python-dev cmake3
# in newer then ubuntu 14.04
# sudo apt install cmake 
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update && sudo apt install vim
sudo apt install vim ctags vim-doc vim-scripts cscope gnome-icon-theme indent
vim --version



echo "Install Plugger"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Copying .vimrc"
cp -v .vimrc ~/


echo "Open vim and install the plugins with 'PlugInstall'"
read -p "Are you sure? " -n 1 -r
vim

echo "Install the YCM with support to clang bidings" 
cd ~/.vim/plugged/YouCompleteMe/
./install.py --clangd-completer

