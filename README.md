ubuntu1404_java
===============

Shippable CI image for Java on Ubuntu 14.04. Available jdk versions:

1. openjdk6
2. openjdk7
3. oraclejdk7
4. oraclejdk8

## How to use
You can use this image to run java builds on Shippable. Just update your
`shippable.yml` file and add the `build_image` directive. You should also
activate the appropriate virtual envrionment so your build runs against the
correct version of jdk. You can use `$SHIPPABLE_JDK_VERSION` environment
variable to specify jdk versions. Here's a sample YML file to get you going:

````
language: java
jdk:
   - openjdk6
   - openjdk7
   - oraclejdk7
   - oraclejdk8

build_image: shippableimages/ubuntu1404_java

before_install:
   - apt-get install -y maven
   
before_script:
   - if [[ $SHIPPABLE_JDK_VERSION == "openjdk7" ]] ; then export JAVA_HOME="/usr/lib/jvm/java-7-openjdk-amd64"; export PATH="$PATH:/usr/lib/jvm/java-7-openjdk-amd64/bin"; export java_path="/usr/lib/jvm/java-7-openjdk-amd64/jre/bin/java"; fi
   - if [[ $SHIPPABLE_JDK_VERSION == "oraclejdk7" ]] ; then export JAVA_HOME="/usr/lib/jvm/java-7-oracle"; export PATH="$PATH:/usr/lib/jvm/java-7-oracle/bin"; export java_path="/usr/lib/jvm/java-7-oracle/jre/bin/java"; fi
   - if [[ $SHIPPABLE_JDK_VERSION == "openjdk6" ]] ; then export JAVA_HOME="/usr/lib/jvm/java-6-openjdk-amd64"; export PATH="$PATH:/usr/lib/jvm/java-6-openjdk-amd64/bin"; export java_path="/usr/lib/jvm/java-6-openjdk-amd64/jre/bin/java"; fi
   - if [[ $SHIPPABLE_JDK_VERSION == "oraclejdk8" ]] ; then export JAVA_HOME="/usr/lib/jvm/java-8-oracle"; export PATH="$PATH:/usr/lib/jvm/java-8-oracle/bin"; export java_path="/usr/lib/jvm/java-8-oracle/jre/bin/java"; fi
   - update-alternatives --set java $java_path
   - java -version

script:
   - mvn test

````
