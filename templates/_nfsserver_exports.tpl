{{- define "nfsserver.exports" }}
{{- $rw := "rw" }}
{{- $sync := "sync" }}
{{- range $name,$config := $.Values.nfsserver.volumes | default dict }}
{{- if $config.mounts }}
{{- range $mount := $config.mounts }}
  {{- if and (hasKey $config "readonly") $mount.readonly }}
    {{- $rw = "ro" }}
  {{- else }}
    {{- $rw = "rw" }}
  {{- end }}
  {{- if and (hasKey $mount "sync") $mount.sync }}
    {{- $sync = "sync" }}
  {{- else }}
    {{- $sync = "async" }}
  {{- end }}
  {{- if eq $mount.mountPath "/" }}
{{$.Values.nfsserver.shared_directory | default "/exports"}} {{ $mount.permitted | default "*" }}({{ $rw }},fsid=0,{{$sync}},no_subtree_check,no_auth_nlm,insecure,no_root_squash)
  {{- else if hasKey $mount "fsid" }}
{{$.Values.nfsserver.shared_directory | default "/exports"}}{{$mount.mountPath}} {{ $mount.permitted | default "*" }}({{ $rw }},fsid={{$mount.fsid}},{{$sync}},no_subtree_check,no_auth_nlm,insecure,no_root_squash)
  {{- else }}
{{$.Values.nfsserver.shared_directory | default "/exports"}}{{$mount.mountPath}} {{ $mount.permitted | default "*" }}({{ $rw }},{{$sync}},no_subtree_check,no_auth_nlm,insecure,no_root_squash)
  {{- end }}

{{- end }}
{{- end }}
{{- end }}
{{- end }}
