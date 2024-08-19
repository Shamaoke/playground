FROM node

CMD ["node", "/web-ping/app.mjs"]

ENV TARGET="anidb.net"
ENV METHOD="HEAD"
ENV INTERVAL="3000"

WORKDIR /web-ping

COPY README.md .
COPY app.mjs .
