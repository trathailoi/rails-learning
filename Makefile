.PHONY: all

all: start-dev

preps:
	test -f .env.local || cp .env.development .env.development.local
	docker-compose --env-file .env.development.local up -d database

preps-test:
	test -f .env.test.local || cp .env.test .env.test.local
	docker-compose --env-file .env.test.local -f docker-compose.test.yml up -d database-test

start-dev:
	make preps
	bundle
	rails db:migrate
	rails server

start-dev-docker:
	make preps
	(docker-compose --env-file .env.development.local up -d --build) && (docker-compose logs -f web) || (docker-compose down)

clean:
	docker-compose down -v

unit-test:
	make preps-test
	@echo "Running Unit Tests..."
	(rails test) || true
	@echo "Running Unit Tests DONE!"
	make clean-test

unit-test-docker:
	make preps-test
	@echo "Running Unit Tests..."
	docker-compose --env-file .env.test.local -f docker-compose.test.yml up -d --build
	docker-compose -f docker-compose.test.yml logs -f web-test
	@echo "Running Unit Tests DONE!"
	make clean-test

clean-test:
	@echo "Cleanup Unit Tests DB..."
	docker-compose -f docker-compose.test.yml down -v
	@echo "Cleanup Unit Tests DB DONE!"