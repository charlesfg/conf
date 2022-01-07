# Configurações do Git locais

git config --global user.email "charles.fg@gmail.com"
git config --global user.name  "Charles Goncalves"

git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.br branch
git config --global alias.hist 'log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short'
git config --global alias.type 'cat-file -t'
git config --global alias.dump 'cat-file -p'

git config --global core.autocrlf input

# If cygwin : http://stackoverflow.com/questions/2835775/msysgit-bash-is-horrendously-slow-in-windows-7
git config --global core.preloadindex true
git config --global core.fscache true
git config --global gc.auto 256


# Setting cache for credentials
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=900000'
git config --global core.editor "vim"


git config --global mergetool.kdiff3NoAuto.cmd "kdiff3 --L1 \"\$MERGED (Base)\" --L2 \"\$MERGED (Local)\" --L3 \"\$MERGED (Remote)\" -o \"\$MERGED\" \"\$BASE\" \"\$LOCAL\" \"\$REMOTE\""

# Add this is the status on zsh for a repo is taking to much time
# from https://stackoverflow.com/questions/12765344/oh-my-zsh-slow-but-only-for-certain-git-repo
# git config --add oh-my-zsh.hide-dirty 1 
