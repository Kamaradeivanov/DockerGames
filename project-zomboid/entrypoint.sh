#!/bin/bash

#Update the game with the last version
echo "Update the game to the last version after each start/restart"
/home/steam/steamcmd/steamcmd.sh +login anonymous \
		+force_install_dir ${GAME_FOLDER} \
		+app_update ${STEAM_GAME_ID} validate \
		+quit

# Start the server with a specific name and admin password
echo "Start the project-zomboid server named ${SERVER_NAME}"
${GAME_FOLDER}/start-server.sh -SERVER_NAME ${SERVER_NAME} -adminpassword ${ADMIN_PASSWORD}
