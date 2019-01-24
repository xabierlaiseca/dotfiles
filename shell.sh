#!/bin/bash

function __prompt_build_sections {
  local result=""
  for section in ${PROMPT_SECTIONS[@]}; do
    result+="\$($section ' (\[$IRed\]%s\[$Color_Off\])')"
  done
  printf -- '%s' "$result"
}

if [[ $DETECTED_OS == $OS_OSX ]]; then
  export PS1="\h:\[$Green\]\w\[$Color_Off\]$(__prompt_build_sections) \u\$ "
elif [[ $DETECTED_OS == $OS_LINUX ]]; then
  export PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\u@\h:\[$Green\]\w\[$Color_Off\]$(__prompt_build_sections) \$ "
fi
