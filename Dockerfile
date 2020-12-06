FROM ubuntu:latest

RUN apt-get update \
    && apt-get install -y software-properties-common \
    && add-apt-repository ppa:openjdk-r/ppa \
    && apt-get install -y openjdk-11-jdk \
    libxrender1 \
    iptables \
    gettext \
    maven \
    wget \
    zsh \
    git \
    vim

RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true

COPY ./config/server.properties.template /etc/blynk/config/server.properties.template
COPY ./docker-entrypoint/blynk.sh /usr/local/bin/docker-entrypoint.sh

RUN wget https://github.com/blynkkk/blynk-server/releases/download/v0.41.13/server-0.41.13-java8.jar \
    && mkdir -p /blynk/data \
    && mkdir -p /blynk/config \
    && mkdir -p /blynk/log \
    && chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]

CMD java -jar server-0.41.13-java8.jar -dataFolder /blynk/data -serverConfig /blynk/config/server.properties