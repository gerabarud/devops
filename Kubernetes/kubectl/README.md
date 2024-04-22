Table of Contents
- [`kubectl` commands](#kubectl-commands)
  - [Cluster](#cluster)
    - [Checking version (Client Version, Kustomize Version and Server Version)](#checking-version-client-version-kustomize-version-and-server-version)
    - [Ckecking cluster info](#ckecking-cluster-info)
    - [Cheking configured clusters](#cheking-configured-clusters)
    - [Checking all the running nodes.](#checking-all-the-running-nodes)
    - [Checking all the namespaces](#checking-all-the-namespaces)
    - [Getting all the API resources](#getting-all-the-api-resources)
    - [Checking all running services, pods, etc.](#checking-all-running-services-pods-etc)
    - [Getting details from the a particular namespace](#getting-details-from-the-a-particular-namespace)
    - [`dry-run`: executing a simulation](#dry-run-executing-a-simulation)
    - [Deleting all the pods](#deleting-all-the-pods)
  - [Namespace](#namespace)
    - [Creating a namespace](#creating-a-namespace)
    - [Applying a manifest to a particular namesapace](#applying-a-manifest-to-a-particular-namesapace)
    - [Changing default/active namespace](#changing-defaultactive-namespace)
    - [Getting resources of a particular namespace](#getting-resources-of-a-particular-namespace)
  - [Pod](#pod)
    - [Running a Pod](#running-a-pod)
    - [Getting running pods in the current namespace](#getting-running-pods-in-the-current-namespace)
    - [Getting running pods in all namespaces](#getting-running-pods-in-all-namespaces)
    - [Entering inside a pod](#entering-inside-a-pod)
    - [Entering inside a container](#entering-inside-a-container)
    - [Getting logs of a pod](#getting-logs-of-a-pod)
    - [Cheking logs a container inside a pod. That if pods have multiple container an we have enter inside a container](#cheking-logs-a-container-inside-a-pod-that-if-pods-have-multiple-container-an-we-have-enter-inside-a-container)
    - [Executing a comand inside a pod](#executing-a-comand-inside-a-pod)
    - [Describing details/state about a pod](#describing-detailsstate-about-a-pod)
    - [Watching the pods (watch refresh every few seconds)](#watching-the-pods-watch-refresh-every-few-seconds)
    - [Deleting pods](#deleting-pods)
    - [Deleting failed pods](#deleting-failed-pods)
  - [Deployment](#deployment)
    - [Creating a deployment](#creating-a-deployment)
    - [Scaling the deployment (increase replicas)](#scaling-the-deployment-increase-replicas)
    - [Editing a deployment](#editing-a-deployment)
    - [Deleting the deployment](#deleting-the-deployment)
  - [Services](#services)
    - [Checking all the running services](#checking-all-the-running-services)
  - [Replicaset](#replicaset)
    - [Checking all the replicaset](#checking-all-the-replicaset)
  - [Persistent Volume](#persistent-volume)
    - [Getting all the PersistentVolume](#getting-all-the-persistentvolume)
    - [Getting all the PersistentVolumeClaim (tied to a namespace)](#getting-all-the-persistentvolumeclaim-tied-to-a-namespace)

# `kubectl` commands

## Cluster

### Checking version (Client Version, Kustomize Version and Server Version)
```bash
kubectl version --short
kubectl version --output=yaml
```

### Ckecking cluster info
```bash
kubectl config view
```

### Cheking configured clusters
```bash
kube config get-contexts
```

### Checking all the running nodes.
```bash
kubectl get nodes
```

### Checking all the namespaces
```bash
kubectl get namespaces
```

### Getting all the API resources
```bash
kubectl api-resources
```

### Checking all running services, pods, etc.
```bash
kubectl get all
```

### Getting details from the a particular namespace
```bash
kubectl get all -n <namespace name>
```

### `dry-run`: executing a simulation
```bash
kubectl create namespace test-name --dry-run=client -oyaml
```

### Deleting all the pods
```
kubectl delete pods --all
```

## Namespace

### Creating a namespace
```bash
kubectl create namespace dev
```

### Applying a manifest to a particular namesapace
```bash
kubectl apply -f <config file name> --namespace=<namespace name>
```

### Changing default/active namespace
```bash
kubectl config set-context --current --namespace=<namespace name>
```

### Getting resources of a particular namespace
```bash 
kubectl get all -n <namespace name>
```

## Pod

### Running a Pod
```bash
kubectl run myngix --image nginx
```

### Getting running pods in the current namespace
```bash
kubectl get pods 
kubectl get pods -owide
```

### Getting running pods in all namespaces
```bash
kubectl get pods -A 
kubectl get pods -A -owide
```

### Entering inside a pod
```bash
kubectl exec -it nginx -- sh
```

### Entering inside a container
```bash
kubectl exec -it multi-container -c nginx-container -- sh
```

### Getting logs of a pod
```bash
kubectl logs <pod-name>
```

### Cheking logs a container inside a pod. That if pods have multiple container an we have enter inside a container

```bash
kubectl logs multi-container -c nginx-container
```

### Executing a comand inside a pod
```bash
kube exec -it nginx -- curl localhost
```

### Describing details/state about a pod 
```bash
kube describe pod nginx
```

### Watching the pods (watch refresh every few seconds)
```bash
kubectl get pods -w
```

### Deleting pods 
```bash
kubectl delete pod <pod-name>
```

### Deleting failed pods
```bash
kubectl delete pod --field-selector="status.phase==Failed"
```

## Deployment

### Creating a deployment
```bash
kubectl create deployment mynginx --image nginx
```

### Scaling the deployment (increase replicas)
```bash
kubectl scale deployment mynginx --replicas 2
```

### Editing a deployment
```bash
kubectl edit deployment <deployment name>
```

### Deleting the deployment
```bash
kubectl delete deployment <deployment-name>
```

## Services

### Checking all the running services
```bash
kubectl get services
```

## Replicaset

### Checking all the replicaset
```bash
kubectl get replicaset
```

## Persistent Volume

### Getting all the PersistentVolume
```bash 
kubectl get pv
```

### Getting all the PersistentVolumeClaim (tied to a namespace)
```bash 
kubectl get pvc
```