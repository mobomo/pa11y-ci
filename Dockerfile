FROM node:18.10-alpine3.16

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

RUN mkdir -p /app/config && \
    mkdir -p /app/reportsS

WORKDIR /app

RUN apk add --no-cache chromium \
  libstdc++6 \
  ca-certificates \
  xdg-utils \
  wget

RUN npm install pa11y-ci
RUN npm install pa11y-ci-reporter-html

ADD ./config.json /app/config/config.json

ENTRYPOINT ["node_modules/.bin/pa11y-ci", "--config", "/app/config/config.json"]

