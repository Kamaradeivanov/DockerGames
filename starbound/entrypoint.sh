#!/bin/bash

#Install the game with the last version
echo "Install/Update the game to the last version after each start/restart"
/home/steam/steamcmd/steamcmd.sh +login ${STEAM_USER} ${STEAM_PASSWORD} \
		+force_install_dir ${GAME_FOLDER} \
		+app_update ${STEAM_GAME_ID} validate \
		+quit

# Start the server
echo "Start the starbound server"
${GAME_FOLDER}/linux/starbound_server
