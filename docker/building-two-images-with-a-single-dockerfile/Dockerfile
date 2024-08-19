#
# :::rabbit:::
#

FROM alpine

RUN apk --update-cache add zsh

ENTRYPOINT ["/app/rabbit"]

WORKDIR /app
COPY rabbit/rabbit .
RUN chmod 744 rabbit

#
# :::fox:::
#

FROM alpine

RUN apk --update-cache add zsh

ENTRYPOINT ["/app/fox"]

WORKDIR /app
COPY fox/fox .
RUN chmod 744 fox

