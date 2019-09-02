FROM node:lts-alpine

WORKDIR /app
COPY ./package.json package.json
RUN npm install
COPY ./src/1HelloWorldinC ./src/1HelloWorld
EXPOSE 5672
CMD [ "node", "./src/1HelloWorld/receive.js" ]

# build: docker build -f receivejs.dockerfile -t receivejs2myrabbit .
# run:   docker container run -e HOSTNAME=<IP> receivejs2myrabbit

# in:    docker container run -it -e HOSTNAME=<IP> receivejs2myrabbit sh
