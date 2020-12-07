[ -e ~/.zshrc ] && mv -v ~/.zshrc ~/.zshrc_bkp
ln -s $(readlink -f .zshrc) ~/.zshrc
cp .local_zshrc ~/ -v
ln -s $(readlink -f aliasrc.sh ) ~/aliasrc.sh
