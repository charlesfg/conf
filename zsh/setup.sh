#!/bin/bash -x
function bkp_home_file(){
    TARGET_FILE=$1
    [ -e ~/${TARGET_FILE} ] && mv -v ~/${TARGET_FILE} ~/${TARGET_FILE}_bkp
}

function link_to_home(){
    local f=$1
    shift
    bkp_home_file $f
    ln -s $(readlink -f ${f}) ~/${f}
}

link_to_home .zshrc
cp .local_zshrc ~/ -v
link_to_home aliasrc.sh


