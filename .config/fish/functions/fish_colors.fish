# Solarized colors for fish (Adjusted version for my needs)
# Source: http://ethanschoonover.com/solarized#the-values
# Adjusted by: smolnar

# Use these settings if you've applied a Solarized theme to your terminal (for
# example, if "ls -G" produces Solarized output). i.e. if "blue" is #268bd2, not
# whatever the default is. (See "../etc/Solarized Dark.terminal" for OS X.)

set -l base03  "--bold black"
set -l base02  "black"
set -l base01  "--bold green"
set -l base00  "--bold yellow"
set -l base0   "--bold blue"
set -l base1   "--bold cyan"
set -l base2   "white"
set -l base3   "--bold white"
set -l yellow  "yellow"
set -l orange  "--bold red"
set -l red     "red"
set -l magenta "magenta"
set -l violet  "--bold magenta"
set -l blue    "blue"
set -l cyan    "cyan"
set -l green   "green"

# Use these settings if your terminal supports term256 and your terminal hasn't
# been configured with a Solarized theme.i.e. if "blue" is the default blue, not
# Solarized blue.
#set -l base03  002b36
#set -l base02  073642
#set -l base01  586e75
#set -l base00  657b83
#set -l base0   839496
#set -l base1   93a1a1
#set -l base2   eee8d5
#set -l base3   fdf6e3
#set -l yellow  b58900
#set -l orange  cb4b16
#set -l red     dc322f
#set -l magenta d33682
#set -l violet  6c71c4
#set -l blue    268bd2
#set -l cyan    2aa198
#set -l green   859900

# Used by fish's completion; see
# http://fishshell.com/docs/2.0/index.html#variables-color

set -g fish_color_normal          $base0
set -g fish_color_command         $base0 --bold
set -g fish_color_quote           $yellow
set -g fish_color_redirection     $base0
set -g fish_color_end             $base0
set -g fish_color_error           $red
set -g fish_color_param           $base0
set -g fish_color_comment         $base0
set -g fish_color_match           $base0
set -g fish_color_search_match    --background=$base02
set -g fish_color_autosuggestion  $base02
set -g fish_color_operator        $yellow
set -g fish_color_escape          $cyan

# Additional variables
set -g fish_pager_color_prefix      $base0
set -g fish_pager_color_completion  $blue
set -g fish_pager_color_description $yellow
set -g fish_pager_color_progress    $cyan
set -g fish_pager_color_secondary   

# Remove that ugly underline in autocompletion
set -g fish_color_valid_path  
