# Docker-Symfony
[Source code](https://github.com/Mugen0815/symfony7)

![build image](https://github.com/Mugen0815/symfony7/actions/workflows/docker-image.yml/badge.svg)

[Dockerhub](https://hub.docker.com/r/mugen0815/symfony7)


Minimalistic Docker environment for symfony 7(https://symfony.com/) 
based on official php-apache-image (https://hub.docker.com/_/php/tags?name=apache)
including:
* Composer
* Symfony-CLI
* Symfony 7 Webapp

with optional components via docker-compose:
* MariaDB


## Requirements
* Linux or WSL2
* Docker version 18.06 or later
* (optional) Traefik 2


## Components
* Apache 2.4
* PHP 8.2
* Composer 2.6
* Symfony-CLI
* Symfony 7 Webapp
* (optional) MariaDB 10.6


## What it does
On startup, creates a symfony 6.3 webapp (configurabale via env-var) using symfony-cli
or calls 'composer install' if app already exists and vendor-folder is missing (for existing projects from git)


## Setting up LOCAL environment
1. git clone git@github.com:Mugen0815/symfony7.git
2. cd symfony7
3. docker compose up -d
4. Go to http://localhost:8080


## Building the image only
1. git clone git@github.com:Mugen0815/symfony7.git
2. cd symfony7
3. docker build . --no-cache
