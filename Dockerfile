FROM node:18-alpine
LABEL author = Mathius
ARG PORT=2004
ENV PORT=${PORT}

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