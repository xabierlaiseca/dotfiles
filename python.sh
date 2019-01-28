#!/bin/bash

if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
  export WORKON_HOME="$HOME/virtualenvs"
  mkdir -p $WORKON_HOME
  source /usr/local/bin/virtualenvwrapper.sh

  function __alias_completion () {
    local function_name="$2"
    local arg_count=$(($#-3))
    local comp_function_name="$1"
    shift 2
    local function="
      function $function_name {
        ((COMP_CWORD+=$arg_count))
        COMP_WORDS=( "$@" \${COMP_WORDS[@]:1} )
        "$comp_function_name"
        return 0
      }"
    eval "$function"
  }

  alias venv-create='mkvirtualenv'
  alias venv-ls='lsvirtualenv -b'
  alias venv-activate='workon'
  alias venv-cp='cpvirtualenv'
  alias venv-rm='rmvirtualenv'

  __alias_completion _virtualenvs __venv_activate_completion_setup workon
  complete -F __venv_activate_completion_setup venv-activate

  __alias_completion _virtualenvs __venv_cp_completion_setup cpvirtualenv
  complete -F __venv_cp_completion_setup venv-cp

  __alias_completion _virtualenvs __venv_rm_completion_setup rmvirtualenv
  complete -F __venv_rm_completion_setup venv-rm
else
  echo "Execute `pip install virtualenvwrapper`"
fi
