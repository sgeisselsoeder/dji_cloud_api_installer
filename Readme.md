# dji_cloud_api_installer

A quick installer for a minimal working local installation of the dji cloud api.
Works on x86, not on arm v7 or arm v8 cpus (unfortunatelly no raspberries).

## howto

sudo apt install wget unzip docker-compose  
source install.sh  

if everything worked, run the following command in the created subfolder cloud_api_sample to start the docker containers:  
source start.sh

## result

### What works?
- You can add a new dock2.   
- You can send commands to the dock and drone via mqtt.   
- You can listen to the status messages via mqtt.  
- You can obtain live streams from dock and drone  

### What doesn't work?
- DJI Front-End  
- DJI User Management  
- Part of the DJI Backend  
(Actually, most services do work with a few more tweaks, but they are at least partially outdated anyways)
