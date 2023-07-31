FROM ruby:2.7.6

# replace shell with bash so we can source files
# RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs ghostscript yarn

RUN mkdir -p /app
RUN mkdir -p /usr/local/nvm
WORKDIR /app

RUN curl -sL https://deb.nodesource.com/setup_16.x -o /tmp/nodesource_setup.sh | bash -
RUN node -v

RUN apt-get update -qq && apt-get install -y build-essential nodejs yarn

# Copy the Gemfile as well as the Gemfile.lock and install
# the RubyGems. This is a separate step so the dependencies
# will be cached unless changes to one of those two files
# are made.
COPY Gemfile Gemfile.lock package.json ./
RUN gem install bundler -v 1.17.2
RUN gem install foreman -v 0.85.0
RUN bundle install --verbose --jobs 20 --retry 5

RUN yarn install --check-files

# Copy the main application.
COPY . ./

# Precompile Rails assets
RUN RAILS_ENV=production bundle exec rake assets:precompile

# Expose port 3000 to the Docker host, so we can access it
# from the outside.
EXPOSE 3000:3000

# The main command to run when the container starts. Also
# tell the Rails dev server to bind to all interfaces by
# default.
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]