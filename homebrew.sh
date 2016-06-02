#!/bin/bash

if [[ $DETECTED_OS == $OS_OSX ]]; then

  if [ -f `brew --prefix`/etc/bash_completion ]; then
      . `brew --prefix`/etc/bash_completion
  fi

fi
