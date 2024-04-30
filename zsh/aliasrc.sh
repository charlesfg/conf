function git_merge_d() {		
	ACTUAL_BRANCH=$(git branch | grep  "^\*" | cut -d" " -f2)
	DEVELOP_B=$(git config gitflow.branch.develop)
	set -x
	git checkout $DEVELOP_B
	if [[ $? == 0 ]];
	then 
		git pull
		git checkout $ACTUAL_BRANCH
		git merge $DEVELOP_B
	fi
	set +x
}


function git_prune(){
	DEVELOP_B=$(git config gitflow.branch.develop)
	MASTER_B=$(git config gitflow.branch.master)
	set -x
	git branch --merged | grep -v "\*" | grep -Ev "(\*|$DEVELOP_B|$MASTER_B|master|develop|staging)" | xargs -n 1 git branch -d

}

comp() {
    # Strip the .c extension to get the base name
    local base="${1%.c}"
    
    # Compile the file with -o option to specify the output executable name
    gcc -Wall -Werror -g "$1" -o "$base" && ./"$base"
}


# Git 
alias gitmt="git mergetool -t kdiff3NoAuto"
alias gitup="git_merge_d"
alias gitprune="git_prune"



# sys admin
alias tdu='for i in `ls`;do du -hs $i;done'
alias du1='du -h --max-depth=1 | sort -hr'
alias now='date +"%Y%m%d%H%M%S"'
alias genPass='< /dev/urandom tr -dc A-Za-z0-9%#@ | head -c15 ; echo ""'
# avoid deleting or updating all rows, demands the where or limit
alias mysql='mysql --safe-updates'
alias top10f="sudo find / -mount -type f -ls | sort -rnk7 | head -10 | awk '{printf \"%d MB\t%s\n\",(\$7/1024)/1024,\$NF}'"

#network
alias myip='dig +short myip.opendns.com @resolver1.opendns.com'


# Misc
alias rb='rm -f *~'
alias iconv_lu='iconv -flatin1 -tutf8'
alias iconv_ul='iconv -futf8 -tlatin1'


# Anilab
alias anilab_web='ssh anilab1@ftp.anilab.net'



# Phd
#alias oxum='ssh ubuntu@200.131.6.113'
alias oxum='ssh ubuntu@150.164.203.68'
alias drive='ssh root@150.164.203.70'
alias vpnOxum='sudo openvpn ~/Dropbox/Phd\ Portugal/oxum/pfsense-UDP4-1194-charles-config.ovpn'
alias cefetvirt='ssh charles@200.131.4.34'
alias cefet='ssh charles@200.131.4.37'
#alias cefet='ssh charles@200.131.4.3'
alias kvmmac="dd if=/dev/urandom bs=512 count=1 2>/dev/null | md5sum | sed 's/^\(..\)\(..\)\(..\).*$/52:54:00:\1:\2:\3/'"
alias decript="python ~/Dropbox/scripts/python/encryptDecrypt/encryptDecrypt.py -k rrRU8K4#hq9sa4qu "
alias restart_sound="pulseaudio -k && sudo alsa force-reload"
alias expoxum="ssh ubuntu@200.131.6.113 cat /var/tpcv/experiment.cfg"
alias cfgvm='ssh ubuntu@10.3.4.36'
#alias cfgvm='ssh ubuntu@10.3.4.11'
alias cfgtest='ssh charles@10.3.2.142'
alias xen='ssh charles@10.3.2.56'
alias xen2='ssh xen@10.3.2.61'

# -cfgxen3.dei.uc.pt com o ip 10.3.2.201
alias xen3='ssh charles@10.3.2.201'
# -cfgxen4.dei.uc.pt com o ip 10.3.2.203
alias xen4='ssh xen@10.3.2.203'
# -cfgxen5.dei.uc.pt com o ip 10.3.2.220
alias xen5='ssh xen@10.3.2.220'
alias gitckp='git commit -a -m "checkpoint $(date)"'
alias xll='sudo xl list'
#alias cvm='ssh -L 2222:localhost:3333 xen@10.3.2.220 -p 22 -t ssh -L 3333:172.16.0.13:22 xen@192.168.1.20 -p 22 -t ssh root@172.16.0.13'
alias cvm='ssh xen@10.3.2.220 -t ssh  xen@192.168.1.20 -t ssh root@172.16.0.13'
alias l1='ssh xen@10.3.2.220 -t ssh xen@192.168.1.20'
alias sysb='ssh xen@10.3.2.220  -t ssh xen@192.168.1.20  -t ssh xen@172.16.0.14'
alias sysc='ssh xen@10.3.2.220  -t ssh xen@192.168.1.22'
