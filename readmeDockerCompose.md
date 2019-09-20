## Solution with Docker-compose

<<<<<<< HEAD
You can also start RabbitMQ with a docker-compose file  

You can run the docker-compose file with:
```
docker-compose -d up
```


## Send messages
=======
In this solution we will use docker-compose and docker networking.

## RabbitMQ container
Check the docker-compose file
Notes:
- network vbrabbitmqjs_myrabbitnetwork
- 

To run RabbitMQ use
```
docker-compose up -d
```  
## Send message in a container
Go to the directory in your cloned repo.

>>>>>>> 39a6344371dedbb885b41fa602e9ec093573fc6c
Make an ephemeral container to send a message with:
``` dockerfile
docker build -f sendjs.dockerfile -t sendjs2myrabbit .
```
<<<<<<< HEAD

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






=======
The dockerfile you can find in the root of the directory. The source code of send.js you can find in ./src/1HelloWorldinC.

Run the container and fill in the above found IP address:
``` docker
docker container run --network=vbrabbitmqjs_myrabbitnetwork -e HOSTNAME=myrabbit sendjs2myrabbit
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
docker container run --network=vbrabbitmqjs_myrabbitnetwork -e HOSTNAME=myrabbit receivejs2myrabbit 
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

## Clean your things
```
docker-compose down
```
If there some containers left you can also delete all containers with:
```
docker container rm -f $(docker container ls -aq)
```
If the network is not deleted give:
```
docker network prune -f
```
>>>>>>> 39a6344371dedbb885b41fa602e9ec093573fc6c
