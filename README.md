# Installation
## Prerequisites
  * [Git](http://git-scm.com/)
  * [Docker](https://docs.docker.com/get-docker/)

# Clone the project
  `git clone https://github.com/haidang-lhd/dang-app.git`
  
# Add file `.env` to project folder
example data
````
DATABASE_NAME=dang_app_development
DATABASE_TEST_NAME=dang_app_test
DATABASE_USER=dangle
DATABASE_PASSWORD=Haidang_06092000
DATABASE_HOST=database
REDIS_HOST=redis
````

# Run app with docker
`chmod +x ./entrypoints/docker-entrypoint.sh`

`docker-compose up --build`


# Create database
````
docker compose exec app bundle exec rails db:create
docker compose exec app bundle exec rails db:migrate
````


# At this point, the app has been run successfully at
`http://localhost:3000/`

# Run unit test

`docker compose exec app bundle exec rspec spec`


# Check covered test

`open coverage/index.html`
