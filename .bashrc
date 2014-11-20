alias partch="ssh -X u5388374@partch.anu.edu.au"
alias ls="ls -G"
alias p="ping www.google.com"
alias jj="java -jar"
alias rpn="jj ~/Documents/anu/comp2300/rpeanut/rPeANUt2.3.jar"
alias ltsa="jj ~/Documents/anu/comp2310/ltsatool/ltsa.jar"

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

export PATH=$PATH:.
export PATH=$PATH:"/Users/vince/Development/adt-bundle-mac-x86_64-20131030/sdk/platform-tools"
export PATH=$PATH:"/Users/vince/Development/adt-bundle-mac-x86_64-20131030/sdk/tools"
export PATH=$PATH:~/.cabal/bin
export HISTCONTROL=ignoredups:erasedups # no duplicate entries in history

# make and change directory
function mkcd() {
    mkdir -p "$@" && eval cd "\"\$$#\"";
}

# change git user
function gu() {
    if [ "$1" = "va" ];
    then
        git config user.name "Vince Au"
        git config user.email "vinceau@users.noreply.github.com"
    elif [ "$1" = "lv" ];
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

# case insensitive find function
function f() {
    find . -type f -iname "*$@*"
}

function go() {
    gcc $@.c -Wall -o $@;
}

#bind '"\t":menu-complete' #bind tab to cycle through options
#bind '"\e[Z":"\e-1\C-i"' #bind shift+tab to cycle backwards
