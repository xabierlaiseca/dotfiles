#!/bin/bash

VIRTUAL_ENVS_DIR="$HOME/virtualenvs"

function venv-create {
  local venv_name=${1:-$(basename $PWD)}

  if [ -d "$VIRTUAL_ENVS_DIR/$venv_name" ]; then
    echo "virtual environment already exists"
    return 1
  fi

  local prompt_arg="--prompt=(venv \[$Green\]$venv_name\[$Color_Off\]) "

  mkdir -p $VIRTUAL_ENVS_DIR
  (cd $VIRTUAL_ENVS_DIR && virtualenv "$prompt_arg" $venv_name)
}

function venv-activate {
  if [ -n "$1" ]; then
    __venv_activate_by_name $1
  else
    __venv_activate_from_pwd
  fi
}

function __venv_activate_by_name {
  if [ -d $VIRTUAL_ENVS_DIR/$1 ]; then
      local venv_name=$1
  else
    local potential_venv_names=`find $VIRTUAL_ENVS_DIR -maxdepth 1 -type d -name "*$1*"`
    local potential_venv_count=`echo $potential_venv_names | wc -w`

    if [ $potential_venv_count == "1" ]; then
      local venv_name=`echo $potential_venv_names | head -n 1 | xargs basename`
    elif [ $potential_venv_count == "0" ]; then
      echo "Could not find virtual environment"
      return 1
    else
      echo "Multiple virtual environments found"

      local name
      for name in $potential_venv_names; do
        echo " * $name"
      done

      return 1
    fi
  fi

  source $VIRTUAL_ENVS_DIR/$venv_name/bin/activate
}

function __venv_activate_from_pwd {
  local dir_to_check=$PWD
  local venv_name

  while [ "$dir_to_check" != "/" ] && [ -z "$venv_name" ]; do
    local venv_name_to_check=`basename $dir_to_check`

    if [ -d $VIRTUAL_ENVS_DIR/$venv_name_to_check ]; then
      venv_name=$venv_name_to_check
    else
      dir_to_check=`dirname $dir_to_check`
    fi
  done

  if [ -n $venv_name ]; then
    source $VIRTUAL_ENVS_DIR/$venv_name/bin/activate
  else
    echo "Could not find virtual environment"
    return 1
  fi
}

function __venv_activate_complete {
  local venv_location
  for venv_location in $VIRTUAL_ENVS_DIR/$2*; do
    [ -d $venv_location ] || continue
    COMPREPLY+=( $(basename "$venv_location") )
  done
}

complete -F __venv_activate_complete venv-activate
