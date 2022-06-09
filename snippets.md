---
layout: page
title: Snippets
permalink: /snippets/
---

> Snippets or little things I cannot seem to remember but continue to need to get things done.

#### Adding an cluster to kubeconfig
<pre>
<code>
aws eks update-kubeconfig --region [region] --name [cluster name]
</code>
</pre>

#### Run a Ubuntu Pod in a Cluster to Debug Something
One of these days I'm gonna push an image to Dockerhub that has all the tools I need so I don't need to `apt update; apt install curl;`, etc - but that is not today. :)
<pre>
<code>
kubectl run --rm -it --image=ubuntu debugme -- /bin/bash -l
</code>
</pre>

#### Fix the Weird Terraform v0.12 Issue Where it Won't Load AWS Creds
This annoys the shit out of me and I always forget this command. :)
<pre>
<code>
export AWS_SDK_LOAD_CONFIG=1
</code>
</pre>

#### Use grep, awk, and xargs to Do Some Sketchy Stuff in a Cluster
Disclaimers: YMMV/IANAL/Don't try this at home I'm a professional :)
<pre>
<code>
kubectl get po | grep Terminating | awk '{print $1}' | xargs kubectl delete po --force --grace-period=0

kubectl get po --all-namespaces | grep Terminating | awk '{print $2 " " $1}' | xargs printf 'kubectl delete po %s -n %s --force --grace-period=0\n'
</code>
</pre>