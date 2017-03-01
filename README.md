# Netty41

Netty 4.1 without netty conflicting with netty 4.0

## Usage

Maven:

```xml
    <dependency>
      <groupId>io.netty</groupId>
      <artifactId>netty-all-41</artifactId>
      <version>1.0-SNAPSHOT</version>
    </dependency>
```

System property

```java
System.setProperty("nettyfourone.io.netty.packagePrefix", "nettyfourone");
```


Imports

```java
import netty41.io.netty.....;
```

## Changing version

If you want to upgrade the version of netty here, there are a couple of steps:

### 1. Update the pom

Set the netty version to `4.1.X.Final`

### 2. Update the epoll so.

Download the jar and move the included epoll.so file to `libnettyfouronenetty-transport-native-epoll.so` in the src file.

The convenience script `./update_epoll.sh` was added to make it easy to update the so file. Just run this and it "should work".
