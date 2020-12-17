function link_to_home(){
    local f=$1
    shift
    ln -s $(readlink -f ${f}) ~/${f}
}

vim --version
sudo apt install software-properties-common build-essential python3-dev gcc python-dev cmake3 \
    python-pip
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
cd ~/.vim/plugged/YouCompleteMe/
./install.py --clangd-completer

echo "Setup the default .ycm_extra_conf.py "
link_to_home .ycm_extra_conf.py

echo "Installing compile db for generating the database"
pip install compiledb
