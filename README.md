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
* `*.setup`  : build and start containers
* `*.build`  : build containers
* `*.up.d`   : start containers in detached mode
* `*.up`     : start containers in attached mode
* `*.down`   : stop containers and remove networks
* `*.restart`: firsts stop containers then start again
* `*.logs`   : attach to log console of containers

### Common Commands
* `dcshell`      : open django container shell
* `dshell`       : open django shell
* `ipshell`      : open django ipython shell
* `dcattach`     : attach to django container
* `migrate`      : run `makemigrations and migrate` command in django container
* `collectstatic`: run `collectstatic` command in django container
* `test`         : run `test` command in django container
