# Example of RabbitMQ running in a container

In this example you can send and receive hello-world message to RabbitMQ in a container

Start the container with
``` 
docker container run -d --hostname my-rabbit --name some-rabbit -p 8080:15672 -p 5672:5672 rabbitmq:3-management-alpine
```
You can send and receive message from this directory with
``` 
node run send
``` 
node run receive
```

