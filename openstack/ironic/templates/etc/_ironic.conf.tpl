[DEFAULT]
log_config_append = /etc/ironic/logging.ini
pybasedir = /ironic/ironic
network_provider = neutron_plugin
enabled_network_interfaces = noop,flat,neutron
default_network_interface = neutron

{{- if eq .Values.global.region "staging" }}
debug = true
{{- end }}

{{- include "ini_sections.default_transport_url" . }}
rpc_response_timeout = {{ .Values.rpc_response_timeout | default .Values.global.rpc_response_timeout | default 60 }}
rpc_workers = {{ .Values.rpc_workers | default .Values.global.rpc_workers | default 1 }}

[agent]
deploy_logs_collect = {{ .Values.agent.deploy_logs.collect }}
deploy_logs_storage_backend = {{ .Values.agent.deploy_logs.storage_backend }}
deploy_logs_swift_days_to_expire = {{ .Values.agent.deploy_logs.swift_days_to_expire }}
{{- if eq .Values.agent.deploy_logs.storage_backend "swift" }}
deploy_logs_swift_project_name = {{ .Values.agent.deploy_logs.swift_project_name | required "Need a project name" }}
deploy_logs_swift_project_domain_name = {{ .Values.agent.deploy_logs.swift_project_domain_name | required "Need a domain name for the project" }}
deploy_logs_swift_container = {{ .Values.agent.deploy_logs.swift_container | default "ironic_deploy_logs_container" }}
{{- end }}

[inspector]
enabled=True
auth_section = service_catalog
service_url=https://{{include "ironic_inspector_endpoint_host_public" .}}

[dhcp]
dhcp_provider=neutron

[api]
host_ip = 0.0.0.0
public_endpoint = https://{{ include "ironic_api_endpoint_host_public" .}}

{{- include "ini_sections.database" . }}

[keystone]
auth_section = service_catalog
region = {{ .Values.global.region }}

[keystone_authtoken]
auth_section = service_catalog
memcached_servers = {{ .Chart.Name }}-memcached.{{ include "svc_fqdn" . }}:{{ .Values.memcached.memcached.port | default 11211 }}

{{- include "ini_sections.audit_middleware_notifications" . }}

[service_catalog]
auth_section = service_catalog
region_name = {{ .Values.global.region }}
# auth_section
auth_type = v3password
auth_version = v3
www_authenticate_uri = https://{{include "keystone_api_endpoint_host_public" .}}/v3
auth_url = {{.Values.global.keystone_api_endpoint_protocol_internal | default "http"}}://{{include "keystone_api_endpoint_host_internal" .}}:{{ .Values.global.keystone_api_port_internal | default 5000}}/v3
user_domain_name = {{.Values.global.keystone_service_domain | default "Default"}}
username = {{ .Values.global.ironicServiceUser }}{{ .Values.global.user_suffix }}
password = {{ .Values.global.ironicServicePassword | default (tuple . .Values.global.ironicServiceUser | include "identity.password_for_user")  | replace "$" "$$" }}
project_domain_name = {{.Values.global.keystone_service_domain | default "Default"}}
project_name = {{.Values.global.keystone_service_project | default "service"}}
insecure = True

[glance]
auth_section = service_catalog
glance_api_servers = {{.Values.global.glance_api_endpoint_protocol_internal | default "http"}}://{{include "glance_api_endpoint_host_internal" .}}:{{.Values.global.glance_api_port_internal | default 9292}}
swift_temp_url_duration=3600
# No terminal slash, it will break the url signing scheme
swift_endpoint_url={{.Values.global.swift_endpoint_protocol | default "https"}}://{{include "swift_endpoint_host" .}}:{{ .Values.global.swift_api_port_public | default 443}}
swift_api_version=v1
{{- if .Values.swift_store_multi_tenant }}
swift_store_multi_tenant = True
{{- else}}
    {{- if .Values.swift_multi_tenant }}
swift_store_multiple_containers_seed=32
    {{- end }}
swift_temp_url_key={{ .Values.swift_tempurl }}
swift_account={{ .Values.swift_account }}
{{- end }}

[swift]
auth_section = service_catalog
{{- if .Values.swift_set_temp_url_key }}
swift_set_temp_url_key = True
{{- end }}

[neutron]
auth_section = service_catalog
url = {{.Values.global.neutron_api_endpoint_protocol_internal | default "http"}}://{{include "neutron_api_endpoint_host_internal" .}}:{{ .Values.global.neutron_api_port_internal | default 9696}}
cleaning_network = {{ .Values.network_cleaning_uuid }}
provisioning_network = {{ .Values.network_management_uuid }}
url_timeout = {{ .Values.neutron_url_timeout }}
timeout = {{ .Values.neutron_url_timeout }}
port_setup_delay = {{ .Values.neutron_port_setup_delay }}

[oslo_middleware]
enable_proxy_headers_parsing = True

{{- if .Values.watcher.enabled }}
[watcher]
enabled = true
service_type = baremetal
config_file = /etc/ironic/watcher.yaml
{{ end }}

{{- include "osprofiler" . }}

{{- include "ini_sections.cache" . }}
