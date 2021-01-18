# Welcome

Dynatrace automatically discovers, baselines, and intelligently monitors Kubernetes clusters and workloads. Learn more about Dynatrace at [our website](https://www.dynatrace.com/platform/).

# Dynatrace Operator Helm Chart

The Dynatrace Operator supports rollout and lifecycle of various Dynatrace components in Kubernetes and OpenShift.

As of launch, the Dynatrace Operator can be used to deploy a containerized ActiveGate for Kubernetes API monitoring. New capabilities will be added to the Dynatrace Operator over time including metric routing, and API monitoring for AWS, Azure, GCP, and vSphere.

This Helm Chart requires Helm 3.

### Platforms
Depending on the version of the Dynatrace Operator, it supports the following platforms:

| Dynatrace Operator Helm Chart version | Kubernetes | OpenShift Container Platform |
| ------------------------------------- | ---------- | ---------------------------- |
| v0.1.0                                | 1.18+      | 3.11.188+, 4.4+              |


## Quick Start

The Dynatrace Operator acts on its separate namespace `dynatrace`.
It holds the operator deployment and all dependent objects like permissions, custom resources and
corresponding StatefulSets.
To install the Dynatrace Operator via Helm run the following command:

### Adding Dynatrace Helm repository
```
$ helm repo add dynatrace https://raw.githubusercontent.com/Dynatrace/helm-charts/master/repos/stable
```

### Prepare tokens

Generate an API and a PaaS token in your Dynatrace environment.

https://www.dynatrace.com/support/help/reference/dynatrace-concepts/why-do-i-need-an-environment-id/#create-user-generated-access-tokens

To install the Dynatrace Operator replace the APIUrl, the API token and the PaaS token in command and execute it

#### Kubernetes
```
$ kubectl create namespace dynatrace
$ helm install dynatrace-operator dynatrace/dynatrace-operator -n dynatrace --set apiUrl="https://ENVIRONMENTID.live.dynatrace.com/api",apiToken="DYNATRACE_API_TOKEN",paasToken="PLATFORM_AS_A_SERVICE_TOKEN"
```

#### OpenShift
```
$ oc adm new-project --node-selector="" dynatrace
$ helm install dynatrace-operator dynatrace/dynatrace-operator -n dynatrace --set platform="openshift",apiUrl="https://ENVIRONMENTID.live.dynatrace.com/api",apiToken="DYNATRACE_API_TOKEN",paasToken="PLATFORM_AS_A_SERVICE_TOKEN"
```

This will automatically install the Dynatrace Operator and create a containerized ActiveGate.

## Update procedure

To update simply update your helm repositories and check the latest version

```
$ helm repo update
```

You can then check for the latest version by searching your Helm repositories for the Dynatrace Operator

```
$ helm search repo dynatrace-operator
```

To then update to the latest version run this command and do not forget to add the `reuse-values` flag to keep your configuration

```
$ helm upgrade dynatrace-operator dynatrace/dynatrace-operator -n dynatrace --reuse-values
```

## Uninstall dynatrace-operator
Remove DynaKube custom resources and clean-up all remaining Dynatrace Operator specific objects:


```sh
$ helm uninstall dynatrace-operator -n dynatrace
```

## License

Dynatrace Operator Helm Chart is under Apache 2.0 license. See [LICENSE](../LICENSE) for details.
