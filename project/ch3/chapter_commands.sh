# create pod
kubectl create -f kubia-manual.yaml
kubectl create -f kubia-manual-with-labels.yaml

# get  descriptions
kubectl get po kubia-manual -o yaml
kubectl get po kubia-manual -o json

# get logs
kubectl logs kubia-manual -c kubia

# port forwarding
kubectl port-forward kubia-manual 8888:8080

# labelling
kubectl label po kubia-manual creation_method=manual
kubectl label po kubia-manual-v2 env=debug --overwrite

# get certain labels
kubectl get po -l creation_method=manual

# label node
kubectl label node gke-kubia-85f6-node-0rrx gpu=true

# get labelled nodes
kubectl get nodes -l gpu=true


# add annotation
kubectl annotate pod kubia-manual mycompany.com/someannotation="foo bar"

# Describe pod
kubectl describe pod kubia-manual

# get namespaces
kubectl get ns

# create namespace from yaml
kubectl create -f custom-namespace.yaml

# create pod inside particular namespace
kubectl create -f kubia-manual.yaml -n custom-namespace
kubectl get pods -n custom-namespace

# delete pods
kubectl delete po kubia-gpu

# delete pods with labels
kubectl delete po -l creation_method=manual

# delete namespace
kubectl delete ns custom-namespace