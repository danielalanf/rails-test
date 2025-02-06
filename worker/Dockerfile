# syntax=docker/dockerfile:1
# check=error=true

ARG RUBY_VERSION=3.2.2
FROM docker.io/library/ruby:$RUBY_VERSION-slim

RUN apt-get update -q && \
    apt-get upgrade -y && \
    apt-get install -y apt-utils wget gnupg2 libpq-dev vim htop lsb-base lsb-release && \
    rm -rf /var/lib/apt/lists/*

# PostgresSQL
# Baixar a chave pública e armazenar no diretório de chaves do apt
RUN wget -qO /usr/share/keyrings/postgresql-keyring.gpg https://www.postgresql.org/media/keys/ACCC4CF8.asc

# Adicionar o repositório PostgreSQL e referenciar a chave GPG
RUN echo "deb [signed-by=/usr/share/keyrings/postgresql-keyring.gpg] http://apt.postgresql.org/pub/repos/apt bookworm-pgdg main" | tee /etc/apt/sources.list.d/pgdg.list

# Atualizar o apt e instalar os pacotes necessários
RUN apt-get update

RUN apt-get install -y postgresql-14 && \
    rm -rf /var/lib/apt/lists/*

RUN gem install pg

ADD . /home/app/web
WORKDIR /home/app/web

RUN bundle install --jobs 5 --retry 5

COPY ./worker/entrypoint.sh /home/app/web/worker/entrypoint.sh
RUN chmod +x /home/app/web/worker/entrypoint.sh

CMD bash /home/app/web/worker/entrypoint.sh
