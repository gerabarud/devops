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