#!/bin/bash
cd $(dirname "$0")

set -e

VERSION=$(grep netty41.version pom.xml | perl -lne 'print $1 if (/>(.+?)<\//);' | head -n 1)

SOURCE_JAR="$HOME/.m2/repository/io/netty/netty-all/$VERSION/netty-all-$VERSION.jar"

echo "Trying to load source jar: $SOURCE_JAR"

if [[ ! -r $SOURCE_JAR ]]; then
    echo "Running mvn compile to force a download of netty."
    mvn compile &> /dev/null
    mvn dependency:sources &>/dev/null
fi

if [[ ! -r $SOURCE_JAR ]]; then
    echo "Could not find source jar after mvn run. Bad version? $SOURCE_JAR"
    exit 1
fi

cd src/main/resources/META-INF/native
unzip $SOURCE_JAR \
      META-INF/native/libnetty_transport_native_epoll_x86_64.so

mv -v ./META-INF/native/libnetty_transport_native_epoll_x86_64.so \
      ./libnettyfourone_netty_transport_native_epoll_x86_64.so

rm -rf ./META-INF

