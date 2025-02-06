# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

Adicionar usuario postgres
```
sudo -u postgres createuser -s postgres
sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD 'postgres';"
```

* Database creation

rodar o comando
```
rake db:create
```

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* Instalar o Docker

* Buidar imagem da Aplicação

* Comandos docker
Builda a imagem (rodar dentro da pasta do projeto)
 ```
 docker-compose build
```

Sobe o container
 ```
 docker-compose up
 ```
 ou
  ```
 docker-compose up -d
```

remove as imagens por ID
 ```
 docker rmi -f < IMAGE_ID >
```

Verifica os container
 ```
 docker ps -a
```

Parar todos os contêineres em execução
```
docker stop $(docker ps -aq)
```

Excluir todos os contêineres parados
```
docker rm -f $(docker ps -aq)
```
