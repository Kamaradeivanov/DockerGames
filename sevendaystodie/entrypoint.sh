#!/bin/bash

#Update the game with the last version
echo "Update the game to the last version after each start/restart"
/home/steam/steamcmd/steamcmd.sh +login anonymous \
		+force_install_dir ${GAME_FOLDER} \
		+app_update ${STEAM_GAME_ID} validate \
		+quit

# Start the server
echo "Start the 7daystodieserver server named ${SERVER_NAME}"
${GAME_FOLDER}/start 7daystodieserver -logfile 7DaysToDieServer_Data\output_log.txt -quit -batchmode -nographics -configfile=serverconfig.xml -dedicated
