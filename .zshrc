# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="asylum"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(rails)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

############################################################################

# Author: Kim Silkebækken <kim.silkebaekken+github@gmail.com>
# Source: https://github.com/Lokaltog/sync
# Environment variables {{{
# Command history {{{
export HISTFILE=~/.zshhist
export HISTSIZE=10000
export SAVEHIST=$HISTSIZE
# }}}
# Colors {{{
#export GREP_COLORS="38;5;230:sl=38;5;240:cs=38;5;100:mt=38;5;161:fn=38;5;197:ln=38;5;212:bn=38;5;44:se=38;5;166"
export LS_COLORS="*.tar.bz2=38;5;226:*.tar.xz=38;5;130:*PKGBUILD=48;5;233;38;5;160:*.html=38;5;213:*.htm=38;5;213:*.vim=38;5;142:*.css=38;5;209:*.screenrc=38;5;120:*.procmailrc=38;5;120:*.zshrc=38;5;120:*.bashrc=38;5;120:*.xinitrc=38;5;120:*.vimrc=38;5;120:*.htoprc=38;5;120:*.muttrc=38;5;120:*.gtkrc-2.0=38;5;120:*.fehrc=38;5;120:*.rc=38;5;120:*.md=38;5;130:*.markdown=38;5;130:*.conf=38;5;148:*.h=38;5;81:*.rb=38;5;192:*.c=38;5;110:*.diff=38;5;31:*.yml=38;5;208:*.pl=38;5;178:*.csv=38;5;136:tw=38;5;003:*.chm=38;5;144:*.bin=38;5;249:*.pdf=38;5;203:*.mpg=38;5;38:*.ts=38;5;39:*.sfv=38;5;191:*.m3u=38;5;172:*.txt=38;5;192:*.log=38;5;190:*.swp=38;5;241:*.swo=38;5;240:*.theme=38;5;109:*.zsh=38;5;173:*.nfo=38;5;113:mi=38;5;124:or=38;5;160:ex=38;5;197:ln=target:pi=38;5;130:ow=38;5;208:fi=38;5;007:so=38;5;167:di=34:*.pm=38;5;197:*.pl=38;5;166:*.sh=38;5;243:*.patch=38;5;37:*.tar=38;5;118:*.tar.gz=38;5;172:*.zip=38;5;11::*.rar=38;5;11:*.tgz=38;5;11:*.7z=38;5;11:*.mp3=38;5;173:*.flac=38;5;166:*.mkv=38;5;115:*.avi=38;5;114:*.wmv=38;5;113:*.jpg=38;5;66:*.jpeg=38;5;67:*.png=38;5;68:*.pacnew=38;5;33"
# }}}
# Locale {{{
export LANG="en_US.utf-8"
export LC_CTYPE="en_US.utf8"
export LC_NUMERIC="en_US.utf8"
export LC_TIME="en_US.utf8"
export LC_COLLATE="en_US.utf8"
export LC_MONETARY="en_US.utf8"
export LC_MESSAGES="en_US.utf8"
export LC_PAPER="en_US.utf8"
export LC_NAME="en_US.utf8"
export LC_ADDRESS="en_US.utf8"
export LC_TELEPHONE="en_US.utf8"
export LC_MEASUREMENT="en_US.utf8"
export LC_IDENTIFICATION="en_US.utf8"
export LC_ALL="en_US.utf8"
# }}}
# Applications {{{
export PAGER="less"
export MANPAGER="$PAGER"
export EDITOR="vim"
export VISUAL="vim"
export BROWSER="google-chrome"
export TERM="xterm-256color"
# }}}
# Paths {{{
export PATH="$HOME/sync/bin:/usr/bin/vendor_perl:$PATH" # Add sync/bin to path
# }}}
# }}}
# Load plugins {{{
# }}}
# Zsh options {{{
typeset -g -A key
typeset -U path cdpath fpath manpath

setopt auto_cd # Change dir without cd
setopt extended_glob # Regex globbing
setopt print_exit_value # Print exit value of programs with non-zero exit status
setopt notify # Report the status if background jobs immediately
setopt complete_in_word # Not just at the end
setopt always_to_end # When complete from middle, move cursor
setopt no_match # Show error if pattern has no matches
setopt no_beep # Disable beeps
setopt list_packed # Compact completion lists
setopt list_types # Show types in completion
setopt rec_exact # Recognize exact, ambiguous matches
setopt hist_verify # When using ! cmds, confirm first
setopt hist_ignore_all_dups # Ignore dups in command history
setopt hist_ignore_space # Don't add commands prepended by whitespace to history
setopt append_history # Allow multiple sessions to append to the history file
setopt extended_history # Save additional info to history file
setopt inc_append_history # Append commands to history immediately
setopt prompt_subst # Enable variable substitution in prompt
setopt correct # Command correction
setopt dvorak # Correkt dvorak typing mistakes
setopt short_loops # Allow short loops
# }}}
# Keybindings {{{
bindkey -v

bindkey "\e[1~" beginning-of-line # Home
bindkey "\e[4~" end-of-line # End
bindkey "\e[5~" beginning-of-history # PageUp
bindkey "\e[6~" end-of-history # PageDown
bindkey "\e[2~" quoted-insert # Ins
bindkey "\e[3~" delete-char # Del
bindkey "\e[5C" forward-word
bindkey "\eOc" emacs-forward-word
bindkey "\e[5D" backward-word
bindkey "\eOd" emacs-backward-word
bindkey "\e\e[C" forward-word
bindkey "\e\e[D" backward-word
bindkey "\e[Z" reverse-menu-complete # Shift+Tab
# for rxvt
bindkey "\e[7~" beginning-of-line # Home
bindkey "\e[8~" end-of-line # End
# for non RH/Debian xterm, can't hurt for RH/Debian xterm
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line
# for freebsd console
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line
# for guake
bindkey "\eOF" end-of-line
bindkey "\eOH" beginning-of-line
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
bindkey "\e[3~" delete-char # Del
bindkey "^A" beginning-of-line # CTRL-A
bindkey '^R' history-incremental-search-backward
# }}}
# Aliases {{{
# Vimpager aliases {{{
alias less=$PAGER
# }}}
# General aliases {{{
alias s="sudo"
alias ls="ls --color=auto"
alias lsa="ls -a"
alias grep="grep --color=auto"
alias shutdown="sudo shutdown -h now"
alias pacman="sudo pacman"
alias rg="ranger"
alias reboot="sudo reboot"
alias svim="sudo -E vim"
alias rc.d="s rc.d"
alias copy_ssh_key="xclip -sel clip < ~/.ssh/id_rsa.pub"
alias gg="tig"
alias service="s service"
# }}}

# Default sudo commands {{{
for cmd in mount ifconfig apt-get apt-cache service chmod chown rc.d; do
  alias $cmd="s $cmd"
done

# }}}
# Multitail aliases {{{
# }}}
# Completion {{{
autoload -Uz compinit && compinit
autoload -U colors && colors
# General rules {{{
zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' group-name ''
zstyle ':completion:*' ignore-parents parent pwd .. directory
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' matcher-list ''
zstyle ':completion:*' menu select
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path ~/.zshcache
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:*:killall:*:processes' command 'ps --forest -A -o pid,user,cmd'
zstyle ':completion:*:processes-names' command 'ps axho command'
zstyle ':completion:*:processes' command 'ps -au$USER -o pid,time,cmd|grep -v "ps -au$USER -o pid,time,cmd"'
zstyle ':completion:*:cd:*' ignored-patterns '(*/)#lost+found'
zstyle ':completion:*:matches' group yes
zstyle ':completion:*:options' description yes
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:descriptions' format $'\e[01;33m-- %d --\e[0m'
zstyle ':completion:*:messages' format $'\e[01;35m-- %d --\e[0m'
zstyle ':completion:*:warnings' format $'\e[01;31m-- no matches found --\e[0m'
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.*' insert-sections true
zstyle ':completion:*:man:*' menu yes select
zstyle ':completion:*:rm:*' ignore-line yes
zstyle ':completion:*:cp:*' ignore-line yes
zstyle ':completion:*:mv:*' ignore-line yes
# }}}

# List prompt - don't ask 'do you want to see all ...' in menu selection {{{
LISTPROMPT=''
# }}}

# Spelling prompt {{{
#SPROMPT='zsh: correct '%R' to '%r'? ([Y]es/[N]o/[E]dit/[A]bort) '
SPROMPT='Did you mean %{$fg[green]%}'%r' %{$reset_color%}? ([Y]es/[N]o/[E]dit/[A]bort) '

# Dynamic title urxvt {{{
#
case $TERM in
  urxvt*|rxvt*|xterm*)
    precmd () { print -Pn "\e]0;%n@%m: %~\a"}
    preexec () { print -Pn "\e]0;%n@%m: $1\a" }
    ;;
esac
# }}}

# }}}
# }}}
# ZLE stuff {{{
# Smart dot (e.g. enter ..../dir) {{{
smartdot(){
  if [[ $LBUFFER = *.. ]]; then
    LBUFFER+=/..
  else
    LBUFFER+=.
  fi
}

zle -N smartdot smartdot
bindkey . smartdot
# }}}
# }}}
#
#
# {{{
# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
# }}}

# {{{
# JVM & JAVA options
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on  -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dswing.aatext=true'
# }}}

export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export PATH=$PATH:$HOME/bin # Add home bin path

# enable CTRL+S / Q
stty -ixon

export LOAD_GEMS_FROM_LOCAL=1
