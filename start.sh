#!/bin/bash

mkdir -p gitea
mkdir -p gitea/postgres
mkdir -p gitea/data
mkdir -p gitea/config

chmod -R 777 gitea

docker compose up -d