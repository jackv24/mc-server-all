#!/bin/bash

# Copied from https://github.com/Phyremaster/papermc-docker/blob/master/papermc.sh

# Enter server directory
mkdir -p papermc
cd papermc

JAR_NAME=papermc-${MC_VERSION}-${PAPER_BUILD}

# Perform initial setup
if [ ! -e ${JAR_NAME}.jar ] || [ ${PAPER_BUILD} = latest ]
  then
    wget https://papermc.io/api/v1/paper/${MC_VERSION}/${PAPER_BUILD}/download -O ${JAR_NAME}.jar
    if [ ! -e eula.txt ]
    then
      java -jar ${JAR_NAME}.jar
      sed -i 's/false/true/g' eula.txt
    fi
fi

# Download plugins before first start
mkdir -p plugins
cd plugins

if [ ! -e Geyser-Spigot.jar ]
  then
    wget https://ci.nukkitx.com/job/GeyserMC/job/Geyser/job/master/lastSuccessfulBuild/artifact/bootstrap/spigot/target/Geyser-Spigot.jar -O Geyser-Spigot.jar
fi

# Plugin downloads finished
cd ..

# Start server
java -server -Xms${MC_RAM} -Xmx${MC_RAM} ${JAVA_OPTS} -jar ${JAR_NAME}.jar nogui
