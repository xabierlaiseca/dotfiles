#!/bin/bash

export VIRTUAL_ENV_DISABLE_PROMPT="true"

function __python_virtualenv_for_prompt {
  if [[ -n "$VIRTUAL_ENV" ]]; then
    printf -- "$1" "${VIRTUAL_ENV/#$HOME/\~}"
  fi
}
