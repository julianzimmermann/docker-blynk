# Docker Setup for Blynk

## Setup

* rename `.env.dist` to `.env` and adjust env variables to your need

Templates for configuration are stored in ./config/templates. At the moment, this setup only uses the `mail.properties.template` and `server.properties.template` for configuration. Please keep in mind that at every start for the blynk container, the configuration would be overwritten with values from the .env file. Every change to the configuration via the blynk admin panel (https://blynk.dev.local:9443/admin) would be lost. So if you are doing changes via admin panel, please add them to your .env file!

## Configuration

### Mail
At the moment there are only smtp servers of gmail allowed! [Blynk ref](https://github.com/blynkkk/blynk-server#enabling-mail-on-local-server) 
For this you have to allow less secure apps. You can do it [here](https://www.google.com/settings/security/lesssecureapps)

## Build

`docker-compose up -d --build`

## Run

`docker-compose up -d` or `docker-compose start` 