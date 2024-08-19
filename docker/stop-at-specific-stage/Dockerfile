# :::base:::
FROM alpine AS base

RUN apk --update-cache add zsh

WORKDIR /app
ENTRYPOINT ["/app/greeting"]

# :::rabbit:::
FROM base AS rabbit
COPY rabbit/rabbit greeting
RUN chmod 744 greeting

# :::fox:::
FROM base AS fox
COPY fox/fox greeting
RUN chmod 744 greeting

# :::wolf:::
FROM base AS wolf
COPY wolf/wolf greeting
RUN chmod 744 greeting

