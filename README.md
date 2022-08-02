# README

## Starting the application

To run the application using Docker, will need to have Docker installed on your machine. 
[Get Docker](https://docs.docker.com/get-docker/)

The first time you start the app, you will need to create a .env file. Copy the .env-example to .env

```bash
cp .env-example .env
```

Once Docker is installed and running:

```bash
docker compose up
```

The first time you start your app, you will need to create a database

```bash
docker compose run web rake db:create
```

You can view the app in the browser at `http://localhost:3000/`

## Running the test suite

You can run the test suite from inside the web container

```bash
docker compose exec web bash
```

```bash
bundle exec rspec
```

## Linting

This app has rubocop installed. To run linting inside the web container:

```bash
docker compose exec web bash
```

```bash
bundle exec rubocop
```
