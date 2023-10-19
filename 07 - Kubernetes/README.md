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