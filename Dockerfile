FROM ruby:3.1.2
RUN apt-get update -qq && apt-get install -y postgresql-client
WORKDIR /lollys-recipe-api
COPY Gemfile /lollys-recipe-api/Gemfile
COPY Gemfile.lock /lollys-recipe-api/Gemfile.lock
RUN bundle install

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]
