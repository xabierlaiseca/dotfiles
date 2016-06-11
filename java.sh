#!/bin/bash

export MAVEN_OPTS="-Xmx2048m -XX:MaxPermSize=512m"

alias mvnDebug='MAVEN_OPTS="$MAVEN_OPTS -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005" mvn'

function __java_for_prompt {
  if [[ -n $(upsearch "pom.xml") ]]; then
    java_version=$(java -version 2>&1 | sed 's/\(openjdk\|java\) version "\(.*\)\.\(.*\)\..*"/Java\3/; 1q')
    printf -- "$1" "$java_version"
  fi
}


if [[ $DETECTED_OS == $OS_OSX ]]; then

  function set-java-home {
    ## $1 -> java version (example: 1.7)
    local java_home_output
    java_home_output=`/usr/libexec/java_home -v $1 2>/dev/null`
    if [ $? -eq 0 ]; then
      export JAVA_HOME=$java_home_output
    else
      echo "Java version $1 not found"
    fi
  }

  alias java-set-6='set-java-home 1.6'
  alias java-set-7='set-java-home 1.7'
  alias java-set-8='set-java-home 1.8'

fi

## workaround for alias expansion
## http://unix.stackexchange.com/questions/140263/is-there-some-way-to-make-alias-expansion-work-inside-if-fi-on-bash
if [[ $DETECTED_OS == $OS_OSX ]]; then
  java-set-8
fi
