FROM node:18-alpine
ENV PORT=9000
LABEL author = Mathius

WORKDIR /user/app

RUN addgroup -S kormaselaGroup
RUN adduser -S -D -h /user/app mathiusUser kormaselaGroup
RUN chown -R mathiusUser:kormaselaGroup /user/app
USER mathiusUser:kormaselaGroup

RUN mkdir src
COPY src/*.js src
COPY package.json package.json

RUN npm install

VOLUME /app/data

EXPOSE ${PORT}/tcp
CMD npm start