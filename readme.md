# OSS Example of RabbitMQ running in a container

## Sending and receiving hello-world
In this example we will send and receive hello-world message to and from RabbitMQ.

We will use 3 containers (RabbitMQ, send, receive) on 1 DockerHost.
We have to provide the send and receive container with a IP Address.

## RabbitMQ container
Start the container with
``` 
docker run -d --hostname myrabbit --name myrabbit -p 4369:4369 -p 5671:5671 -p 5672:5672 -p 15671:15671 -p 15672:15672 -p 25672:25672 rabbitmq:3-management-alpine
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
docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' my-rabbit
```

## send message in a container
Make a empheral container to send a message with:
``` dockerfile
docker build -f sendjs.dockerfile -t sendjs2myrabbit .
```

Run the container with, fill above found IP adress in <IP>:
``` docker
docker container run -e HOSTNAME= <IP> sendjs2myrabbit
```
The output sould be:

The above IP address for the env and node.js variable and the message:

[x] Sent Hello World!

You check this in your rabbit-mq with:
``` Docker
http://localhost:15672/#/queues
```

## receive messages in a container
Make a container to receive messages
``` dockerfile
docker build -f receivejs.dockerfile -t receivejs2myrabbit .
```
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

## local send and receive (on laptop)
You can send and receive message from the directory 1HelloWorld with
``` 
node run send
node run receive
```
Note: you need npm, nodejs on your laptop and run npm i



