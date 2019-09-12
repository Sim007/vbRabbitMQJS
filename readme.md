# OSS Example of RabbitMQ running in a container

## Sending and receiving hello-world
In this assignment we will send and receive a hello-world message to and from RabbitMQ.

We will use 3 containers (RabbitMQ, send, receive) on 1 DockerHost.
We have to provide the send and receive container with an IP Address.

## Learning goals
We will learn the following:
- run RabbitMQ container with different options and env
- see the rabbitMQ userinterface
- get an IP address 
- build a send container image and run it
- build a receive container image and run it

You can do this assignment in Docker Desktop.

## Copy code
Git clone this directory or download the zip.
``` powershell
git clone https://github.com/Sim007/vbRabbitMQJS.git
```
In the directory there is a copy of code you can find on:
https://www.rabbitmq.com/getstarted.html. We will use the nodejs example.

## RabbitMQ container
On Docker Hub we can find the official Docker image for RabbitMQ.

There are a lot of container images available. We will use the the image management based on alpine. So we will get a smaller container image and we have a management interface plugin.

Start the container with
``` 
docker run -d --rm --hostname myrabbit --name myrabbit -p 4369:4369 -p 5671:5671 -p 5672:5672 -p 15671:15671 -p 15672:15672 -p 25672:25672 rabbitmq:3-management-alpine
```
You check the RabbitMQ management interface in a browser with:

```
localhost:15672
```
You can use guest/guest to login.  
In the queue tab you will see the hello queue.

If you want to change the user and password on runtime you can add the following env variabeles:

```
-e RABBITMQ_DEFAULT_USER=<user> 
-e RABBITMQ_DEFAULT_PASS=<password>
```

For the send and recieve containers you need the IP address of the RabbitMQ container named myrabbit.

You can find the IP address with the docker inspect command.

```
docker inspect myrabbit
```

If you only want to find the IP address you can give:  
```
docker inspect --format='{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' myrabbit
```

## Send message in a container
Go to the directory in your cloned repo.

Make an ephemeral container to send a message with:
``` dockerfile
docker build -f sendjs.dockerfile -t sendjs2myrabbit .
```
The dockerfile you can find in the root of the directory. The source code of send.js you can find in ./src/1HelloWorldinC.

Run the container and fill in the above found IP address:
``` docker
docker container run -e HOSTNAME=<IP> sendjs2myrabbit
```
The output should be:

The above IP address for the env and node.js variable and the message:

[x] Sent Hello World!  

You can check this in your rabbitmq with:
``` 
http://localhost:15672/#/queues
```

## Receive messages in a container
Make a container to receive messages
``` dockerfile
docker build -f receivejs.dockerfile -t receivejs2myrabbit .
```
The dockerfile you can find in the root of the directory and the source code of receive.js you can find in ./src/1HelloWorldinC.

Run the container with:
``` docker
docker container run -e HOSTNAME=<IP> receivejs2myrabbit
```

The output sould be:

The above IP address for the env and node.js variable and the messages:

[*] Waiting for messages in hello. To exit press CTRL+C  
[x] Received Hello World!  
....
  
You check this in your rabbitmq with:
``` Docker
http://localhost:15672/#/queues
```
You can go into the container with
``` dockerfile
docker container run -it receivejs2myrabbit sh
```




