---
layout: page
title: Interesting Problems I've Worked on Recently
permalink: /problems/
---

### Istio does not respect `terminationGracePeriodSeconds`
By default, while kubernetes has terminationGracePeriodSeconds to handle giving containers enough time to finish their work prior to being removed from the system, Istio/Envoy do not honor that. Containers receiving SIGTERM will have their Envoy proxy terminated immediately, breaking both inbound AND outbound connectivity, which runs contrary to most engineers' understanding of how this should work (normally, kubernetes stop inbound connections from reaching your service, but leaves outbound connections alone)

Other Examples in the Community:
* [https://stackoverflow.com/questions/69118156/how-can-i-prevent-istio-sidecar-from-shutting-down-before-my-service-has-finishe](https://stackoverflow.com/questions/69118156/how-can-i-prevent-istio-sidecar-from-shutting-down-before-my-service-has-finishe)

<div class="chroma">
<p class="solution">Solution (still testing):</p>
Set `EXIT_ON_ZERO_ACTIVE_CONNECTIONS` in the Istio proxy configmap so Envoy proxies don't exit until the programs are complete.
</div>
<hr />
<h3><a href='https://github.com/rayterrill/go_openapi3_examples'>Golang Openapi3 Spec Generation and Validation</a></h3>
<hr />
### ClusterAPI + AWS Integration
Built out an integration with a minimal api to allow engineers to pave out new EKS clusters using a Gitops style flow. Designed an built a new custom k8s controller to automatically provision new clusters into ArgoCD upon creation, as well as deprovision upon removal. Also includes integration with AWS' new node provisioning toolset, [Karpenter](https://karpenter.sh). Made upstream commit to Karpenter repo to add support for utilizing Bottlerocket instances with Karpenter [#1110](https://github.com/aws/karpenter/pull/1110).
