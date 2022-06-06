---
layout: post
title:  "Interesting Articles - 6/5/2022"
categories: tech
---
* [Amazon Route 53 announces IP-Based Routing for DNS Queries](https://aws.amazon.com/about-aws/whats-new/2022/06/amazon-route-53-ip-based-routing-dns-queries/) - This sounds a lot like "DNS views" - the ability to answer a DNS query based on the originating client - very useful for routing things to the closest resource, etc, taking into account network architecture. I really could've used this at my last place.

* [Mobileye’s journey towards scaling Amazon EKS to thousands of nodes](https://aws.amazon.com/blogs/containers/mobileyes-journey-towards-scaling-amazon-eks-to-thousands-of-nodes/) - Good article talking about a company's journey scaling EKS. Specifically some great pieces in there about Cluster Autoscaler, and handling Spot Instances correctly, scaling CoreDNS, NodeLocal DNSCache (already on my radar), Fluent, and "sharding" clusters.

* [Using AWS Proton as a provisioning mechanism for Amazon EKS clusters](https://aws.amazon.com/blogs/containers/using-aws-proton-as-a-provisioning-mechanism-for-amazon-eks-clusters/) - I'm not super familiar with Proton, but this sounds like an interesting idea for packaging up service delivery options for teams (something done with Helm/Terraform/etc today).

* [Amazon EKS and Spot Instances in action at Delivery Hero](https://aws.amazon.com/blogs/containers/amazon-eks-and-spot-instances-in-action-at-delivery-hero/) - Good article on spot and eks - handling spot interruptions with a number of possible instance types is probably a really good takeaway.
