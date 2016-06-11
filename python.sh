#!/bin/bash

VIRTUAL_ENVS_DIR="$HOME/virtualenvs"
VIRTUAL_ENV_METADATA_DIR="$VIRTUAL_ENVS_DIR/.metadata"
VIRTUAL_ENV_METADATA_NAME_FILE="name"

function venv-create {
  local venv_name=${1:-$(basename $PWD)}

  if [ -d "$VIRTUAL_ENVS_DIR/$venv_name" ]; then
    echo "virtual environment already exists"
    return 1
  fi

  local prompt_arg="--prompt=(venv \[$Green\]$venv_name\[$Color_Off\]) "

  mkdir -p $VIRTUAL_ENVS_DIR
  (cd $VIRTUAL_ENVS_DIR && virtualenv "$prompt_arg" $venv_name)

  local metadata_file_dir="$VIRTUAL_ENV_METADATA_DIR/$PWD"
  mkdir -p $metadata_file_dir
  echo $venv_name > "$metadata_file_dir/$VIRTUAL_ENV_METADATA_NAME_FILE"
}

function venv-activate {
  local dir_to_check=$PWD

  while [[ "$dir_to_check" != "/" ]] &&
        [ ! -f "$VIRTUAL_ENV_METADATA_DIR/$dir_to_check/$VIRTUAL_ENV_METADATA_NAME_FILE" ]; do
    dir_to_check=`dirname $dir_to_check`
  done

  if [[ "$dir_to_check" == "/" ]]; then
    echo "Could not find virtual environment"
    return 1
  else
    local venv_name=`cat "$VIRTUAL_ENV_METADATA_DIR/$dir_to_check/$VIRTUAL_ENV_METADATA_NAME_FILE"`
    source $VIRTUAL_ENVS_DIR/$venv_name/bin/activate
  fi
}
