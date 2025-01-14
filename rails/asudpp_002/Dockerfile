
FROM alpine:3.21 AS base

RUN apk --update-cache upgrade

FROM base AS asudpp_002

RUN apk add build-base
RUN apk add make
RUN apk add ruby
RUN apk add ruby-dev
RUN apk add yaml-dev

RUN gem install bundler

RUN adduser -D -u 1000 -g 1000 asudpp_002

USER asudpp_002

WORKDIR /home/asudpp_002/app

COPY --chown=asudpp_002:asudpp_002 . /home/asudpp_002/app

RUN bundle config set --local ignore_messages 'true'
RUN bundle config set --local path 'vendor/bundle'
RUN bundle config set --local without 'development test'

RUN bundle install

ENV RAILS_ENV=production

RUN bundle exec rails assets:precompile

ENTRYPOINT ["/bin/sh", "-c", "/home/asudpp_002/app/bin/rails server"]

