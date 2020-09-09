FROM debian:buster
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
    gcc \
    g++ \
    make \
    php \ 
    gnupg && \
  apt clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


EXPOSE 80
EXPOSE 8080
EXPOSE 5000
EXPOSE 443

CMD ["bash"]
