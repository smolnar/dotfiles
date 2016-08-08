function prompt_pwd_full
  set -l realhome ~

  echo $PWD | sed -e "s|^$realhome|~|"
end

function show_git_status -d "Gets the current git status"
  if command git rev-parse --is-inside-work-tree > /dev/null 2>&1
    set -l dirty (command git status -s --ignore-submodules=dirty | wc -l | sed -e 's/^ *//' -e 's/ *$//' 2> /dev/null)
    set -l ref (command git symbolic-ref --short HEAD 2> /dev/null ; or command git rev-parse --short HEAD 2> /dev/null)

    set_color -b normal

    if [ "$dirty" != "0" ]
      set_color yellow
    else
      set_color green
    end

    echo "$ref"

    if [ "$dirty" != "0" ]
      echo "*"
    end

    set_color normal

    echo " · "
  end
end

function show_rbenv_version -d "Gets the current Rbenv version"
  set_color red
  echo (rbenv version-name) 
  set_color normal
end

function show_current_return_value -d "Gets the current return value if not 0"
  set -l st $RETVAL

  if [ $st != 0 ];
    echo (set_color red)$st(set_color normal)" · "
  end
end

function show_pwd -d "Show the current directory"
  set -l pwd (prompt_pwd_full)
  set_color cyan
  echo "$pwd"
  set_color normal
  echo " · "
end

function fish_right_prompt -d "Prints right prompt"
  show_current_return_value
  show_pwd
  show_git_status
  show_rbenv_version
end
