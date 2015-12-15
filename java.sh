#!/bin/bash

export MAVEN_OPTS="-Xmx2048m -XX:MaxPermSize=512m"

alias mvnDebug='MAVEN_OPTS="$MAVEN_OPTS -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005" mvn'

function __java_for_prompt {
  if [[ -n $(upsearch "pom.xml") ]]; then
    java_version=$(java -version 2>&1 | sed 's/java version "\(.*\)\.\(.*\)\..*"/Java\2/; 1q')
    printf -- "$1" "$java_version"
  fi
}

function java-set-version {
   ## $1 -> java version (example: 1.7)
   export JAVA_HOME=`/usr/libexec/java_home -v $1 2>/dev/null`
}

alias java-set-version-6='java-set-version 1.6'
alias java-set-version-7='java-set-version 1.7'
alias java-set-version-8='java-set-version 1.8'

java-set-version-8
