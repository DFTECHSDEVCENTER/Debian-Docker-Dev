FROM debian:experimental
RUN apt update && apt upgrade -y && apt install tzdata

RUN echo "Asia/Kolkata" | tee /etc/timezone
RUN dpkg-reconfigure --frontend noninteractive tzdata

LABEL maintainer="DFTechs <dftechs@dfcommunity.win>" \
  org.label-schema.name="DFTechs Ubuntu Dev" \
  org.label-schema.vendor="Delta Force Community" \
  org.label-schema.schema-version="1.0"

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm

RUN apt update -y && \
  apt upgrade -y && \
  apt install -y \
    ca-certificates \
    bash \
    curl \
    wget \
    procps \
    apt-utils \
    apt-transport-https \
    iputils-ping \
    bzip2 \
    unzip \
    cron \
    sshpass \
    tree \
    jq \
    git \
    python3 \
    python \
    php \
    gcc \
    g++ \
    make \
    apache2 \
    gnupg && \
  apt clean

# RUN apt-get install software-properties-common -y
# RUN apt-key adv --fetch-keys 'https://mariadb.org/mariadb_release_signing_key.asc' -y
# RUN add-apt-repository 'deb [arch=amd64,i386,ppc64el] https://mirrors.piconets.webwerks.in/mariadb-mirror/repo/10.5/debian buster main' -y

# RUN apt-get install php5-common libapache2-mod-php5 php5-cli

RUN curl -sL https://deb.nodesource.com/setup_lts.x | bash -
RUN apt-get install -y nodejs

RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 80
EXPOSE 8080
EXPOSE 5000
EXPOSE 443

CMD ["bash"]
