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
Login with SSO:
<pre class="code">
aws sso login --profile profile1
</pre>
Tell AWS which profile to use when running commands so you don't need to add --profile to everything:
<pre class="code">
export AWS_PROFILE=profile1
</pre>
See the details of our currnet login session:
<pre class="code">
aws sts get-caller-identity
</pre>

### Grab EKS Config
<pre class="code">
aws eks update-kubeconfig --name mycluster --region us-west-2
</pre>
