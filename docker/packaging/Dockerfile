FROM alpine AS build-stage
RUN echo 'BUILDING...' > /build.txt

FROM alpine AS test-stage
COPY --from=build-stage /build.txt /build.txt
RUN echo 'TESTING...' >> /build.txt

FROM alpine
COPY --from=build-stage /build.txt /build.txt

CMD cat /build.txt
