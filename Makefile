SHELL=/bin/bash


cr_compose     := docker-compose -f docker-compose.cr.yml
dev_compose    := docker-compose -f docker-compose.yml -f docker-compose.cert.yml --env-file config/env/.dev
stage_compose  := docker-compose -f docker-compose.yml -f docker-compose.cert.yml --env-file config/env/.stage
prod_compose   := docker-compose -f docker-compose.yml -f docker-compose.cert.yml --env-file config/env/.prod
test_compose   := docker-compose -f docker-compose.yml --env-file config/env/.test
success        := success

%.all: %.build %.up.d
	@echo $(success)

%.deploy: %.build %.down %.up.d %.migrate %.collectstatic
	@echo $(success)

%.build:
	@$($*_compose) build

%.up:
	@$($*_compose) up

%.up.d:
	@$($*_compose) up -d

%.down:
	@$($*_compose) down --remove-orphans

%.restart:
	@$($*_compose) restart

%.logs:
	@$($*_compose) logs -f

cr:
	@$($@_compose) up --build

%.dcshell:
	@$($*_compose) exec django /bin/bash

%.dshell:
	@$($*_compose) exec django python manage.py shell

%.ipshell:
	@$($*_compose) exec django python manage.py shell -i ipython

%.attach:
	@docker attach $*

%.migrate:
	@$($*_compose) exec django python manage.py makemigrations
	@$($*_compose) exec django python manage.py migrate

%.collectstatic:
	@$($*_compose) exec django python manage.py collectstatic --noinput

test:
	@$($@_compose) up --build -d django
	@$($@_compose) exec -T django python manage.py migrate
	@$($@_compose) exec -T django python manage.py collectstatic --no-input
	@$($@_compose) exec -T django python -m coverage run --source='.' manage.py test --settings=config.settings.test --no-input
	@$($@_compose) exec -T django python -m coverage html -d ./data/htmlcov
	@$($@_compose) down --remove-orphans

%.psql:
	@$($*_compose) exec postgres psql -U postgres

%.rediscli:
	@$($*_compose) exec redis redis-cli -h redis
