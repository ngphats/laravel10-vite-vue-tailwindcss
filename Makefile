#!make
export

DOCKER_COMPOSE=docker compose -f "docker-compose.yml"

install:
	@cp ./.env.example ./.env
	@${DOCKER_COMPOSE} build
	@${DOCKER_COMPOSE} up -d
	@${DOCKER_COMPOSE} exec app composer install
	@${DOCKER_COMPOSE} exec app php artisan key:generate
	@${DOCKER_COMPOSE} exec app php artisan migrate

build:			## Builds Docker images for the project
	@${DOCKER_COMPOSE} build

up:				## Starts all containers
	@${DOCKER_COMPOSE} up -d

down: 			## Stops all containers
	@${DOCKER_COMPOSE} down

exec:
	@${DOCKER_COMPOSE} exec app sh
