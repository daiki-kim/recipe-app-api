# Variables (can be overridden via command line)
PROJECT_NAME ?= myproject
APP_NAME ?= myapp
USER_NAME ?= admin

# Build the Docker images
build:
	@docker compose build

# Run the development server with docker-compose
up:
	@docker compose up
	
# Clear the containers
down:
	@docker compose down

# Create a new Django project
startproject:
	@docker compose run --rm app sh -c "django-admin startproject $(PROJECT_NAME) ."
	
# Create a new Django app
startapp:
	@docker compose run --rm app sh -c "django-admin startapp $(APP_NAME)"

# Lint the Django project
lint:
	@docker compose run --rm app sh -c "flake8"
	
# Run all tests in the Django project
test:
	@docker compose run --rm app sh -c "python manage.py test"

# Run all tests in the Django project
waitdb-test:
	@docker compose run --rm app sh -c "python manage.py wait_for_db && python manage.py test"

# Help
help:
	@echo "Django Makefile Usage:"
	@echo "  make build                                        - Build the Docker images"
	@echo "  make up                                           - Run the development server with docker-compose"
	@echo "  make down                                         - Clear the containers"
	@echo "  make startproject PROJECT_NAME=<your_project_name>  - Create a new Django project"
	@echo "  make startapp APP_NAME=<your_app_name>             - Create a new Django app"
	@echo "  make lint                                         - Lint the Django project"
	@echo "  make test                                         - Run the tests"
