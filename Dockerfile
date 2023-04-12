FROM node:18-alpine

RUN mkdir src
COPY src/*.js src
COPY package.json package.json

RUN npm install

CMD npm start