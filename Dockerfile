FROM node:18-alpine
LABEL author = Mathius
ENV PORT=3000

WORKDIR /user/app

RUN mkdir src
COPY src/*.js src
COPY package.json package.json

RUN npm install

VOLUME /app/data

EXPOSE ${PORT}/tcp
ENTRYPOINT ["node"]
CMD ["src/index.js"]