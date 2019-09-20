## Solution with Docker-compose

You can also start RabbitMQ with a docker-compose file  

You can run the docker-compose file with:
```
docker-compose -d up
```


## Send messages
Make an ephemeral container to send a message with:
``` dockerfile
docker build -f sendjs.dockerfile -t sendjs2myrabbit .
```

We add a docker network so we can use this network to send messages.

Find the name of the bridge network with:
```
docker network ls
```
Send a hello world message with:
```
docker container run -e HOSTNAME=myrabbit --network vbrabbitmqjs_vbRabbitMQnetwork sendjs2myrabbit
```
Note:
HOSTNAME = name the service in the docker-compose






