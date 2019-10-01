# OSS Example RabbitMQ in k8s
This example shows how the rabbitmq run in k8s.

Goals:  
- start RabbitMQ with k8s yaml
- send a message with send pod

## RabbitMQ in k8s
Start RabbitMQ with:
```
kubectl apply -f myrabbit.yaml
```
You can see the userinterface with:
```
http://localhost:15672
```

We have describe:
- a service for the userinterface  
- a statefulset  

Search for IP of myrabbit for send container with 
```
kubectl describe pod
```

## Run naked "send" pod
We will use kubectl run - this is not recommended way.

```
kubectl run --generator=run-pod/v1 --image=sim007/sendjs2myrabbit sendjs2myrabbit --env="HOSTNAME=<IP>" 
```

To do: why does the name of pod does not work? 


## Delete stuff
```
kubectl delete svc myrabbit
kubectl delete statefulset myrabbit
```
