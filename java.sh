#!/bin/bash

export MAVEN_OPTS="-Xmx2048m -XX:MaxPermSize=512m"

alias mvnDebug='MAVEN_OPTS="$MAVEN_OPTS -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005" mvn'

function __jvm_for_prompt {
  if [[ -n $(upsearch "pom.xml") ]] || [[ -n $(upsearch "build.gradle") ]] || [[ -n $(upsearch "build.sbt") ]]; then
    java_version=$(java -version 2>&1 | head -n 1 | sed 's/.*"\(.*\)"/\1/')
    printf -- "$1" "jvm $java_version"
  fi
}

eval "$(jenv init -)"

PROMPT_SECTIONS+=("__jvm_for_prompt")
