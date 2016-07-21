#!/bin/bash

function aws-sts-decode-auth-message {
  local message=$1
  aws sts decode-authorization-message --encoded-message "$message" | python -c 'import json,sys;obj=json.load(sys.stdin);print obj["DecodedMessage"]' | json_pp
}
