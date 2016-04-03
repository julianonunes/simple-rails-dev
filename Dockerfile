FROM ruby:2.3
MAINTAINER Juliano Nunes <julianonunes@live.com>

RUN apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y mysql-client --no-install-recommends && rm -rf /var/lib/apt/lists/*

ENV RAILS_VERSION 4.2.6

RUN gem install rails --version "$RAILS_VERSION"

RUN mkdir -p /var/app
WORKDIR /var/app

RUN rails new .

EXPOSE 3000

# Configure an entry point, so we don't need to specify 
# "bundle exec" for each of our commands.
ENTRYPOINT ["bundle", "exec"]

# The main command to run when the container starts. Also 
# tell the Rails dev server to bind to all interfaces by 
# default.
CMD ["rails", "server", "-b", "0.0.0.0"]
