alias partch="ssh -X u5388374@partch.anu.edu.au"
alias ls="ls -Gh"
alias l="ls -la"
alias ll="ls -l"
alias rm="rm -d"
alias mkdir="mkdir -p"
alias cp="cp -rv"
alias jj="java -jar"
alias rpn="jj ~/Documents/anu/comp2300/rpeanut/rPeANUt2.3.jar"
alias ltsa="jj ~/Documents/anu/comp2310/ltsatool/ltsa.jar"
alias st="speedtest-cli"
alias js="jekyll server"
alias py="python -i"
alias py3="python3 -i"

# Jump back n directories at a time
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'

#git
alias ga="git add"
alias gc="git commit"
alias gch="git checkout"
alias gd="git diff"
alias gl="git log"
alias gp="git push"
alias gs="git status"

#hg
alias hga="hg add"
alias hgc="hg commit"
alias hgp="hg push"

export HISTCONTROL=ignoredups:erasedups # no duplicate entries in history

#vim bindings in terminal
set -o vi

#set default editor
export EDITOR=nvim

# make and change directory
function mkcd() {
    mkdir -p "$@" && eval cd "\"\$$#\""
}

#better ping function
function P() {
    if [ -z "$1" ] #check if argument is empty string
    then
        ping google.com
    else
        ping "$1"
    fi
}

# change git user
function gu() {
    if [ "$1" = "va" ]
    then
        git config user.name "Vince Au"
        git config user.email "vinceau@users.noreply.github.com"
    elif [ "$1" = "lv" ]
    then
        git config user.name "little-vince"
        git config user.email "littlevince09@gmail.com"
    else
        echo "Incorrect input. Expecting 'va' or 'lv'"
    fi
}

# open vimr from terminal
function vimr() {
    open -a VimR.app "$@"
}

# case insensitive file find function - filenames
function f() {
    find . -type f -iname "*$@*"
}

# case insensitive content find function - file content
function F() {
    grep -r "$@" .
}

function go() {
    gcc $@.c -Wall -o $@
}

function pd() {
    if [ -z "$2" ] #check if second argument is empty
    then
        pandoc "$1".md -o "$1".pdf && open "$1".pdf
    elif [ "$2" == "rst" ]
    then
        pandoc "$1".md --from=markdown --to=rst -o "$1".rst
    else
        pandoc "$1".md -o "$1"."$2" && open "$1"."$2"
    fi
}

#bind '"\t":menu-complete' #bind tab to cycle through options
#bind '"\e[Z":"\e-1\C-i"' #bind shift+tab to cycle backwards
