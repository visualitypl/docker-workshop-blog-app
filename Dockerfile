FROM ruby:2.4

ENV RAILS_ENV production

RUN apt-get update -qq && apt-get install -y libpq-dev nodejs netcat

RUN mkdir /blog

WORKDIR /blog

COPY Gemfile .
COPY Gemfile.lock .
RUN bundle install --without test development

COPY . .
RUN bundle exec rails assets:precompile

RUN chmod +x launch.sh

CMD ./launch.sh
