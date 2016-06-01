#!/bin/bash

export PS1="\$(__python_virtualenv_for_prompt '(venv %s) ')\h:\[$Green\]\w\[$Color_Off\]\$(__java_for_prompt ' (\[$IRed\]%s\[$Color_Off\])')\$(__git_ps1 ' (\[$IRed\]%s\[$Color_Off\])') \u\$ "
