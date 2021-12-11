# Copied from https://hub.docker.com/r/phyremaster/papermc/dockerfile

# JRE base
FROM openjdk:17.0.1-slim-buster

# Environment variables
ENV MC_VERSION="1.17.1" \
    PAPER_BUILD="399" \
    MC_RAM="1G" \
    JAVA_OPTS=""

ADD papermc.sh .
RUN apt-get update \
    && apt-get install -y wget \
    && rm -rf /var/lib/apt/lists/*

# Start script
CMD ["sh", "./papermc.sh"]

# Container setup
EXPOSE 25565/tcp
EXPOSE 25565/udp
EXPOSE 19132/udp
VOLUME /papermc
