FROM node:latest

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY package.json yarn.lock /usr/src/app/
RUN YARN_CACHE_FOLDER=/dev/shm/yarn_cache yarn --production
COPY next.config.js ./
COPY .next /usr/src/app/.next
COPY public /usr/src/app/public

EXPOSE 5000


CMD [ "yarn", "start", "-p", "5000" ]

