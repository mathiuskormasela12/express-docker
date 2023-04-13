FROM node:18-alpine
ENV PORT=9000
LABEL author = Mathius

RUN mkdir src
COPY src/*.js src
COPY package.json package.json

RUN npm install

VOLUME /app/data

EXPOSE ${PORT}/tcp
CMD npm start