{{/*
Expand the name of the chart.
*/}}
{{- define "matgip.name" -}}
{{- printf "%s" .Chart.Name | trunc 63 -}}
{{- end -}}

{{/*
Expand cluster role and cluster role binding name.
*/}}
{{- define "matgip.clusterRoleName" -}}
{{- printf "%s-cluster-role" .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Expand service account name
*/}}
{{- define "matgip.serviceAccountName" -}}
{{- default (include "matgip.name" .) .Values.web.name -}}
{{- end -}}

{{/*
Expand matgip web secret
*/}}
{{- define "matgip.secretName" -}}
{{- default (include "matgip.name" .) "matgip-web-secret" -}}
{{- end -}}