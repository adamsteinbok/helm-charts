{{- define "ironic_conf" }}
{{- $hypervisor := index . 1 }}
{{- with index . 0 }}
[DEFAULT]
compute_driver=ironic.IronicDriver
reserved_host_memory_mb={{$hypervisor.reserved_host_memory_mb | default .reserved_host_memory_mb | default 0 }}

# Needs to be same on hypervisor and scheduler
scheduler_tracks_instance_changes = {{ .Values.scheduler.scheduler_tracks_instance_changes }}
scheduler_instance_sync_interval = {{ .Values.scheduler.scheduler_instance_sync_interval }}

[ironic]
# api endpoint is found via keystone catalog
{{ $user := print (coalesce .Values.global.ironicServiceUser .Values.global.ironic_service_user "ironic") (default "" .Values.global.user_suffix) }}

# keystoneV3 values
auth_type = v3password
auth_url = {{.Values.global.keystone_api_endpoint_protocol_internal | default "http"}}://{{include "keystone_api_endpoint_host_internal" .}}:{{ .Values.global.keystone_api_port_internal | default 5000}}/v3
project_name = {{ default "service" .Values.global.keystone_service_project }}
project_domain_name = {{ default "Default" .Values.global.keystone_service_domain }}
username = {{ $user }}
password = {{ coalesce .Values.global.ironicServicePassword .Values.global.ironic_service_password  (tuple . $user | include "identity.password_for_user")  | replace "$" "$$" }}
user_domain_name = {{ default "Default" .Values.global.keystone_service_domain }}

serial_console_state_timeout = 10

{{- end }}
{{- end }}
