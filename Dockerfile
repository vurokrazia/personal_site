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

# FROM ruby:2.6.6-alpine as builder
# RUN apk update && apk upgrade
# RUN apk add --update alpine-sdk mysql-client && rm -rf /var/cache/apk/*

# ENV APP_HOME /home/app
# RUN mkdir $APP_HOME
# WORKDIR $APP_HOME

# RUN gem install bundler 
# #&& bundle install --jobs 20 --retry 5

# COPY Gemfile* $APP_HOME/
# #ENV RAILS_ENV=production
# RUN apk add --update  mysql-dev \
#   mysql-client \
#   mariadb-connector-c
# RUN bundle install 
# # --deployment --jobs=4 --without development test

# COPY . $APP_HOME


# # The final image: we start clean
# FROM ruby:2.6.6-alpine

# # We copy over the entire gems directory for our builder image, containing the already built artifact
# COPY --from=builder /usr/local/bundle/ /usr/local/bundle/
# ENV APP_HOME /home/app
# RUN mkdir $APP_HOME
# WORKDIR $APP_HOME
# COPY --from=builder $APP_HOME .

# EXPOSE 3000
# CMD [ "rails", "s", "-b", "0.0.0.0"]