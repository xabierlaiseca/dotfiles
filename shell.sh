#!/bin/bash

if [[ $DETECTED_OS == $OS_OSX ]]; then
  export PS1="\h:\[$Green\]\w\[$Color_Off\]\$(__java_for_prompt ' (\[$IRed\]%s\[$Color_Off\])')\$(__git_ps1 ' (\[$IRed\]%s\[$Color_Off\])') \u\$ "
elif [[ $DETECTED_OS == $OS_LINUX ]]; then
  export PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\u@\h:\[$Green\]\w\[$Color_Off\]\$(__java_for_prompt ' (\[$IRed\]%s\[$Color_Off\])')\$(__git_ps1 ' (\[$IRed\]%s\[$Color_Off\])') \$ "
fi
