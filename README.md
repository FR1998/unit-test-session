# Project Boilerplate

## Required Changes
* `docker-compose.dev.yml`: change `project` with actual project name.
* `project/`: change `project` with actual project name.
* `project/celery.py`: change `project` with actual project name.
* `config/env/dev/.django`: change `project` with actual project name.
* `config/env/dev/.postgres`: change `project` with actual project name.
* `Makefile`: change `project` with actual project name.

## Commands
### How to add new packages
* put your package name & version in `config/requirements/base.in`
* run `make compile.requirements`

### DEV Specific Commands
* `dev.setup`  : build and start containers
* `dev.build`  : build containers
* `dev.up.d`   : start containers in detached mode
* `dev.up`     : start containers in attached mode
* `dev.down`   : stop containers and remove networks
* `dev.restart`: firsts stop containers then start again
* `dev.logs`   : attach to log console of containers

### Common Commands
* `dcshell`      : open django container shell
* `dshell`       : open django shell
* `ipshell`      : open django ipython shell
* `dcattach`     : attach to django container
* `migrations`   : run django `makemigrations` command in container
* `collectstatic`: run django `collectstatic` command in container
