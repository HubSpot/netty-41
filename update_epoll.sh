#!/bin/bash
cd $(dirname "$0")

set -e

VERSION=$(grep netty4.version pom.xml | perl -lne 'print $1 if (/>(.+?)<\//);')

SOURCE_JAR="$HOME/.m2/repository/io/netty/netty-all/$VERSION/netty-all-$VERSION.jar"

if [[ ! -r $SOURCE_JAR ]]; then
    echo "Running mvn compile to force a download of netty."
    mvn compile &> /dev/null
fi

if [[ ! -r $SOURCE_JAR ]]; then
    echo "Could not find source jar after mvn run. Bad version? $SOURCE_JAR"
    exit 1
fi

cd src/main/resources/META-INF/native
unzip $SOURCE_JAR \
      META-INF/native/libnetty-transport-native-epoll.so

mv -v ./META-INF/native/libnetty-transport-native-epoll.so \
      ./libnettyfouronenetty-transport-native-epoll.so

rm -rf ./META-INF

