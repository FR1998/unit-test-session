# Project Boilerplate

## Required Changes
* `docker-compose.*.yml`: change `project` with actual project name.
* `project/`: change `project` with actual project name.
* `project/celery.py`: change `project` with actual project name.
* `config/settings/base.py`: change `project` with actual project name.
* `config/env/*/.django`: change `project` with actual project name.
* `config/env/*/.postgres`: change `project` with actual project name.
* `Makefile`: change `project` with actual project name.
* `config/settings/constance.py`: change `project` with actual project name.
* `README.md`: change `<username>` and `<repository>` in "Create Issues" URLs.

## Create Issues
* [create new-feature issue](https://github.com/<username>/<repository>/issues/new?template=new-feature.md)
* [create enhancement issue](https://github.com/<username>/<repository>/issues/new?template=enhancement.md)
* [create bug issue](https://github.com/<username>/<repository>/issues/new?template=bug.md)

## Commands
### To add a new package
* put your package name & version in appropriate `config/requirements/*.in` file
* run `make cr`

### (dev | stage | prod) ENV. Specific Commands
replace * with appropriate ENV. name
* `make *.setup`        : build and start containers
* `make *.build`        : build containers
* `make *.up.d`         : start containers in detached mode
* `make *.up`           : start containers in attached mode
* `make *.down`         : stop containers and remove networks
* `make *.restart`      : firsts stop containers then start again
* `make *.logs`         : attach to log console of containers
* `make *.dcshell`      : open django container shell
* `make *.dshell`       : open django shell
* `make *.ipshell`      : open django ipython shell
* `make *.migrate`      : run `makemigrations and migrate` command in django container
* `make *.collectstatic`: run `collectstatic` command in django container
* `make *.test`         : run `test` command in django container
* `make *.psql`         : run `psql` in postgres container
* `make *.rediscli`     : run `redis cli` in redis container

### Common Commands
* `make cr`             : compile requirements
* `make *.attach`       : attach to specified container

## Pre Commit Hook Activation
Once requirements are installed, kindly run `pre-commit install`.

## Enable SSL with Certbot
### (stage|prod)
* update `(stage|prod)-init-letsencrypt.sh`
* update domains
* by default following command will run in test mode
  * `sudo ./(stage|prod)-init-letsencrypt.sh`
* once confirmed update `staging=0` in `(stage|prod)-init-letsencrypt.sh` and then run
  * `sudo ./(stage|stage)-init-letsencrypt.sh`
* uncomment lines in `certbot` and `nginx` services in `docker-compose.(stage|prod).py` 
