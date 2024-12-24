{{/* Виправити імена helper функцій - прибрати подвійні крапки */}}
{{- define "saleor.name" -}}
{{- printf "%s" .Chart.Name -}}
{{- end }}

{{- define "saleor.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name -}}
{{- end }}

{{- define "saleor.chart" -}}
{{- printf "%s" .Chart.Name -}}
{{- end }}

{{- define "saleor.labels" -}}
app.kubernetes.io/name: {{ include "saleor.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "saleor.selectorLabels" -}}
app.kubernetes.io/name: {{ include "saleor.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "saleor.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
{{- default (include "saleor.fullname" .) .Values.serviceAccount.name -}}
{{- else -}}
{{- default "default" .Values.serviceAccount.name -}}
{{- end -}}
{{- end }}