# helm-charts

Here you will find helm charts for installing Dynatrace components on Kubernetes. For generic information about Helm Charts refer to [the Helm GitHub repository](https://github.com/helm/charts).

## dynatrace-operator chart
> This repository is updated for backwards compatibility, the new helm repository is located in the [dynatrace-operator](https://github.com/Dynatrace/dynatrace-operator) repository.

The Helm chart for the dynatrace-operator is located in the [dynatrace-operator repository](https://github.com/Dynatrace/dynatrace-operator/tree/master/config/helm/chart/default).

You can move to the new helm repository with the following commands:
1. Update the repo url
```
helm repo remove dynatrace
helm repo add dynatrace https://raw.githubusercontent.com/Dynatrace/dynatrace-operator/master/config/helm/repos/stable
```
2. Install a new version or upgrade from an existing version by following the instructions on the [dynatrace-operator Release page](https://github.com/Dynatrace/dynatrace-operator/releases)

#### GKE
The GKE chart for the dynatrace-operator is located in the [dynatrace-operator repository](https://github.com/Dynatrace/dynatrace-operator/tree/master/config/helm).

## dynatrace-oneagent-operator chart


>## **NOTE: The Dynatrace OneAgent Operator is deprecated and will not be supported anymore with Summer 2022. Please refer to [Migrating from OneAgent Operator to Dynatrace Operator](https://www.dynatrace.com/support/help/setup-and-configuration/setup-on-container-platforms/kubernetes/migrate-to-dynatrace-operator-k8/).**
<br>

The Helm chart for the dynatrace-oneagent-operator lives [here](https://github.com/Dynatrace/helm-charts/tree/master/dynatrace-oneagent-operator/chart/default).

#### GKE
The GKE chart for the dynatrace-oneagent-operator lives [here](https://github.com/Dynatrace/helm-charts/tree/master/dynatrace-oneagent-operator/).