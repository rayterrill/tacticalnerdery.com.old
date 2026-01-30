---
layout: page
title: GCP
permalink: /gcp/
---

#### Get GCP projects
<pre class="code">
gcloud projects list
</pre>
<hr />
#### Set GCP project
<pre class="code">
gcloud config set project PROJECT_ID
</pre>
#### Get Cluster Credentials
<pre class="code">
gcloud container clusters get-credentials CLUSTER_NAME --region=CONTROL_PLANE_LOCATION --dns-endpoint
</pre>
