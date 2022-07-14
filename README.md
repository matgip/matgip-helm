## matgip helm chart

### 1. Create matgip namespace

```
$ kubectl create ns matgip
```

### 2. Use matgip namespace

```
$ kubectl config set-context --current --namespace=matgip
```

### 3. Make `tgz` file to install helm chart

```
$ tar czvf matgip-helm.tgz matgip-helm/
```

### 4. Install matgip helm chart

```
$ helm install matgip-service matgip-helm.tgz -f matgip-helm/values.yaml
```

### 5. Check all services are running

```
$ kubectl get all -n matgip
NAME                              READY   STATUS    RESTARTS   AGE
pod/matgip-db-cdd878697-fdz9b     1/1     Running   0          8m34s
pod/matgip-db-cdd878697-pkt5x     1/1     Running   0          8m34s
pod/matgip-db-cdd878697-pwdsk     1/1     Running   0          8m34s
pod/matgip-web-588c788cc8-8kvn9   1/1     Running   1          8m34s
pod/matgip-web-588c788cc8-rgnp2   1/1     Running   1          8m34s
pod/matgip-web-588c788cc8-z6k8h   1/1     Running   1          8m34s

NAME                 TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
service/matgip-db    ClusterIP   10.104.149.72   <none>        6379/TCP         8m34s
service/matgip-web   NodePort    10.109.216.64   <none>        3000:31637/TCP   8m34s

NAME                         READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/matgip-db    3/3     3            3           8m34s
deployment.apps/matgip-web   3/3     3            3           8m34s

NAME                                    DESIRED   CURRENT   READY   AGE
replicaset.apps/matgip-db-cdd878697     3         3         3       8m34s
replicaset.apps/matgip-web-588c788cc8   3         3         3       8m34s
```

## Reference

[ingress guide](https://kubernetes.io/ko/docs/tasks/access-application-cluster/ingress-minikube/)
