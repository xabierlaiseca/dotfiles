#!/bin/bash

export PS1="\h:\[$Green\]\w\[$Color_Off\]\$(__java_for_prompt ' (\[$IRed\]%s\[$Color_Off\])')\$(__git_ps1 ' (\[$IRed\]%s\[$Color_Off\])') \u\$ "
