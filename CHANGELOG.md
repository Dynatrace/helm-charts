# Dynatrace Operator Chart: 0.10.2
#### Other changes
* Removed the CustomResourceDefinition from the Helm chart

* Added a new platform type for OpenShift 3.11 in the values file (platform:"openshift-3-11") which should be used for OpenShift 3.11 since the apiVersion of the CRD changed

* Removed PodSecurityPolicies since they got removed with Kubernetes 1.22

* Updated the apiVersion of the CRD from v1beta1 to v1 since v1beta1 got removed with Kubernetes 1.22
