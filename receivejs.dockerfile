FROM node:lts-alpine

WORKDIR /app
COPY ./package.json package.json
RUN npm install
COPY ./src/1HelloWorldinC ./src/1HelloWorld
EXPOSE 5672
CMD [ "node", "./src/1HelloWorld/receive.js" ]


# docker build -f receivejs.dockerfile -t receivejs2rabbit .
# docker container run receivejs2rabbit