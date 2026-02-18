---
layout: page
title: Azure
permalink: /azure/
---

#### Get AKS Credentials for a Cluster
<pre class="code">
az aks get-credentials --resource-group raytest --name raytest --public-fqdn
</pre>
<hr />
#### Log into ACR
<pre class="code">
az acr login --name reponame
</pre>
#### Get a Token for PostgresSQL
<pre class="code">
az account get-access-token --resource-type oss-rdbms
</pre>
