
FROM alpine:3.20

RUN apk --update-cache upgrade

RUN apk add build-base
RUN apk add make
RUN apk add ruby
RUN apk add ruby-dev
RUN apk add yaml-dev

# RUN apk add sqlite # [optional] For exloring the database inside the container

RUN gem install bundler

RUN adduser -D -u 1000 -g 1000 auth_103

USER auth_103

WORKDIR /home/auth_103/app

# RUN find . -exec chown auth_103:auth_103 {} \;
#
# or better
#
COPY --chown=auth_103:auth_103 . /home/auth_103/app

RUN bundle config set --local ignore_messages 'true'
RUN bundle config set --local path 'vendor/bundle'
RUN bundle config set --local without 'development test'

RUN bundle install

ENV RAILS_ENV=production

# RUN bundle exec rails db:create
# RUN bundle exec rails db:migrate
# RUN bundle exec rails db:seed
RUN bundle exec rails assets:precompile

ENTRYPOINT ["/bin/sh", "-c", "/home/auth_103/app/bin/rails server"]

