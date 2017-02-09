# Starbound - DockerGames project

Docker version of the Starbound steam server.

## Build history
v1.0: First version with steam server Starbound v1.1.1 embedded

## How to use this image
Minimal run
`docker run -d -e STEAM_USER="steam_account" -e STEAM_PASSWORD="my_password" --name starbound kamaradeivanov/starbound`

Full run
`docker run -d -e STEAM_USER="steam_account" -e STEAM_PASSWORD="my_password" -v /srv/game/starbound:/home/steam/starbound
-p 21025:21025 --name starbound kamaradeivanov/starbound`

- You can map the directory containing server files with -v /my/path:/server-files.  
- TCP Port 21025 need to be bind to allow connection.
- Once you have run the docker for the first time, you can edit your config file in your map directory /server-data. (In Server/starbound_server.config according to http://starbounder.org/Guide:LinuxServerSetup)
- SERVERNAME is not the display name of your server, you need to edit /home/steam/starbound/starbound_server.config.

## Variables
+ __STEAM_USER__
User of the steam account used to download the server (this game have no anonymous access on steamcmd)
+ __STEAM_PASSWORD__
Password of the steam account used to install the game

## Volumes
+ __/server-files__
Application dir of the server. Contains the mods directory.

## Expose
+ Port : 21025 : server (tcp)

## Known issues
