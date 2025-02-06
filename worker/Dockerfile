from ruby:3.2.2

RUN apt-get update -q && \
    apt-get upgrade -y && \
    apt-get install -y curl apt-utils wget gnupg2 ca-certificates libpq-dev vim htop lsb-base lsb-release && \
    rm -rf /var/lib/apt/lists/*

# PostgresSQL
# Criar o diretório keyrings se não existir
RUN mkdir -p /etc/apt/keyrings

# Baixa e armazena a chave pública corretamente
RUN curl -fsSL https://www.postgresql.org/media/keys/ACCC4CF8.asc | gpg --dearmor -o /etc/apt/keyrings/postgresql-keyring.gpg

# Adiciona o repositório PostgreSQL referenciando a chave corretamente
RUN echo "deb [signed-by=/etc/apt/keyrings/postgresql-keyring.gpg] http://apt.postgresql.org/pub/repos/apt bookworm-pgdg main" > /etc/apt/sources.list.d/pgdg.list

# Atualizar o apt e instalar os pacotes necessários
RUN apt-get update

RUN apt-get install -y postgresql && \
    rm -rf /var/lib/apt/lists/*

ADD . /home/app/web
WORKDIR /home/app/web

RUN gem install bundler -v 2.6.3

RUN bundle install --jobs 5 --retry 5

COPY ./worker/entrypoint.sh /home/app/web/worker/entrypoint.sh
RUN chmod +x /home/app/web/worker/entrypoint.sh

CMD bash /home/app/web/worker/entrypoint.sh
