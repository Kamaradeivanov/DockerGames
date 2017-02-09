#Starbound - DockerGames project

Docker version of the Starbound steam server.

##Build history
v1.0: First version with steam server Starbound v1.1.1 embedded

##How to use this image
Minimal run
`docker run --name starbound kamaradeivanov/starbound`

Full run
`docker run -d -e SERVERNAME="MyRoxxorServer" -v /My/path/to/My/Config/and/data:/server-data
-p 21025:21025 --name starbound kamaradeivanov/starbound`

- You can map the directory containing server files with -v /my/path:/server-files.  
- TCP Port 21025 need to be bind to allow connection.
- Once you have run the docker for the first time, you can edit your config file in your map directory /server-data. (In Server/starbound_server.config according to https://developer.valvesoftware.com/wiki/7_Days_to_Die_Dedicated_Server)
- SERVERNAME is not the display name of your server, you need to edit /server-data/starbound_server.config.

## Variables
+ __SERVERNAME__
Name of your server (for db & ini file)

## Volumes
+ __/server-files__
Application dir of the server. Contains the mods directory.

## Expose
+ Port : 21025 : server (tcp)
+ Port :  8766 : Steam port (udp)

## Known issues
