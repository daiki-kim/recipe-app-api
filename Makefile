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
lint
	@docker compose run --rm app sh -c "flake8"
	
# Run all tests in the Django project
test:
	@docker compose run --rm app sh -c "python manage.py test"

# Create a new Django app within the project
startapp:
	@python manage.py startapp $(APP_NAME)

# Run the development server (default: port 8000)
runserver:
	@python manage.py runserver

# Create migration files based on model changes
makemigrations:
	@python manage.py makemigrations

# Apply migrations to the database
migrate:
	@python manage.py migrate

# Create a superuser for the Django admin
createsuperuser:
	@python manage.py createsuperuser

# Open the Django shell
shell:
	@python manage.py shell

# Run the tests
test:
	@python manage.py test

# Collect static files
collectstatic:
	@python manage.py collectstatic --noinput

# Change password for a specified user
changepassword:
	@python manage.py changepassword $(USER_NAME)

# Help
help:
	@echo "Django Makefile Usage:"
	@echo "  make build                                        - Build the Docker images"
	@echo "  make up                                           - Run the development server with docker-compose"
	@echo "  make lint                                         - Lint the Django project"
	@echo "  make test                                         - Run the tests"
	@echo "  make startproject PROJECT_NAME=<your_project_name>  - Create a new Django project"
	@echo "  make startapp APP_NAME=<your_app_name>            - Create a new Django app"
	@echo "  make runserver                                    - Run the Django development server"
	@echo "  make makemigrations                               - Create migration files"
	@echo "  make migrate                                      - Apply migrations"
	@echo "  make createsuperuser                              - Create a Django superuser"
	@echo "  make shell                                        - Open the Django shell"
	@echo "  make test                                         - Run the tests"
	@echo "  make collectstatic                                - Collect static files"
	@echo "  make changepassword USER_NAME=<your_username>     - Change a user's password"