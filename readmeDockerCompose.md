## OSS Example RabbitMQ with Docker-compose

## Do / learning goals
We will learn the following
- make a docker-compose file
- run a RabbitMQ with docker-compose
- build and run in a container: send hello world to RabbitMQ
- Check your RabbitMQ 

# Use docker-compose for RabbitMQ container
You can also start RabbitMQ with a docker-compose file.

Build your mydocker-compose.yaml file based on the command
```
docker run -d --rm --hostname myrabbit --name myrabbit -p 4369:4369 -p 5671:5671 -p 5672:5672 -p 15671:15671 -p 15672:15672 -p 25672:25672 rabbitmq:3-management-alpine
```
You can run the mydocker-compose file with:
```
docker-compose (-f mydocker-compose.yml) up -d
```

## Send messages container
Make an ephemeral container to send a message with:
``` dockerfile
docker build -f sendjs.dockerfile -t sendjs2myrabbit .
```

docker-compose added a docker network so we can use this network to send messages.

Find the name of the bridge network (something with "rabbitmq":
```
docker network ls
```
Send a hello world message with:
```
docker container run -e HOSTNAME=myrabbit --network vbrabbitmqjs_vbRabbitMQnetwork sendjs2myrabbit
```
Note:
HOSTNAME = name the service in the docker-compose
