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
alias cefet='ssh charles@200.131.4.3'
alias kvmmac="dd if=/dev/urandom bs=512 count=1 2>/dev/null | md5sum | sed 's/^\(..\)\(..\)\(..\).*$/52:54:00:\1:\2:\3/'"
alias decript="python ~/Dropbox/scripts/python/encryptDecrypt/encryptDecrypt.py -k rrRU8K4#hq9sa4qu "
alias restart_sound="pulseaudio -k && sudo alsa force-reload"
alias expoxum="ssh ubuntu@200.131.6.113 cat /var/tpcv/experiment.cfg"
alias cfgvm='ssh ubuntu@10.3.4.36'
#alias cfgvm='ssh ubuntu@10.3.4.11'
alias cfgtest='ssh charles@10.3.2.142'
alias xendev='ssh charles@10.3.2.56'
alias xendev2='ssh xen@10.3.2.61'
alias xendev3='ssh charles@10.3.1.181'
alias gitckp='git commit -a -m "checkpoint $(date)"'
