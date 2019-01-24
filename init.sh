#!/bin/bash

OS_OSX="osx"
OS_LINUX="linux"
OS_UNKNOWN="unknown"

if [[ $OSTYPE == "darwin"* ]]; then
  DETECTED_OS="$OS_OSX"
elif [[ $OSTYPE == "linux"* ]]; then
  DETECTED_OS="$OS_LINUX"
else
  DETECTED_OS="$OS_UNKNOWN"
fi

export DETECTED_OS

if [ -n "${PROMPT_SECTIONS+1}" ]; then
  PROMPT_SECTIONS=()
else
  declare -a PROMPT_SECTIONS
fi
