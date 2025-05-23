{{/*
Expand the name of the chart.
*/}}
{{- define "ragnarok.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "ragnarok.fullname" -}}
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
{{- define "ragnarok.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}




{{/*
char server
*/}}

{{/*
Common labels
*/}}
{{- define "ragnarok.charServer.labels" -}}
helm.sh/chart: {{ include "ragnarok.chart" . }}
{{ include "ragnarok.charServer.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}
{{/*
Selector labels
*/}}
{{- define "ragnarok.charServer.selectorLabels" -}}
app.kubernetes.io/name: {{ include "ragnarok.name" . }}-char-server
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}


{{/*
login server
*/}}
{{/*
Common labels
*/}}
{{- define "ragnarok.loginServer.labels" -}}
helm.sh/chart: {{ include "ragnarok.chart" . }}
{{ include "ragnarok.loginServer.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}
{{/*
Selector labels
*/}}
{{- define "ragnarok.loginServer.selectorLabels" -}}
app.kubernetes.io/name: {{ include "ragnarok.name" . }}-login-server
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
map server
*/}}
{{/*
Common labels
*/}}
{{- define "ragnarok.mapServer.labels" -}}
helm.sh/chart: {{ include "ragnarok.chart" . }}
{{ include "ragnarok.mapServer.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}
{{/*
Selector labels
*/}}
{{- define "ragnarok.mapServer.selectorLabels" -}}
app.kubernetes.io/name: {{ include "ragnarok.name" . }}-map-server
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}