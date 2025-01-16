
FROM alpine:3.21 AS base

RUN apk --update-cache upgrade

FROM base AS proxy

RUN apk add nginx

COPY --chown=root:root ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY --chown=root:root ./nginx/default.conf /etc/nginx/http.d/default.conf

ENTRYPOINT ["/bin/sh", "-c", "/usr/sbin/nginx"]

FROM base AS main

RUN apk add build-base
RUN apk add make
RUN apk add ruby
RUN apk add ruby-dev
RUN apk add yaml-dev

RUN gem install bundler

RUN adduser -D -u 1000 -g 1000 ticketee

USER ticketee

WORKDIR /home/ticketee/app

COPY --chown=ticketee:ticketee . /home/ticketee/app

RUN bundle config set --local ignore_messages 'true'
RUN bundle config set --local path 'vendor/bundle'
RUN bundle config set --local without 'development test'

RUN bundle install

ENV RAILS_ENV=production

RUN bundle exec rails assets:precompile

ENTRYPOINT ["/bin/sh", "-c", "/home/ticketee/app/bin/rails server"]

