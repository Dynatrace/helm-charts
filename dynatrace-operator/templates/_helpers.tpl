// Copyright 2020 Dynatrace LLC

// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at

//     http://www.apache.org/licenses/LICENSE-2.0

// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

{{/*
Expand the name of the chart.
*/}}
{{- define "dynatrace-operator.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "dynatrace-operator.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "dynatrace-operator.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "dynatrace-operator.labels" -}}
helm.sh/chart: {{ include "dynatrace-operator.chart" . }}
dynatrace: operator
operator: dynakube
{{ include "dynatrace-operator.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "dynatrace-operator.selectorLabels" -}}
app.kubernetes.io/name: {{ include "dynatrace-operator.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Check if default operator image is used
*/}}
{{- define "dynatrace-operator.image" -}}
{{- if .Values.operator.image -}}
    {{- printf "%s" .Values.operator.image -}}
{{- else -}}
    {{- printf "%s:v%s" "docker.io/dynatrace/dynatrace-operator" .Chart.AppVersion }}
{{- end -}}
{{- end -}}

{{/*
Check if platform is set
*/}}
{{- define "dynatrace-operator.platformSet" -}}
{{- if or (eq .Values.platform "kubernetes") (eq .Values.platform "openshift") -}}
    {{ default "set" }}
{{- end -}}
{{- end -}}

{{/*
Common labels webhook
*/}}
{{- define "dynatrace-operator.commonlabelswebhook" -}}
dynatrace.com/operator: dynakube
internal.dynatrace.com/component: webhook
helm.sh/chart: {{ include "dynatrace-operator.chart" . }}
{{- end -}}
