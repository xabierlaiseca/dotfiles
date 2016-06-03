#!/bin/bash

VIRTUAL_ENVS_DIR="$PWD/virtualenvs"

function venv {
  local prompt_arg="--prompt=(venv \[$Green\]$(basename $PWD)\[$Color_Off\]) "
  local venv_dirname=`basename $PWD`

  mkdir -p $VIRTUAL_ENVS_DIR
  (cd $VIRTUAL_ENVS_DIR && virtualenv "$prompt_arg" $venv_dirname)
}

function venv-activate {
  local venv_dirname=`basename $PWD`
  . $VIRTUAL_ENVS_DIR/$venv_dirname/bin/activate
}
