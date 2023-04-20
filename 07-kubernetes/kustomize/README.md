# Kustomize
Kustomize is a tool for customizing Kubernetes YAML manifests. Allows you to manage multiple variations of your Kubernetes manifests without duplicating the YAML files. With Kustomize, you can:

- **Overlay patches:** You can add, remove or modify YAML resources without modifying the original base file. *This makes it easier to maintain configurations across different environments or clusters.*

- **Parameterize YAML:** Allows you to define variables, such as image names or environment variables, as well as their values in a separate file. *This makes it easier to maintain the configuration across different environments or clusters.*
  
- **Generate YAML from templates:** You can generate YAML manifests from templates. *This enables you to define a base set of resources and parameterize them with environment-specific values.*

## Directory example

**base**: Base configurations and manifests (templates)

**overlays**: Enviroment specific configurations

```bash
├── base
│   ├── deployment.yaml
│   ├── kustomization.yaml
│   └── service.yaml
└── overlays
    ├── dev
    │   ├── config.properties
    │   ├── kustomization.yaml
    │   └── replicas.yaml
    ├── prod
    │   ├── config.properties
    │   ├── kustomization.yaml
    │   └── replicas.yaml
    └── test
        ├── config.properties
        ├── kustomization.yaml
        └── replicas.yaml
```

### base/kustomization.yaml: 

- **Resources:** The files that Kustomize should import
- **Common Attributes:** Common configurations in your manifests like labels, annotations and names.
- **Generators:** Configmaps and Secrets creation/managament

example: 
```yaml

resources: 
- deployment.yaml
- service.yaml

commonLabels:
  app: mykustomapp

commonAnnotations:
  app: mykustom-annontations

namePrefix:
  kustom-

nameSuffix:
  -v1

configMapGenerator:
- name: mykustom-map
  env: config.properties
```

### overlays/ENVIROMENT/kustomization.yaml: 

-**Patching**: Used to apply different customizations to resources.

example: Here you overwrite namespace, replica counts and configmap
```yaml
bases:
- ../../base

namespace: prod

patches:
- replicas.yaml

configMapGenerator:
- name: mykustom-map
  env: config.properties
```

## Commands

**before apply**

You can take a look at the yaml files that will be applyed

```bash
kubectl kustomize .
```
**apply**

```bash
kubectl apply -k .
```