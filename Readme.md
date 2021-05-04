Para aplicar los manifiestos en kubernetes, pararse sobre la carpera manisfests y utilizar el siguiente comando:

    kubectl apply -f . 

Luego de que la aplicacion haya terminado, ingresar el siguiente comando:

    kubectl get pods

Este listará los pods creados, así:

    NAME                        READY   STATUS    RESTARTS   AGE
    curl                        1/1     Running   0          34m
    mongodb-bcbdbffc4-qfj4q     1/1     Running   0          4m39s
    todolist-7848598d5c-qrbnz   1/1     Running   0          4m39s

Copiar el nombre del pod todolist y hacer un port-forward para poder acceder el pod desde un cluster local, así:

    kubectl port-forward --address 0.0.0.0 todolist-7848598d5c-qrbnz 3000:3000

Ahora accede a tu navegador en la direccion http://localhost:3000

Si ejecutaste sobre una nube el servicio todo list creara una ip publica sobre un loadbalancer, esto lo pueder observar con el comando:

    kubectl get services

y arrojará una linea de comando así:

    NAME         TYPE           CLUSTER-IP       EXTERNAL-IP   PORT(S)        AGE
    kubernetes   ClusterIP      10.96.0.1        <none>        443/TCP        60m
    mongodb      ClusterIP      10.105.210.130   <none>        27017/TCP      7m11s
    todolist     LoadBalancer   10.99.5.198      IPPUBLICA     80:32633/TCP   7m11s

La IPPUBLICA que le aparece en EXTERNAL-IP es la que puede usar en su navegador para acceder a la aplicacion mediante http://IPPUBLICA