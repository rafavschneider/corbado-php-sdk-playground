USER_ID=$(shell id -u)
GROUP_ID=$(shell id -g)
CORBADO_USER ?= default_user
CORBADO_PASSWORD ?= default_password

export USER_ID
export GROUP_ID
export CORBADO_USER
export CORBADO_PASSWORD

composer-install:
	docker compose run --rm -ti -u $$USER_ID:$$GROUP_ID corbado-sdk-php-version-requirement composer install

run-bash:
	docker compose run --rm -ti -u $$USER_ID:$$GROUP_ID corbado-sdk-php-version-requirement

test:
	docker compose run --rm \
		-u $$USER_ID:$$GROUP_ID \
		-e CORBADO_USER=$$CORBADO_USER \
		-e CORBADO_PASSWORD=$$CORBADO_PASSWORD \
		corbado-sdk-php-version-requirement php index.php

start-detached:
	docker compose up -d

down:
	docker compose down