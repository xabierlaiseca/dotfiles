#!/bin/bash

CURRENT_DIR=$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)

. $CURRENT_DIR/functions.sh
. $CURRENT_DIR/git-prompt.sh
. $CURRENT_DIR/aliases.sh
. $CURRENT_DIR/colours.sh
. $CURRENT_DIR/java.sh
. $CURRENT_DIR/python.sh
. $CURRENT_DIR/shell.sh

if [ -f $CURRENT_DIR/gamesys/main.sh ]; then
  . $CURRENT_DIR/gamesys/main.sh
fi
