# Colors {{{
set -xg CLICOLOR 1
set -xg LSCOLORS GxFxCxDxBxegedabagaced
# }}}

# Locale {{{
set -xg LANG "en_US.utf-8"
set -xg LC_CTYPE "en_US.utf-8"
set -xg LC_NUMERIC "en_US.utf-8"
set -xg LC_TIME "en_US.utf-8"
set -xg LC_COLLATE "en_US.utf-8"
set -xg LC_MONETARY "en_US.utf-8"
set -xg LC_MESSAGES "en_US.utf-8"
set -xg LC_PAPER "en_US.utf-8"
set -xg LC_NAME "en_US.utf-8"
set -xg LC_ADDRESS "en_US.utf-8"
set -xg LC_TELEPHONE "en_US.utf-8"
set -xg LC_MEASUREMENT "en_US.utf-8"
set -xg LC_IDENTIFICATION "en_US.utf-8"
set -xg LC_ALL "en_US.utf-8"
# }}}

# Applications {{{
set -xg PAGER "less"
set -xg MANPAGER "$PAGER"
set -xg EDITOR "vim"
set -xg TERM "xterm-256color"
set -xg ANDROID_HOME $HOME/Library/Android/sdk
set -xg PGHOST localhost
# }}}

# Paths {{{
set PATH /usr/local/opt/postgresql@9.5/bin $PATH
set PATH /usr/local/bin $PATH
set PATH /usr/local/sbin $PATH
set PATH $HOME/.rbenv/bin $PATH
set PATH $HOME/.rbenv/shims $PATH
set PATH $PATH $HOME/bin
set PATH $PATH $ANDROID_HOME/tools
set PATH $PATH $ANDROID_HOME/platform-tools

# Rbenv
status --is-interactive; and . (rbenv init -|psub)

# Tmux
set -xg EVENT_NOKQUEUE 1
# }}}

# NVIM
export NVIM_TUI_ENABLE_TRUE_COLOR 0
# }}}

# fzf
set -xg FZF_DEFAULT_COMMAND 'ag --hidden -U -g ""'
set -xg FZF_COMPLETION_TRIGGER '~~'
set -xg FZF_DEFAULT_OPTS '-i'
# }}}
