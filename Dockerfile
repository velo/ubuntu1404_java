FROM shippableimages/ubuntu1404_base:0.0.1

RUN echo "debconf shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections;
RUN echo "debconf shared/accepted-oracle-license-v1-1 seen true" | debconf-set-selections;
RUN add-apt-repository ppa:webupd8team/java;
RUN apt-get update &&  apt-get install -y \
    openjdk-6-jdk \
    openjdk-7-jdk \
    oracle-java7-installer \
    oracle-java8-installer;

CMD ["/bin/bash"]
