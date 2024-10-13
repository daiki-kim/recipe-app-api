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

# Create a new Django project
startproject:
	@docker compose run --rm app sh -c "django-admin startproject $(PROJECT_NAME) ."

# Lint the Django project
lint:
	@docker compose run --rm app sh -c "flake8"
	
# Run all tests in the Django project
test:
	@docker compose run --rm app sh -c "python manage.py test"

# Help
help:
	@echo "Django Makefile Usage:"
	@echo "  make build                                        - Build the Docker images"
	@echo "  make up                                           - Run the development server with docker-compose"
	@echo "  make lint                                         - Lint the Django project"
	@echo "  make test                                         - Run the tests"
	@echo "  make startproject PROJECT_NAME=<your_project_name>  - Create a new Django project"
