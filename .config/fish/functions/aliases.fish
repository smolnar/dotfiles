# General aliases {{{
alias s "sudo"
alias lsa "ls -a"
alias shutdown "sudo shutdown -h now"
alias pacman "sudo pacman"
alias rg "ranger"
alias reboot "sudo reboot"
alias svim "sudo -E vim"
alias rc.d "s rc.d"
alias gg "tig"
alias service "s service"
alias dl "cd ~/Downloads"
alias dt "cd ~/Desktop"
alias db "cd ~/Dropbox"
alias g "git"
alias h "history"
alias j "jobs"
alias p "cd ~/projects"
alias ls "ls -GFh"
#}}}

# Helpers {{{
# IP addresses
alias myip "dig +short myip.opendns.com @resolver1.opendns.com"
alias localip "ipconfig getifaddr en0"
alias ips "ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# View HTTP traffic
if [ (uname) = "Darwin" ]
  function sniff
    if count $argv > /dev/null
      set -l interface $argv[1]
    else
      set -l interface "en0"
    end

    sudo ngrep -d "$interface" -t '^(GET|POST) ' 'tcp and port 80'
  end
else
  alias sniff "sudo ngrep -d eth0 -t '^(GET|POST) ' 'tcp and port 80'"
end

# Recursively delete `.DS_Store` files
alias cleanup "find . -type f -name '*.DS_Store' -ls -delete"

# URL-encode strings
alias urlencode 'python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# Intuitive map function
# For example, to list all directories that contain a certain file:
# find . -name .gitattributes | map dirname
alias map "xargs -n1"

# Vagrant goodies
alias vp 'vagrant provision'
alias vup 'vagrant up'
alias vssh 'vagrant ssh'
alias vdestroy 'vagrant destroy'

if [ (uname) = "Darwin" ]
  # Get OS X Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
  alias update 'sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm install npm -g; npm update -g; gem update'

  # Lock the screen (when going AFK)
  alias afk 'bash -c \'/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend\''

  # Stuff I never really use but cannot delete either because of http://xkcd.com/530/
  alias stfu "osascript -e 'set volume output muted true'"
  alias pumpitup "osascript -e 'set volume 7'"

  # make "ip" an alias to myip (on Linux, ip is a system command)
  alias ip myip
end

set -l GRC (which grc)

if [ -n "$GRC" ]
    alias colourify "$GRC -es --colour=auto"
    alias configure 'colourify ./configure'
    alias diff 'colourify diff'
    alias make 'colourify make'
    alias gcc 'colourify gcc'
    alias g++ 'colourify g++'
    alias as 'colourify as'
    alias ld 'colourify ld'
    alias netstat 'colourify netstat'
    alias ping 'colourify ping'
    alias traceroute 'colourify /usr/sbin/traceroute'
    alias head 'colourify head'
    alias tail 'colourify tail'
    alias dig 'colourify dig'
    alias mount 'colourify mount'
    alias ps 'colourify ps'
    alias mtr 'colourify mtr'
    alias df 'colourify df'
end
#}}}
