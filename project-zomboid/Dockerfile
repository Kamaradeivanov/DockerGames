#Use the last LTS version of ubuntu
FROM ubuntu:16.04

MAINTAINER kamaradeivanov

######################## Set environment variables #############################
# Server Name
ENV SERVERNAME "pzServer"
# Admin DB Password (required for the first launch)
ENV ADMINPASSWORD "pzPassword"
# Specific UDP Steam port
ENV STEAMPORT 8766
# Game UDP port to accept new player
ENV GAMEPORT 16261
# Game UDP port to allow player to contact the server (by default : 10 player)
ENV PLAYERPORTS 16262-16272
#### ###################################################################### ####


######################## install prerequisite for pz ###########################
# Stop apt-get asking to get Dialog frontend
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies and clean
RUN apt-get update && apt-get install -y \
	lib32gcc1 \
	default-jre \
	curl \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
#### ###################################################################### ####


########################## install and run steam cmd ###########################
# Add the steam user
RUN adduser \
  --disabled-login \
  --shell /bin/bash \
  steam

#Switch to this user
USER steam

# Download and extract steamcmd
RUN mkdir /home/steam/steamcmd &&\
  cd /home/steam/steamcmd &&\
  curl http://media.steampowered.com/installer/steamcmd_linux.tar.gz | tar -vxz

# Always run steam cmd on anonymous, download the app
RUN chmod u+x /home/steam/steamcmd/steamcmd.sh
RUN /home/steam/steamcmd/steamcmd.sh +login anonymous +quit
#### ###################################################################### ####


########################### install project-zomboid ############################
# Create ProjectZomboid folders
RUN mkdir -p /home/steam/Zomboid &&\
	chown steam:steam /home/steam/Zomboid
RUN mkdir -p /home/steam/projectzomboid

# Download the game ProjectZomboid
RUN /home/steam/steamcmd/steamcmd.sh +login anonymous \
		+force_install_dir /home/steam/projectzomboid \
		+app_update 380870 \
		+quit
#### ###################################################################### ####


######################### Specify docker configuration #########################
# Make server port available to host : (10 slots)
EXPOSE ${STEAMPORT}/udp ${GAMEPORT}/udp ${PLAYERPORTS}

# Persistant folder withe server data : /home/steam/Zomboid
VOLUME /home/steam/Zomboid /Games/projectzomboid/server-data
#### ###################################################################### ####


# Select the server as entry point
COPY ./pz-entrypoint.sh /home/steam/ &&\
 	chown steam:steam /home/steam/pz-entrypoint.sh

ENTRYPOINT ["/home/steam/pz-entrypoint.sh"]
