
FROM alpine:3.23 AS install

  RUN apk --update-cache upgrade

  RUN apk add cmake
  RUN apk add ninja-build
  RUN apk add clang21
  RUN apk add clang21-extra-tools
  RUN apk add qt6-qtbase-dev

FROM install AS build

  ENV PATH="${PATH}:/usr/lib/ninja-build/bin"

  WORKDIR /app/source

  COPY . .

  WORKDIR /app

  RUN mkdir build

  RUN cmake -G Ninja -S source -B build
  RUN cmake --build build

FROM alpine:3.23 AS production

  RUN adduser -D -u 1000 -g 1000 sample-0001

  RUN apk --update-cache upgrade

  RUN apk add qt5-qtbase

  WORKDIR /home/sample-0001

  COPY --from=build /app/build/sample-0001 ./sample-0001

  USER sample-0001

  ENTRYPOINT ["/bin/sh", "-c", "/home/sample-0001/sample-0001"]

