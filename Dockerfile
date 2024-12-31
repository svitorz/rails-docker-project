
# Use uma imagem oficial do Ruby
FROM ruby:3.2

# Instale dependências do sistema necessárias
RUN apt-get update -qq && apt-get install -y build-essential libsqlite3-dev nodejs yarn

# Configure o diretório de trabalho
WORKDIR /app

# Copie o Gemfile e o Gemfile.lock para o container
COPY Gemfile Gemfile.lock /app/

# Instale as gems
RUN bundle install

# Copie o restante da aplicação
COPY . /app

# Exponha a porta padrão do Rails
EXPOSE 3000

# Comando padrão para rodar o servidor
CMD ["rails", "server", "-b", "0.0.0.0"]

