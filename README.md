# Gitea Deployment

## Overview
This repo contains the docker compose setup for Auroria project's self-hosted Git repositiory.

## Installation
The steps:
- Acquire a cloud server and S3-compatible storage option.
- Make sure the IP is set in DNS for all subdomains.
- Clone this repo into a folder.
- Modify the `.env` file with the require configurations, particularly login credentials and S3 setup.
- If restoring from a backup, restore the data folders (see below).
- (First time installation) Run `install-docker.sh` to install the required dependencies.
- (First time installation) Restart server to ensure docker is running.
- Run `start.sh` to start the docker images.
- Wait at least 2 minutes for all the services to boot up.
- In the first run, execute a command to create an admin user.

Command to create admin user:
```shell
docker exec -it gitea-gitea sh -c "gitea admin user create --username admin1 --password theadmin --email admin1@lol.kek --admin"
```

## Docker setup
The rootless version of the Gitea image is required in order to run the shell command to create admin user, as registration has been disabled.

## Important information
Make sure that you do not lose the SECRET_KEY, JWT_SECRET and INTERNAL_TOKEN.

To generate the keys:
```shell
docker run -it --rm gitea/gitea:1 gitea generate secret SECRET_KEY
docker run -it --rm gitea/gitea:1 gitea generate secret JWT_SECRET
docker run -it --rm gitea/gitea:1 gitea generate secret INTERNAL_TOKEN
```

To perform health check:
```shell
docker exec -it giteacontainer sh -c "curl -f http://localhost:3000/api/healthz"
```

For command string in `docker-compose.yml`, the substitution method is unintuitive, as it does not read from the `environment:` section and instead read from environment veriables directly, which requires adding those variables to the `.env` file.

## TODO

Check
```
Locking support detected on remote "origin". Consider enabling it with:
  $ git config lfs.https://gitea.owncloud.test/admin1/testrepo.git/info/lfs.locksverify true
```

## Documentation
- [Sample compose](https://github.com/heyValdemar/gitea-traefik-letsencrypt-docker-compose)
- [Gitea docker doc](https://docs.gitea.com/installation/install-with-docker-rootless)
- [Gitea config doc](https://docs.gitea.com/administration/config-cheat-sheet)
- [Gitea full ini](https://github.com/go-gitea/gitea/blob/main/custom/conf/app.example.ini)