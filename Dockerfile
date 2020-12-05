FROM ubuntu:latest

RUN apt-get update \
    && apt-get install -y software-properties-common \
    && add-apt-repository ppa:openjdk-r/ppa \
    && apt-get install -y openjdk-11-jdk \
    libxrender1 \
    iptables \
    maven \
    wget \
    zsh \
    git \
    vim

RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true

RUN wget https://github.com/blynkkk/blynk-server/releases/download/v0.41.13/server-0.41.13-java8.jar
RUN mkdir blynk

CMD java -jar server-0.41.13-java8.jar -dataFolder /blynk