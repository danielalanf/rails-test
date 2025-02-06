# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

Adicionar usuario postgres
sudo -u postgres createuser -s postgres
sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD 'postgres';"

* Database creation

rodar o comando: rake db:create

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
