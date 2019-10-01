## Start myrabbit with

```
kubectl apply -f myrabbit.yaml
```

Run naked send pod
```
kubectl run --generator=run-pod/v1 --image=sim007/sendjs2myrabbit sendjs2myrabbit --env="HOSTNAME=myrabbit" 
```

## Delete stuff
```
kubectl delete svc myrabbit
kubectl delete statefulset myrabbit
```
