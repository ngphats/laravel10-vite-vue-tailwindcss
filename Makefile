#!make
export

DOCKER_COMPOSE=docker compose -f "docker-compose.yml"

build:			## Builds Docker images for the project
	@${DOCKER_COMPOSE} build

up:				## Starts all containers
	@${DOCKER_COMPOSE} up -d

down: 			## Stops all containers
	@${DOCKER_COMPOSE} down

exec:
	@${DOCKER_COMPOSE} exec app sh

install:
	@${DOCKER_COMPOSE} exec app composer install
	@${DOCKER_COMPOSE} exec app php artisan key:generate
	@${DOCKER_COMPOSE} exec app php artisan migrate