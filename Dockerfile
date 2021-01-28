FROM ruby:2.7.2-alpine as builder
RUN apk add --no-cache ca-certificates curl less libpq openssl tzdata

FROM builder AS development

RUN  apk add --no-cache \
  build-base \
  git \
  mysql-dev \
  mysql-client \
  mariadb-connector-c

ENV APP_HOME /home/src
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

COPY Gemfile .
COPY Gemfile.lock .

RUN bundle install --jobs=4 --retry=3

COPY Gemfile* $APP_HOME/

COPY . $APP_HOME

CMD ["rails", "server", "-b", "0.0.0.0", "-p", "3000"]
# The final image: we start clean
# FROM ruby:2.7.2-alpine

# # We copy over the entire gems directory for our builder image, containing the already built artifact
# COPY --from=builder /usr/local/bundle/ /usr/local/bundle/
# ENV APP_HOME /home/src
# RUN mkdir $APP_HOME
# WORKDIR $APP_HOME
# COPY --from=builder $APP_HOME .

# EXPOSE 3000
# CMD [ "rails", "s", "-b", "0.0.0.0"]