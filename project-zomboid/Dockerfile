#Use the last LTS version of ubuntu
FROM ubuntu:16.04

MAINTAINER kamaradeivanov

######################## Set environment variables #############################
# Server Name
ENV SERVERNAME "pzServer"
# Admin DB Password (required for the first launch)
ENV ADMINPASSWORD "pzPassword"
# Specific Steam port
ENV STEAMPORT1 8766
ENV STEAMPORT2 8767
# Game port
ENV GAMEPORT 16261
#### ###################################################################### ####

######################## install prerequisite for pz ###########################
# Stop apt-get asking to get Dialog frontend
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies and clean
RUN apt-get update && apt-get install -y \
	lib32gcc1 \
	default-jre \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
#### ###################################################################### ####

# Add the steam user
RUN adduser \
  --disabled-login \
  --shell /bin/bash \
  steam

#Switch to this user
USER steam

# Create ProjectZomboid folders
RUN mkdir -p /home/steam/Zomboid
RUN mkdir -p /home/steam/projectzomboid

# Download and extract steamcmd
RUN mkdir /home/steam/steamcmd &&\
  cd /home/steam/steamcmd &&\
  wget http://media.steampowered.com/installer/steamcmd_linux.tar.gz | tar -vxz

## Always run steam cmd on anonymous
# First download the app
RUN chmod u+x /home/steam/steamcmd/steamcmd.sh
RUN /home/steam/steamcmd/steamcmd.sh +login anonymous +quit
# Second download the game ProjectZomboid
RUN /home/steam/steamcmd/steamcmd.sh +login anonymous \
		+force_install_dir /home/steam/projectzomboid \
		+app_update 380870 \
		+quit

# Make server port available to host : (10 slots)
# 8766,8767 : steamport
# 16261 : server port : tcp
EXPOSE ${STEAMPORT1}
EXPOSE ${STEAMPORT2}
EXPOSE ${GAMEPORT}

# /home/steam/Zomboid : Server Data
# /home/steam/projectzomboid : Server files & exe
VOLUME /home/steam/Zomboid /Games/projectzomboid/server-data
VOLUME /home/steam/projectzomboid /Games/projectzomboid/server-files

# Update game (with credential) && launch the game.
ENTRYPOINT ["/home/steam/projectzomboid/start-server.sh -servername ${SERVERNAME} -steamport1 ${STEAMPORT1} -steamport2 ${STEAMPORT2} -adminpassword ${ADMINPASSWORD} &"]
