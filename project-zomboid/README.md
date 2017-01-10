#Project Zomboid - DockerGames project

Docker version of the project-zomboid steam server.

##Build history
v1.0: First version with steam server project-zomboid v0.42 embedded

##How to use this image
Minimal run
`docker run --name project-zomboid kamaradeivanov/project-zomboid`

Full run
`docker run -d -e SERVERNAME="pzServer" -e ADMINPASSWORD="pzPassword" -v /My/path/to/My/Config/and/data:/server-data -p 8766:8766/udp -p 16261:16261/udp -p 16262-16272:16262-16272 --name project-zomboid kamaradeivanov/project-zomboid`

- You can map the directory containing server files with -v /my/path:/server-files.  
- You need to bind X ports for client connection. (Example : If you have 10 slots, you need to put -p 16262-16272:16262-16272, if you have 100 slots, you need to put -p 16262-16362:16262-16362).
- Port 16261 need to be bind in tcp AND udp.
- Once you have run the docker for the first time, you can edit your config file in your map directory /server-data. (In Server/$SERVERNAME.ini)
- SERVERNAME is not the display name of your server, you need to edit /server-data/Server/$SERVERNAME.ini.

## Variables
+ __SERVERNAME__
Name of your server (for db & ini file)
+ __ADMINPASSWORD__
Admin password on your server

## Volumes
+ __/server-data__
Data dir of the server. Contains db, config files...
+ __/server-files__
Application dir of the server. Contains the mods directory.

## Expose
+ Port : 16261 : server (udp)
+ Port :  8766 : Steam port (udp)
+ Ports: 16262-162XX : clients slots (depends on the number of player you want).

## Known issues
