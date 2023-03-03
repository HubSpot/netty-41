# Netty41

Netty 4.1 without netty conflicting with netty 4.0

## Usage

Maven:

```xml
    <dependency>
      <groupId>com.hubspot</groupId>
      <artifactId>netty-all-41</artifactId>
      <version>4.1.89-SNAPSHOT</version>
      <classifier>shaded</classifier>
    </dependency>
```

Imports

```java
import nettyfourone.io.netty.....;
```

## Changing version

If you want to upgrade the version of netty here, there are a couple of steps:

### 1. Update the pom

Set the netty version to `4.1.X.Final`
