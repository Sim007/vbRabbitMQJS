FROM node:lts-alpine

WORKDIR /app
COPY ./package.json package.json
RUN npm install
COPY ./src/1HelloWorldinC ./src/1HelloWorld
EXPOSE 5672
CMD [ "node", "./src/1HelloWorld/send.js" ]


# build: docker build -f sendjs.dockerfile -t sendjs2rabbit .
# run:   docker container run -e HOSTNAME='172.17.0.2' sendjs2rabbit

# in:    docker container run -it -e HOSTNAME='172.17.0.2' sendjs2rabbit sh 