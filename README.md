# Project Boilerplate

## Required Changes
* `docker-compose.*.yml`: change `project` with actual project name.
* `project/`: change `project` with actual project name.
* `project/celery.py`: change `project` with actual project name.
* `config/settings/base.py`: change `project` with actual project name.
* `config/env/*/.django`: change `project` with actual project name.
* `config/env/*/.postgres`: change `project` with actual project name.
* `Makefile`: change `project` with actual project name.

## Commands
### To add a new package
* put your package name & version in appropriate `config/requirements/*.in` file
* run `make compile.requirements`

### (dev | stage | prod) ENV. Specific Commands
replace * with appropriate ENV. name
* `make *.setup`  : build and start containers
* `make *.build`  : build containers
* `make *.up.d`   : start containers in detached mode
* `make *.up`     : start containers in attached mode
* `make *.down`   : stop containers and remove networks
* `make *.restart`: firsts stop containers then start again
* `make *.logs`   : attach to log console of containers

### Common Commands
* `make dcshell`      : open django container shell
* `make dshell`       : open django shell
* `make ipshell`      : open django ipython shell
* `make dcattach`     : attach to django container
* `make migrate`      : run `makemigrations and migrate` command in django container
* `make collectstatic`: run `collectstatic` command in django container
* `make test`         : run `test` command in django container
* `make psql`         : run `psql` in postgres container
* `make rediscli`     : run `redis cli` in redis container

## Pre Commit Hook Activation
Once requirements are installed, kindly run `pre-commit install`.