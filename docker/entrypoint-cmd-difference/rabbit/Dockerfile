FROM alpine

RUN apk --update-cache add zsh

# ENTRYPOINT ["/app/rabbit"]

# CMD ["/app/rabbit"]

# ENTRYPOINT ["/app/rabbit"]
# CMD ["ok!"]

# ENTRYPOINT ["/app/rabbit", "ok free!"]

ENTRYPOINT ["/app/rabbit"]

WORKDIR /app
COPY rabbit .
RUN chmod 744 rabbit
