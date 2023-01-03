---
layout: page
title: Snippets
permalink: /snippets/
---

> Snippets or little things I cannot seem to remember but continue to need to get things done.

#### Adding an cluster to kubeconfig
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
#### Run a Ubuntu Container with PowerShell (No arm64 images yet)
<pre class="code">
docker run --name test -it --rm --platform=linux/amd64 mcr.microsoft.com/powershell
</pre>
#### Run a Specific Arch for a Docker Image
<pre class="code">
docker run --name test -it --rm --platform=linux/amd64 ubuntu
</pre>
<hr />
#### Fix the Weird Terraform v0.12 Issue Where it Won't Load AWS Creds
This annoys the shit out of me and I always forget this command. :)
<pre class=code>
export AWS_SDK_LOAD_CONFIG=1
</pre>
<hr />
#### Use grep, awk, and xargs to Do Some Sketchy Stuff in a Cluster
Disclaimers: YMMV/IANAL/Don't try this at home I'm a professional :)

<pre class="code">
kubectl get po | grep Terminating | awk '{print $1}' | xargs kubectl delete po --force --grace-period=0

kubectl get po --all-namespaces | grep Terminating | awk '{print $2 " " $1}' | xargs printf 'kubectl delete po %s -n %s --force --grace-period=0\n'

kubectl get crd | grep kyverno | awk '{print $1}' | xargs kubectl delete crd
</pre>
<hr />
#### Clear the Console + Scrollback in the VS Code Console
I need to use the VSCode Console more instead of switching back/forth between the IDE and iTerm.
<pre class="code">
<kbd>CMD + K</kbd> or <kbd>CTRL + K</kbd>
</pre>
#### Add an Origin for Github
<pre class="code">
git remote add origin https://github.com/rayterrill/t.git
git branch -M main
git push -u origin main
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

#### Get Running AWS Instances with Filtering
```
aws ec2 describe-instances --filters "Name=tag:kubernetes.io/cluster/my-cluster,Values=owned" "Name=instance-state-name,Values=running" --region us-east-1 | jq '.Reservations | length'
```

#### Setting Up GPG with a Yubikey

1. Insert the compatible yubikey into the computer
2. Reset the pins if desired (recommended)
    1. `gpg --card-edit`
    2. Enter admin mode: `admin`
    3. Change the passwords: `passwd`
3. Change the key size to 4096 (prob defaults to 2048)
    1. `gpg --card-edit`
    2. Enter admin mode: `admin`
    3. Change key attributes: `key-attr`
    4. Choose RSA
    5. Set the keysize to 4096
4. Generate GPG key
    1. `gpg --card-edit`
    2. Enter admin mode: `admin`
    3. Generate key: `generate`
    4. Follow the prompts, and make sure your full name and email match what you have set in Github
5. Export the key to put into github
    1. Get the key id from the output from command 4, and use it here: `gpg --armor --export KEY_ID_FROM_STEP_4`
    2. Put the outputted PGP Public Key Block in Github
6. Configure Git to always sign:
    ```
    [credential]
        helper = osxkeychain
    [user]
        email = YOUR_EMAIL_ADDRESS_WHICH_MATCHES_GITHUB
        name = YOUR_FULLNAME_WHICH_MATCHES_GITHUB
        signingkey = KEY_ID_FROM_STEP_4
    [commit]
        gpgsign = true
    ```
