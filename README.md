# Project Boilerplate

## Required Changes

- `project/`: change `project` with actual project name.
- `project/celery.py`: change `project` with actual project name.
- `config/settings/base.py`: change `project` with actual project name.
- `config/env/.(env|stage|prod)`: change `project` with actual project name.
- `setup.cfg`: change `project` with actual project name.
- `README.md`: change `<username>` and `<repository>` in "Create Issues" URLs.
- `tasks.yml`: change following in ansible-playbook
  - `<host-group-name>`: specify host group name
  - `<repo-url>`: specify repository URL
  - `<branch-name>`: specify branch name
  - `<project-dir>`: specify project directory/path to clone into
  - `<make-target>`: specify target name for `make` command
  - `<env-name>`: specify environment name
- `README.md`: remove section "Required Changes"
### Pre Commit Hook

- Install pre-commit package: `pip3 install pre-commit`
- Activate pre-commit hook: `pre-commit install`

## Create Issues

- [create new-feature issue](https://github.com/<username>/<repository>/issues/new?template=new-feature.md)
- [create enhancement issue](https://github.com/<username>/<repository>/issues/new?template=enhancement.md)
- [create bug issue](https://github.com/<username>/<repository>/issues/new?template=bug.md)

## Commands

### To add a new package

- put your package name & version in appropriate `config/requirements/*.in` file
- run `make cr`

### (dev | stage | prod) ENV. Specific Commands

replace \* with appropriate ENV. name

- `make *.setup` : build and start containers
- `make *.build` : build containers
- `make *.up.d` : start containers in detached mode
- `make *.up` : start containers in attached mode
- `make *.down` : stop containers and remove networks
- `make *.restart` : firsts stop containers then start again
- `make *.logs` : attach to log console of containers
- `make *.dcshell` : open django container shell
- `make *.dshell` : open django shell
- `make *.ipshell` : open django ipython shell
- `make *.migrate` : run `makemigrations and migrate` command in django container
- `make *.collectstatic`: run `collectstatic` command in django container
- `make *.test` : run `test` command in django container
- `make *.psql` : run `psql` in postgres container
- `make *.rediscli` : run `redis cli` in redis container

### Common Commands

- `make cr` : compile requirements
- `make *.attach` : attach to specified container

## Enable SSL with Certbot

### (stage|prod)

- update domains in `config/nginx/conf.(stage|prod)`
- run `make (stage|prod).up`
- run `make (stage|prod).down`
- uncomment `certbot` service in `docker-compose.cert.yml`
- uncomment `./data/certbot` volumes in `docker-compose.cert.yml` for `nginx` service
- uncomment `acme-challenge` path in `config/nginx/conf.(stage|prod)`
- uncomment ssl configs in `config/nginx/conf.(stage|prod)`
- update domains in `init-letsencrypt.sh`
- run `sudo ./init-letsencrypt.sh`, it will fetch dummy certificates
- update `staging=0` in `init-letsencrypt.sh`
- run `sudo ./init-letsencrypt.sh`, it will fetch real certificates
- uncomment `entrypoint` in `docker-compose.cert.yml` for `certbot` service
- uncomment `command` in `docker-compose.cert.yml` for `nginx` service
