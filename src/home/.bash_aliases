#!/bin/bash
# Written by Andrei Cioara <http://andrei.cioara.me>

# Shortcuts and common mistakes
alias ls="ls --color=auto --group-directories-first"
alias cd..='cd ..'
alias c..="c .."
alias l="ls"
alias sl="ls"
alias s="ls"
alias sls="ls"
alias m="make"
alias o="xdg-open"
alias src='source ~/.bashrc'
alias rr="react-native run-android"
alias vv="source venv/bin/activate"
# Replaces whitespace with underscore in files. So we can hook them into scrpts
alias hack_repair='for file in *; do mv "$file" "${file/ /_}"; done'

# Better defaults
alias gitk="gitk --all"
alias scons="scons -Q"
alias xclip='xclip -selection c'
alias grep='grep --colour=auto -i --line-buffered'
# Colorful less
alias less="less -r"

# Fast stuff
alias fastbower="yes '' | bower init"
alias fastnpm="npm init -y"

# Useful Commands
alias cpd="pwd | xargs -I % echo 'cd \"%\"' | xclip"
alias aliases='pluma ~/.bash_aliases &'
alias ip-public="curl -s https://api.ipify.org?format=json | perl -e 'print <STDIN> =~ m{\d*\.\d*\.\d*\.\d*}g; '"
alias ip-local="hostname -I | xargs echo -n"
alias server="echo 'http://0.0.0.0:8899' | xclip && python -m SimpleHTTPServer 8899"
alias kkk="kill -9 %%"
alias bbb="cp ~/dev/boilerplate/* ."

# Tooling
alias decodeurl='python -c "import sys, urllib as ul; print ul.unquote_plus(\"\".join(sys.stdin.readlines()).strip())"'
alias encodeurl='python -c "import sys, urllib as ul; print ul.quote_plus(\"\".join(sys.stdin.readlines()).strip())"'
alias base64="base64 -w0"

# Bookmarks
alias dev="cd ~/dev"
alias dw="cd ~/Downloads"
alias pic="cd ~/Pictures"
alias fast="dev && cd cpp/fast"

# Git
gc() {
    gc_args=$@
    echo "${gc_args^}" | xargs -I % git commit -am "%"
}
alias gst='git status -sb'
alias gp='git push origin HEAD'
# Remove `+` and `-` from start of diff lines; just rely upon color.
alias gd='git diff --color | sed "s/^\([^-+ ]*\)[-+ ]/\\1/" | less -r'

# Laptop Fixes
alias wireless="sudo nmcli nm sleep false"
alias suspend="sudo pm-suspend"
alias audiolist="pactl list sources"
alias battery='upower -i /org/freedesktop/UPower/devices/battery_BAT0| grep -E "state|to\ full|percentage"'

# Scripts
alias c=". ~/.scripts/cd.sh"
alias sshadd=". ~/.scripts/ssh-add.sh"
alias db="~/.scripts/dropbox.py"
alias pdfCut="~/.scripts/pdfCut.sh"

# Functions
take () {
  mkdir -p $1
  cd $1
}

here() {
  ls | grep -i $1
}

p() {
  if [ $# -eq 0 ]
  then
    python -i /home/aicioara/.scripts/imports.py
  else
    python $@
  fi
}

d() {
  cd $( /home/aicioara/.scripts/pick )
}

clock() {
    while true; do echo -ne "`date +%H:%M:%S:%N`\r"; done
}

# credit: http://nparikh.org/notes/zshrc.txt
extract () {
    if [ -f $1 ]; then
        case $1 in
            *.tar.bz2)  tar -jxvf $1                        ;;
            *.tar.gz)   tar -zxvf $1                        ;;
            *.bz2)      bunzip2 $1                          ;;
            *.dmg)      hdiutil mount $1                    ;;
            *.gz)       gunzip $1                           ;;
            *.tar)      tar -xvf $1                         ;;
            *.tbz2)     tar -jxvf $1                        ;;
            *.tgz)      tar -zxvf $1                        ;;
            *.zip)      unzip $1                            ;;
            *.ZIP)      unzip $1                            ;;
            *.pax)      cat $1 | pax -r                     ;;
            *.pax.Z)    uncompress $1 --stdout | pax -r     ;;
            *.rar)      unrar x $1                          ;;
            *.Z)        uncompress $1                       ;;
            *)          echo "'$1' cannot be extracted/mounted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

