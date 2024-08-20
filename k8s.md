---
layout: page
title: K8s
permalink: /k8s/
---

> k8s things

#### Adding an EKS cluster to kubeconfig
<pre class="code">
aws eks update-kubeconfig --region [region] --name [cluster name]
</pre>
<hr />
#### Run a Ubuntu Pod in a Cluster to Debug Something
##### 2023 Update
Add this to your .zshrc (or equiv) and use it to drop a debug container in your cluster:
```
alias kshell='kubectl run -it --image bash --restart Never --rm shell'
```
One of these days I'm gonna push an image to Dockerhub that has all the tools I need so I don't need to `apt update; apt install curl;`, etc - but that is not today. :)
<pre class="code">
kubectl run --rm -it --image=ubuntu debugme -- /bin/bash -l
</pre>
#### Run a Ubuntu Container in Docker
<pre class="code">
docker run --name test -it --rm ubuntu
</pre>
#### Run a Debug Container in an existing pod
<pre class="code">
kubectl debug -it podname --image=ubuntu --target=containername -n namespace
</pre>
#### Run a Ubuntu Container with PowerShell (No arm64 images yet)
<pre class="code">
docker run --name test -it --rm --platform=linux/amd64 mcr.microsoft.com/powershell
</pre>
#### Run a Specific Arch for a Docker Image
<pre class="code">
docker run --name test -it --rm --platform=linux/amd64 ubuntu
</pre>
<hr />
#### Helm Stuff
Pull a specific chart version:
<pre class="code">
helm pull ingress-nginx/ingress-nginx --version 3.11.1
</pre>
See what versions of a chart are available:
<pre class="code">
helm search repo ingress-nginx/ingress-nginx --versions
</pre>
#### Cleanup Docker Things
<pre class="code">
docker system prune --volumes
</pre>
