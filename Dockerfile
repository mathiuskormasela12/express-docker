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

HEALTHCHECK --interval=5s --start-period=5s --retries=3 --timeout=5s CMD curl -f http://localhost:${PORT}/api/health

CMD npm start