#!/bin/bash

# wait for database container
while ! nc -z db 5432; do sleep 3; done

bundle exec rails db:migrate
bundle exec puma -C config/puma.rb
