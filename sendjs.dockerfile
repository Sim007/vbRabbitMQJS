FROM node:lts-alpine

WORKDIR /app
COPY ./package.json package.json
RUN npm install
COPY ./src/1HelloWorldinC ./src/1HelloWorld
EXPOSE 5672
CMD [ "node", "./src/1HelloWorld/send.js" ]


# build: docker build -f sendjs.dockerfile -t sendjs2myrabbit .
# run:   docker container run -e HOSTNAME=<IP> sendjs2myrabbit

# in:    docker container run -it -e HOSTNAME=<IP> sendjs2myrabbit sh 