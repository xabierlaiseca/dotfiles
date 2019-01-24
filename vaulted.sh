#!/bin/bash

function __vaulted_for_prompt {
  if [[ -n "$VAULTED_ENV" ]]; then
    printf -- "$1" "vaulted $VAULTED_ENV"
  fi
}

PROMPT_SECTIONS+=("__vaulted_for_prompt")
