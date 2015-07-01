#!/bin/bash

export MAVEN_OPTS="-Xmx512m"

alias mvnDebug='MAVEN_OPTS="$MAVEN_OPTS -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005" mvn'

function java-set-version {
   ## $1 -> java version (example: 1.7)
   export JAVA_HOME=`/usr/libexec/java_home -v $1 2>/dev/null`
}

alias java-set-version-7='java-set-version 1.7'
alias java-set-version-8='java-set-version 1.8'

java-set-version-8

