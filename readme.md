# OSS Example of RabbitMQ running in a container

## learning goals:
We learn the following:
- run RabbitMQ container with different options and env
- See the userinterface and get a IP adress 
- build a send container image and run it with IP adress with env
- build a receive container image and run it

You can run this assignment in Docker Desktop.

## Copy code
Git clone this directory or download the zip.
``` powershell
git clone https://github.com/Sim007/vbRabbitMQJS.git
```

## Sending and receiving hello-world
In this assignment we will a send and receive hello-world message to and from RabbitMQ.

We will use 3 containers (RabbitMQ, send, receive) on 1 DockerHost.
We have to provide the send and receive container with a IP Address.

## RabbitMQ container
Start the container with
``` 
docker run -d --rm --hostname myrabbit --name myrabbit -p 4369:4369 -p 5671:5671 -p 5672:5672 -p 15671:15671 -p 15672:15672 -p 25672:25672 rabbitmq:3-management-alpine
```
You check the RabbitMQ management interface in browser with:

```
localhost:15672
```
You can use guest/guest
In the queue tab you will see hello queue.

For send and recieve container you need the IP address of the RabbitMQ container named my-rabbit.
You can find the IP address with the docker inspect command.
If you do not want to find address in the output. You can give:  
```
docker inspect --format='{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' myrabbit
```

## send message in a container
Goto the directory in your cloned repo.

Make an empheral container to send a message with:
``` dockerfile
docker build -f sendjs.dockerfile -t sendjs2myrabbit .
```
The dockerfile you can find in the root of directory and the source of send.js you can find in ./src/1HelloWorldinC.

Run the container with, fill above found IP adress in <IP>:
``` docker
docker container run -e HOSTNAME=<IP> sendjs2myrabbit
```
The output sould be:

The above IP address for the env and node.js variable and the message:

[x] Sent Hello World!

You check this in your rabbit-mq with:
``` 
http://localhost:15672/#/queues
```

## receive messages in a container
Make a container to receive messages
``` dockerfile
docker build -f receivejs.dockerfile -t receivejs2myrabbit .
```
The dockerfile you can find in the root of directory and the source of receive.js you can find in ./src/1HelloWorldinC.

Run the container with:
``` docker
docker container run -e HOSTNAME=<IP> receivejs2myrabbit
```
You can go in the container with
``` dockerfile
docker container run -it -e HOSTNAME=<IP> receivejs2myrabbit sh
```
The output sould be:

The above IP address for the env and node.js variable and the messages:

[*] Waiting for messages in hello. To exit press CTRL+C
[x] Received Hello World!
....

You check this in your rabbit-mq with:
``` Docker
http://localhost:15672/#/queues
```





