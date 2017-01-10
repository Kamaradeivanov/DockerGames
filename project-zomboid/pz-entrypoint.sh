#!/bin/bash

#Update the game with the last version
echo "Update projectzomboid to the last version after each start"
/home/steam/steamcmd/steamcmd.sh +login anonymous \
		+force_install_dir /home/steam/projectzomboid \
		+app_update 380870 \
		+quit

# Start the server with a specific name and admin password
echo "Start the project-zomboid server named ${SERVERNAME}"
/home/steam/projectzomboid/start-server.sh -servername ${SERVERNAME} -adminpassword ${ADMINPASSWORD}
