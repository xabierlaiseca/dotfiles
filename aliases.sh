#!/bin/bash

## docker

MONGO_CONTAINER_NAME=mongo
alias mongo_start="docker run -dP -p 27017:27017 --name=$MONGO_CONTAINER_NAME mongo:2.6.7"
alias mongo_stop="docker rm -vf $MONGO_CONTAINER_NAME"

APIGEE_CONTAINER_NAME=apigee
alias apigee_start="docker run -dP -p 18080:8080 -p 19000:9000 -p 19001:9001 --name=$APIGEE_CONTAINER_NAME docker-registry.cloud.platforms.gamesys.corp/coreplatform/apigee:current"
alias apigee_stop="docker rm -vf $APIGEE_CONTAINER_NAME"

alias docker_clean='docker rm -vf $(docker ps -aq)'
function docker_all_stats {
  docker stats $(docker ps|grep -v 'NAMES'|awk '{ print $NF }'|tr '\n' ' ')
}

## GPG
function gpg-encrypt {
  if [[ $# -lt 1 ]] || [[ $# -gt 2  ]]; then
    echo "Usage: ${FUNCNAME[0]} <file-to-encrypt> [<recipent>]"
    return 1
  fi

  local file_to_encrypt=$1

  local recipient=""

  if [[ $# -gt 1 ]]; then
    recipient=$2
  else
    recipient=`gpg --list-secret-keys | egrep -oE '([A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4})'`
  fi

  gpg --output ${file_to_encrypt}.gpg --encrypt --recipient $recipient $file_to_encrypt
}

function gpg-decrypt {
  if [[ $# -ne 1 ]]; then
    echo "Usage: ${FUNCNAME[0]} <file-to-decrypt>"
    return 1
  fi

  local file_to_decrypt=$1

  local output_file=${file_to_decrypt%.gpg}

  if [[ $file_to_decrypt == $output_file ]]; then
    output_file=${file_to_decrypt}.decrypted
  fi

  gpg --output $output_file --decrypt $file_to_decrypt
}

## other
alias simplehttp="python -m SimpleHTTPServer"
