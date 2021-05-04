FROM node:16-alpine3.11

COPY . /var/app

WORKDIR /var/app

RUN npm install

ENTRYPOINT [ "node","index.js" ]