FROM dcycle/pa11y:2

RUN npm install pa11y-ci
RUN npm install pa11y-ci-reporter-html

ENTRYPOINT ["node_modules/.bin/pa11y-ci", "--config", "/app/config/config.json"]

