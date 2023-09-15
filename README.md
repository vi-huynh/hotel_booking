# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version 3.0 

* System dependencies 
  Ruby on rails 7.0 
  Postgresql 

* Configuration

* Database creation
docker compose exec web bin/rails db:create 

* Database initialization
docker compose exec web bin/rails db:seed 

* How to run the test all app 
docker compose exec web rspec

* How to run the test on each packs
docker compose exec web rspec packs/

### Start web application 
`docker compose up `

### Run rails command  
`docker compose exec web bin/rails $command`

### Run rails console 
`docker compose exec web bin/rails c `

### Generate diagram packages 
`docker compose exec web rake pocky:generate`

### Generates dependency graphs for your packwerk packages
$ docker compose exec web rake pocky:generate



