SHELL=/bin/bash

REQ_FILES = \
	config/requirements/base   \
	config/requirements/dev    \
	config/requirements/stage  \
	config/requirements/prod

compile.requirements:
	@python3 -m venv .venv
	@. .venv/bin/activate
	@pip3 install pip-tools
	for f in $(REQ_FILES); do \
		pip-compile --generate-hashes -o $$f.txt $$f.in || exit 1; \
	done
	@rm -rf .venv

dev.all: dev.build dev.up
dev.deploy: dev.build dev.down dev.up.d migrate collectstatic

dev.build:
	@docker-compose -f docker-compose.dev.yml build

dev.up.d:
	@docker-compose -f docker-compose.dev.yml up -d

dev.up:
	@docker-compose -f docker-compose.dev.yml up

dev.down:
	@docker-compose -f docker-compose.dev.yml down --remove-orphans

dev.restart:
	@docker-compose -f docker-compose.dev.yml restart

dev.logs:
	@docker-compose -f docker-compose.dev.yml logs -f

stage.all: stage.build stage.up
stage.deploy: stage.build stage.down stage.up.d migrate collectstatic

stage.build:
	@docker-compose -f docker-compose.stage.yml build

stage.up.d:
	@docker-compose -f docker-compose.stage.yml up -d

stage.up:
	@docker-compose -f docker-compose.stage.yml up

stage.down:
	@docker-compose -f docker-compose.stage.yml down --remove-orphans

stage.restart:
	@docker-compose -f docker-compose.stage.yml restart

stage.logs:
	@docker-compose -f docker-compose.stage.yml logs -f

prod.all: prod.build prod.up
prod.deploy: prod.build prod.down prod.up.d migrate collectstatic

prod.build:
	@docker-compose -f docker-compose.prod.yml build

prod.up.d:
	@docker-compose -f docker-compose.prod.yml up -d

prod.up:
	@docker-compose -f docker-compose.prod.yml up

prod.down:
	@docker-compose -f docker-compose.prod.yml down --remove-orphans

prod.restart:
	@docker-compose -f docker-compose.prod.yml restart

prod.logs:
	@docker-compose -f docker-compose.prod.yml logs -f

dcshell:
	@docker exec -it project-dc01 /bin/bash

dshell:
	@docker exec -it project-dc01 python manage.py shell

ipshell:
	@docker exec -it project-dc01 python manage.py shell -i ipython

dcattach:
	@docker attach project-dc01

migrate:
	@docker exec -it project-dc01 python manage.py makemigrations
	@docker exec -it project-dc01 python manage.py migrate

collectstatic:
	@docker exec -it project-dc01 python manage.py collectstatic --noinput

test:
	@docker exec -it project-dc01 python manage.py test --settings=config.settings.test

psql:
	@docker exec -it project-pc01 psql -U postgres

rediscli:
	@docker exec -it project-rc01 redis-cli -h redis
