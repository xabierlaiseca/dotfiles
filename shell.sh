#!/bin/bash

export PS1="\h:\[$Green\]\w\[$Color_Off\] (\[$IRed\]\$(java-print-version)\[$Color_Off\])\$(__git_ps1 ' (\[$IRed\]%s\[$Color_Off\])') \u\$ "
