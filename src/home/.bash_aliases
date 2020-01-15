# Written by Andrei Cioara <http://andrei.cioara.me>

export EDITOR='subl'

# Shortcuts and common mistakes
#alias ls="ls --group-directories-first"
export CLICOLOR=1
alias cd..='cd ..'
alias c..="c .."
alias l="ls"
alias sl="ls"
alias ll="ls -al"
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
alias grep='grep --colour=auto -i --line-buffered'
# Colorful less
alias less="less -r"

# Useful Commands
alias cpd="pwd | xargs -I % echo 'cd \"%\"' | pbcopy"
alias aliases='$EDITOR ~/.bash_aliases &'
alias ip-public="curl -s https://api.ipify.org?format=json | perl -e 'print <STDIN> =~ m{\d*\.\d*\.\d*\.\d*}g; '"
alias ip-local="hostname -I | xargs echo -n"
alias server="echo 'http://0.0.0.0:8899' | pbcopy && python -m SimpleHTTPServer 8899"
alias kkk="kill -9 %%"
alias bbb="cp ~/dev/boilerplate/empty/* ."
alias ramstatus="ps -e -o pid,vsz,comm= | sort -n -k 2"
alias ps-start='ps -eo pid,lstart,cmd'

# Tooling
alias decodeurl='python -c "import sys, urllib as ul; print ul.unquote_plus(\"\".join(sys.stdin.readlines()).strip())"'
alias encodeurl='python -c "import sys, urllib as ul; print ul.quote_plus(\"\".join(sys.stdin.readlines()).strip())"'
alias base64="base64 -w0"

# Bookmarks
alias dev="cd ~/dev"
alias dw="cd ~/Downloads"
alias pic="cd ~/Pictures"

# Git
gc() {
    echo "$@" | awk '{ print toupper(substr($0, 1, 1)) substr($0, 2) }' | xargs -I % git commit -am "%"
}
gbb() {
    if [ -z $1 ]; then echo "Requires 1 argument - branch name"; return 1; fi
    git diff-index --quiet HEAD --
    rc=$?; if [ $rc -ne 0 ]; then echo "Uncommitted changes"; return $rc; fi
    git checkout master; git pull; git checkout -b $@;
}
alias gst='git status -sb'
alias gp='git push origin HEAD'
alias gcb='git checkout -b'
alias gpl='git pull'
alias gd='git diff --color | sed "s/^\([^-+ ]*\)[-+ ]/\\1/" | less -r' # Remove `+` and `-` from start of diff lines; just rely upon color.
alias glg='git log --graph --oneline --all'

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

alias pp='python'

d() {
  cd $( pick-dir )
}


f-watch() {
  while [[ True ]]; do
    echo "$@"
    $@
    sleep 0.1
    inotifywait --recursive --quiet --exclude .git/ --event create,modify .
  done
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

