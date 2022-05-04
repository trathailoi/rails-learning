.PHONY: all

all: start-dev

preps:
	test -f .env || cp .env.example .env
	docker-compose up -d database

start-dev:
	make preps
	bundle
	rails db:migrate
	rails server

start-dev-docker:
	make preps
	(docker-compose up -d --build) && (docker-compose logs -f web) || (docker-compose down)

clean:
	docker-compose down -v

unit-test:
	make preps
	echo "Running Unit Tests..."
	rails test
	echo "Running Unit Tests DONE!"

unit-test-docker:
	make preps
	echo "Running Unit Tests..."
	docker-compose -f docker-compose.test.yml up -d --build
	docker-compose -f docker-compose.test.yml logs -f web-test
	echo "Running Unit Tests DONE!"
	docker-compose -f docker-compose.test.yml down -v

clean-test-docker:
	docker-compose -f docker-compose.test.yml down -v