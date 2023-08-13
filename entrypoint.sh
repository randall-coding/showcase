#!/bin/bash

# Precompile Rails assets
rm /app/tmp/pids/server.pid
RAILS_ENV=production bundle exec rake assets:clean
RAILS_ENV=production bundle exec rake assets:precompile
# Run server
RAILS_ENV=production bundle exec rails server -b 0.0.0.0

