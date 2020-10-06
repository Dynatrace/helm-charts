# Tool Prerequisites

Please follow the instructions here to install mpdev and apply the application CRD:

https://github.com/GoogleCloudPlatform/marketplace-k8s-app-tools/blob/25b17f74106d4ad1e92bb1f8cfb2febc863760f8/docs/tool-prerequisites.md

# Installation

Generate an API and a PaaS token in your Dynatrace environment.

https://www.dynatrace.com/support/help/reference/dynatrace-concepts/why-do-i-need-an-environment-id/#create-user-generated-access-tokens

The Dynatrace ActiveGate Operator acts on its separate namespace `dynatrace`.
To create this namespace run the following command:

```
kubectl create namespace dynatrace
```

To install the Dynatrace ActiveGate Operator run this command and replace the tokens and the apiUrl inside:

```
mpdev /scripts/install \
--deployer=gcr.io/cloud-marketplace/dynatrace-marketplace-prod/dynatrace-activegate-operator/deployer \
--parameters='{ \
"name": "dynatrace-activegate-operator", \
"namespace": "dynatrace", \
"oneagent.apiUrl": "https://ENVIRONMENTID.live.dynatrace.com/api", \
"secret.apiToken": "DYNATRACE_API_TOKEN", \
"secret.paasToken": "PLATFORM_AS_A_SERVICE_TOKEN" }'
```