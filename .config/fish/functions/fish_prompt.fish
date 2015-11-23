# Inspired by: Chris Morrell's Fish Theme (https://github.com/oh-my-fish/theme-cmorrell.com)

source "$HOME/.config/fish/functions/fish_colors.fish"

## Function to show a segment
function prompt_segment -d "Function to show a segment"
  # Get colors
  set -l bg $argv[1]
  set -l fg $argv[2]

  # Set 'em
  set_color -b $bg
  set_color $fg

  # Print text
  if [ -n "$argv[3]" ]
    echo -n -s $argv[3]
  end
end

## Function to show current status
function show_status -d "Function to show the current status"
  if [ -n "$SSH_CLIENT" ]
    prompt_segment normal magenta "SSH: "
    set pad ""
  end
end


# Show prompt w/ privilege cue
function show_prompt -d "Shows prompt with cue for current priv"
  set -l uid (id -u $USER)

  if [ $uid -eq 0 ]
    prompt_segment red white " ! "
    set_color normal
    echo -n -s " "
  else
    if [ $RETVAL -ne 0 ]
      prompt_segment normal red " \$ "
    else
      prompt_segment normal white " \$ "
    end
  end

  set_color normal
end

function show_hostname
  set_color green --bold

  echo -n -s (hostname -s)
end

## SHOW PROMPT
function fish_prompt
  set -g RETVAL $status
  show_status
  show_hostname
  show_prompt
end
