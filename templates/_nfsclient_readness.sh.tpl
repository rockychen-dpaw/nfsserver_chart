{{- define "nfsclient.readness.sh" }}#!/bin/sh
{{- range $name,$config := $.Values.nfsclient.volumes | default dict }}
  {{- if and (hasPrefix "nfs-" $config.storageClassName) (not (empty $config.mounts))}}
timeout {{$config.probeTimeout | default 1}} ls -ld {{get (mustFirst $config.mounts) "mountPath"}} > /dev/null 2>&1
status=$?
if [[ ${status} -ne 0 ]]; then
  echo "NFS folder {{get (mustFirst $config.mounts) "mountPath"}} is offline"
  exit ${status}
fi 
  {{- end }}
{{- end }}
{{- end }}
exit
