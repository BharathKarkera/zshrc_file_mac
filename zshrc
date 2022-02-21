clear 
echo -e "\e[1m@BharathKarkera Logged in at `date` !! \e[0m\n"
say -v Serena "Logged in"
export PATH=$PATH:~/bin
#export PS1=$'\e[3m'$'\e[1;93;50m'"%t "$'\e[0m'$'\e[0m'$'\e[1;96;50m@Bharath\e[0m'"  ~ % "
export PS1="%t @Bharath  ~ % "
export CLICOLOR=1
export LSCOLORS=GxCxGxFxBxDxHxhxhxcxcx
alias ls='ls -Gp'

export GREP_OPTIONS='--color=always'
export GREP_COLOR='1;95;50' 
alias grep='grep -ni'

str1=$(tty)
title='Tab- '${str1:(-3)}
echo -n -e "\033]0;$title\007"
cd /Users/bharathraj.karkera/bin

alias sleepnow='pmset displaysleepnow'

manf() {
man -t "${1}" | open -f -a Preview
}



fp() { osascript -e 'tell application "Finder"'\
 -e "if (${1-1} <= (count Finder windows)) then"\
 -e "get POSIX path of (target of window ${1-1} as alias)"\
 -e 'else' -e 'get POSIX path of (desktop as alias)'\
 -e 'end if' -e 'end tell'; };\



 md() { mkdir -p "$@" && cd "$@"; }

 getsleep() { sudo zsh -c 'systemsetup -getdisplaysleep ; systemsetup -getcomputersleep; pmset -g  | \grep -Ew "displaysleep|sleep" ;'}

setsleep() { ( caffeinate  -t $(( $1 * 60 )) ; say "Sleep time is completed. Now the computer will go to sleep mode in sometime";) }

rstsleep() { sudo systemsetup -setcomputersleep 2 ;sudo systemsetup -setdisplaysleep 2;  getsleep }

#ss() { sed -n "/$1/,/###/{=;p;}" $2|sed 'N;s/\n/ /'}
#si() { cat $2|tr '[A-Z]' '[a-z]'|sed -n "/$1/,/###/{=;p;}"|sed 'N;s/\n/ /' }

#sch() {echo "####################################################################################################################################" ; str1="$1" ; str1=`echo $str1|tr '[a-z]' '[A-Z]'` ; sed -n "/$str1/,/###/p" $2 }
sch() {echo "####################################################################################################################################" ; str1="$2" ; str1=`echo $str1|tr '[a-z]' '[A-Z]'` ; sed -n "/$str1/,/###/p" $1 }

disp() {sed -n "$1,$2{=;p;}" $3|sed 'N;s/\n/ /'}

#ed -s inf <<< $'g/DBA/?###?,/###/p\nq\n'

#cw() {osascript <<EOF
#activate application "Finder"
#tell application "System Events"
#	set visible of processes where name is not "Finder" to false
#end tell
#tell application "Finder" to set collapsed of windows to true
#EOF
#}

cw() { osascript << EOF
tell application "System Events"
	set frontApp to name of first application process whose frontmost is true
	set windowName to name of first window of application process frontApp
end tell

if not frontApp is "Finder" then
	tell application frontApp
		activate
		tell application "System Events"
			keystroke "h" using {command down, option down}
		end tell
		set miniaturized of (windows whose name is not windowName) to true
	end tell
else
	tell application frontApp
		activate
		tell application "System Events"
			keystroke "h" using {command down, option down}
			keystroke "m" using {command down, option down}
			tell process frontApp to click menu item windowName of menu 1 of menu bar item "Window" of menu bar 1
		end tell
	end tell
end if
EOF
}

alias clw='clw 2> /dev/null'
/Users/bharathrajkarkera/bin/clw 2>/dev/null

alias cssh='cssh -l c4993784 Group1'

alias tool='sch inf tool'
alias pylint='/Users/bharathrajkarkera/Library/Python/2.7/bin/pylint'
[[ :$PATH: == *:$HOME/bin:* ]] || PATH=$HOME/bin:$PATH
alias python3='/usr/local/bin/python3'



export PS1=$'\e[3m'$'\e[1;93;50m'"%t "$'\e[0m'$'\e[0m'$'\e[1;96;50m@Bharath\e[0m'"  ~ % "

neofetch
#paste  <(curl -s wttr.in/Kinnigoli|head -7) <(cal) | awk -F'\t' '{ printf("%-31s %s\n", $1, $2) }'
printf "\n"
alias dt='echo -e "IST: `date`\nGMT: `date -u`\nPST: `TZ=US/Pacific date`"'

echo -e "IST: `date`\nGMT: `date -u`\nPST: `TZ=US/Pacific date`" | while read line ; do grep -o . <<<$line | while read a; do sleep 0.01 ; echo -n "${a:- }" ; done; echo ;done

printf "\n"

col_length=$(tput cols)
col_length=$((col_length-4))
#python3 << EOF
#print('-' * $col_length)
#EOF

#printf "\n"

#cd ~/.scripts
#git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
#git clone git://github.com/zsh-users/zsh-completions.git
#git clone https://github.com/zsh-users/zsh-autosuggestions
#git clone https://github.com/zsh-users/zsh-history-substring-search.git

source ~/.scripts/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.scripts/zsh-completions/zsh-completions.plugin.zsh
source ~/.scripts/zsh-autosuggestions/zsh-autosuggestions.zsh 
source ~/.scripts/zsh-history-substring-search/zsh-history-substring-search.zsh

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# The following lines were added by compinstall
zstyle :compinstall filename '/Users/bharathraj.karkera/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall


HISTSIZE=99999
HISTFILESIZE=999999
SAVEHIST=$HISTSIZE
HISTFILE=~/.zsh_history
setopt    appendhistory     #Append history to the history file (no overwriting)
setopt    sharehistory      #Share history across terminals
setopt    incappendhistory  #Immediately append to the history file, not just when a term is killed

export PS1="%t @Bharath  ~ % "

ZSH_HIGHLIGHT_STYLES[precommand]=fg=Navyblue,bold
ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=Navyblue,bold
ZSH_HIGHLIGHT_STYLES[arg0]=fg=Navyblue,bold
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=128,bold
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=128,bold
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]=fg=128,bold
ZSH_HIGHLIGHT_STYLES[global-alias]=fg=202,bold
ZSH_HIGHLIGHT_STYLES[rc-quote]=fg=202,bold
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=202,bold
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=202,bold
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]=fg=202,bold
#https://www.ditig.com/256-colors-cheat-sheet
#https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/highlighters/main/main-highlighter.zsh
