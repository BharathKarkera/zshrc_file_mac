# zshrc_file_mac


```
clear 
echo -e "\e[1m@BharathKarkera Logged in at `date` !! \e[0m\n"
export PATH=$PATH:~/bin
export PS1="%t @Bharath  ~ % "

str1=$(tty)
title='Tab- '${str1:(-3)}
echo -n -e "\033]0;$title\007"
cd ~/bin

fp() { osascript -e 'tell application "Finder"'\
 -e "if (${1-1} <= (count Finder windows)) then"\
 -e "get POSIX path of (target of window ${1-1} as alias)"\
 -e 'else' -e 'get POSIX path of (desktop as alias)'\
 -e 'end if' -e 'end tell'; };\

md() { mkdir -p "$@" && cd "$@"; }

sch() {echo "####################################################################################################################################" ; str1="$2" ; str1=`echo $str1|tr '[a-z]' '[A-Z]'` ; sed -n "/$str1/,/###/p" $1 }

export PS1=$'\e[3m'$'\e[1;93;50m'"%t "$'\e[0m'$'\e[0m'$'\e[1;96;50m@Bharath\e[0m'"  ~ % "

neofetch
alias dt='echo -e "IST: `date`\nGMT: `date -u`\nPST: `TZ=US/Pacific date`"'


col_length=$(tput cols)
col_length=$((col_length-4))

#cd ~/.scripts
#git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
#git clone git://github.com/zsh-users/zsh-completions.git
#git clone https://github.com/zsh-users/zsh-autosuggestions
#git clone https://github.com/zsh-users/zsh-history-substring-search.git

source ~/.scripts/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#source ~/.scripts/zsh-completions/zsh-completions.plugin.zsh
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
ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=15,bold
ZSH_HIGHLIGHT_STYLES[redirection]=fg=232,bold
#https://www.ditig.com/256-colors-cheat-sheet
#https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/highlighters/main/main-highlighter.zsh

alias python3='/usr/local/bin/python3'

gettags() {fetch_for=$1 ; curl -L -s "https://registry.hub.docker.com/v2/repositories/library/$fetch_for/tags?page_size=1024"|jq '."results"[]["name"]' }
```
