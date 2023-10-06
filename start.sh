#!/bin/bash

mkdir -p gitea
mkdir -p gitea/postgres
mkdir -p gitea/data
mkdir -p gitea/config
mkdir -p backups
mkdir -p backups/gitea-data
mkdir -p backups/gitea-database
mkdir -p backups/temp-postgres

chmod -R 777 gitea
chmod -R 777 backups

docker compose up -d