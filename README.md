# Client Management System

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
REDIS_HOST=redis`
````

# Run app with docker
`docker-compose up --build`


# Create database
````
docker compose exec app bundle exec rails db:create
docker compose exec app bundle exec rails db:migrate
````


# At this point, the app has been run successfully at
`http://localhost:3000/`


# Make an example request with [postman collection](https://lehaidang-lhd.postman.co/workspace/My-Workspace~12c7ad87-7855-42ba-8474-1c9810864aab/collection/16969059-b50a5ea2-7cd8-4f84-a50a-d92a167eb7b0?action=share&creator=16969059)


# Run unit test

`docker compose exec app bundle exec rspec spec`


# Check covered test

`open coverage/index.html`
