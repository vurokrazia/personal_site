FROM ruby:2.6.6

RUN apt-get update && apt-get install -y \
  build-essential \
  nodejs

RUN mkdir -p /home/app
WORKDIR /home/app

COPY ./Gemfile ./
COPY ./Gemfile.lock ./

RUN gem install bundler && bundle install --jobs 20 --retry 5

# Copy the main application.
COPY ./ ./


EXPOSE 3000

CMD [ "rails", "s", "-b", "0.0.0.0"]
