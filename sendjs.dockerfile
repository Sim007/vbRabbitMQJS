FROM node:lts-alpine

WORKDIR /app
COPY ./package.json package.json
RUN npm install
COPY ./src/1HelloWorldinC ./src/1HelloWorld
EXPOSE 5672
CMD [ "node", "./src/1HelloWorld/send.js" ]


# docker build -f sendjs.dockerfile -t sendjs2rabbit .
# docker container run sendjs2rabbit