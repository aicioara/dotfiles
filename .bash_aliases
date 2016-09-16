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

# Useful Commands
alias cpd="pwd | xargs -I % echo cd % | xclip"
alias aliases='pluma ~/.bash_aliases &'
alias ip-public="curl -s https://api.ipify.org?format=json | perl -e 'print <STDIN> =~ m{\d*\.\d*\.\d*\.\d*}g; '"
alias ip-local="hostname -I | xargs echo -n"
alias server="ip-local | xargs -I % echo 'http://%:8899' | xclip && python -m SimpleHTTPServer 8899"

# Better defaults
alias gitk="gitk --all"
alias scons="scons -Q"
alias xclip='xclip -selection c'
alias grep='grep --colour=auto -i'
# Colorful less
alias less="less -r"

# Ubuntu -> Mint conversions
alias gedit="pluma"
alias nautilus="caja"

# Git
alias gst='git status -sb'
alias gp='git push origin HEAD'
alias gc='git commit -am "'
# Remove `+` and `-` from start of diff lines; just rely upon color.
alias gd='git diff --color | sed "s/^\([^-+ ]*\)[-+ ]/\\1/" | less -r'

# Laptop Fixes
alias wireless="sudo nmcli nm sleep false"
alias suspend="sudo pm-suspend"
alias audiolist="pactl list sources"

# Bookmarks
alias dev="cd ~/dev"
alias dw="cd ~/Downloads"
alias pic="cd ~/Pictures"
alias fast="dev && cd cpp/fast"

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

p() {
  if [ $# -eq 0 ]
  then
    python -i /home/aicioara/.scripts/imports.py
  else
    python $@
  fi
}

clock() {
    while true; do echo -ne "`date +%H:%M:%S:%N`\r"; done
}
