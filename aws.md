---
layout: page
title: AWS
permalink: /aws/
---

#### AWS SSO Login
Configure your ~/.aws/config
<pre class="code">
[profile profile1]
sso_start_url = https://yourdomain.awsapps.com/start
sso_region = us-west-2
sso_account_id = youraccountid
sso_role_name = AdministratorAccess
region = us-west-2
output = json
</pre>
Login with SSO interactively:
<pre class="code">
aws sso login --profile profile1
</pre>
Login with SSO in a non-interactive session using device code (in a SSH session, etc):
<pre class="code">
aws sso login --profile profile1 --use-device-code
</pre>
Tell AWS which profile to use when running commands so you don't need to add --profile to everything:
<pre class="code">
export AWS_PROFILE=profile1
</pre>
See the details of our currnet login session:
<pre class="code">
aws sts get-caller-identity
</pre>

### EKS
#### Grab EKS Config
<pre class="code">
aws eks update-kubeconfig --name mycluster --region us-west-2
</pre>
#### Login to ECR
<pre class="code">
aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 760564547102.dkr.ecr.us-west-2.amazonaws.com
</pre>
