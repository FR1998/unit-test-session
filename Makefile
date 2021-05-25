REQ_FILES = \
	config/requirements/base \
	config/requirements/dev

compile.requirements:
	for f in $(REQ_FILES); do \
  		pip-compile --generate-hashes -o $$f.txt $$f.in || exit 1; \
	done

dev.setup: dev.build dev.up

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

dcshell:
	@docker exec -it project-dc01 /bin/bash

dshell:
	@docker exec -it project-dc01 python manage.py shell

ipshell:
	@docker exec -it project-dc01 python manage.py shell -i ipython

dcattach:
	@docker attach project-dc01

migrations:
	@docker exec -it project-dc01 python manage.py makemigrations

migrate:
	@docker exec -it project-dc01 python manage.py migrate

collectstatic:
	@docker exec -it project-dc01 python manage.py collectstatic

test:
	@docker exec -it project-dc01 python manage.py test
