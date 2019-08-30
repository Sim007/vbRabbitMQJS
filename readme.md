# OSS Example of RabbitMQ running in a container

In this example you can send and receive hello-world message to RabbitMQ in a container

Start the container with
``` 
docker container run -d --hostname my-rabbit --name my-rabbit -p 8080:15672 -p 5672:5672 rabbitmq:3-management-alpine
```
# send message in a container
Make a empheral container to send a message with:
``` dockerfile
docker build -f sendjs.dockerfile -t sendjs2rabbit .
```
Run the container with:
``` dockerfile
docker container run sendjs2rabbit
```
# receive messages in a container
Make a container to receive messages
``` dockerfile
docker build -f receivejs.dockerfile -t receivejs2rabbit .
```
Run the container with:
``` dockerfile
docker container run receivejs2rabbit
```
You can go in the container with
``` dockerfile
docker container run -it receivejs2rabbit sh
```
Note: 
You use IP adress in js files
You can find the IP adress of RabbitMQ with
``` Dockerfile
docker inspect my-rabbit 
```
If there a user defined network we can use the name of the container.

# local send and receive
You can send and receive message from this directory with
``` 
node run send

node run receive
```
Note: you need npm, nodejs on your laptop and run npm i



