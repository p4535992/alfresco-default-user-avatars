#!/bin/bash
# Downloads the spring-loaded lib if not existing and runs repository AMP
springloadedfile=~/.m2/repository/org/springframework/springloaded/1.2.5.RELEASE/springloaded-1.2.5.RELEASE.jar

if [ ! -f $springloadedfile ]; then
mvn validate -Psetup
fi

MAVEN_OPTS="-javaagent:$springloadedfile -noverify -Xms256m -Xmx2G -XX:PermSize=300m" mvn integration-test -Pamp-to-war