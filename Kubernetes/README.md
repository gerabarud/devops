# Kubernetes

## Debugging

### Debug Pods

1. Chequear estado actual y eventos recientes

```bash
kubectl describe pods ${POD_NAME}
```

Estados:

- `Pending`:No se puede *schedulear* en un nodo. Generalmente esto se debe a que no existen suficientes recursos o algo lo impide. Mirar el resultado del comando `kubectl describe...` anterior. Debería haber mensajes del `scheduler` sobre por qué no puede *schedulear* el pod.
- `Waiting`: El pod se ha *scheduleado* correctamente en un nodo `worker`, pero no puede ejecutarse en esa el. Nuevamente, la información de `kubectl describe...` debería ser informativa. La causa más común de los pods en espera es no poder *pullear* la imagen.
- `Terminating`: Significa que se ha emitido una eliminación para el Pod, pero el `control-plane` no puede eliminarlo. Esto suele suceder si el Pod tiene un finalizador y hay un webhook de admisión instalado en el clúster que impide que el `control-plane` elimine el finalizador.
- `Running`: Pero no hace lo que debe. A menudo, una parte del manifiesto del pod está anidada incorrectamente o el nombre de una clave escrita incorrectamente y, por lo tanto, se ignora la clave. Por ejemplo, si escribió mal `command` como `commnd`, se creará el pod pero no utilizará la línea de comando que pretendía usar. Lo primero que se debe hacer es eliminar el pod e intentar crearlo nuevamente con la opción --validate:
```bash
kubectl apply --validate -f mypod.yaml 
```

### Debug Services

## DNS

https://yuminlee2.medium.com/kubernetes-dns-bdca7b7cb868

## Secrets

### Decode a secret

Step by step
```bash
kubectl get secrets -n <namespace>
kubectl get secret <secret-name> -n <namespace> -o json
echo "<base64-encoded-value>" | base64 --decode
```

All in one command
```bash
kubectl get secret my-secret -n my-namespace -o json | jq -r '.data.<data-field>' | base64 --decode
```

## Observability


https://www.youtube.com/watch?v=-AFjOs4NU54


Que es eBPF
kubeshark : el analizador de trafico de API para kubernetes. Funcionalidades. Dashboard. Que puedo observar
Packet Where Are You : mirando el kernel para ver donde están los paquetes. Encontrando problemas de ruteo o de reglas de iptables mal aplicadas
Hubble: extendiendo la observabilidad mas alla de nivel de paquetes. Determinando como hablan los pods entre si. Que métodos HTTP de la REST API se llaman mas?