{
    "context_is_cloud_admin": "role:cloud_dns_admin",
    "admin": "rule:context_is_cloud_admin or is_admin:True",
    "primary_zone": "target.zone_type:SECONDARY",

    "owner": "tenant:%(tenant_id)s",
    "member": "role:member and rule:owner",
    "viewer": "role:dns_viewer and rule:owner",
    "dns_admin": "role:dns_admin and rule:owner",
    "context_is_dns_admin": "rule:admin or rule:dns_admin",
    "context_is_editor": "rule:context_is_dns_admin or rule:member",
    "context_is_viewer":  "rule:context_is_editor or rule:viewer",

    "zone_primary_or_admin": "('PRIMARY':%(zone_type)s and rule:context_is_editor) or ('SECONDARY':%(zone_type)s and is_admin:True)",

    "default": "rule:context_is_editor",

    "all_tenants": "rule:admin",
    "edit_managed_records" : "rule:admin",
    "use_low_ttl": "rule:admin",

    "get_quotas": "rule:context_is_viewer",
    "get_quota": "rule:context_is_viewer",
    "set_quota": "rule:admin",
    "reset_quotas": "rule:admin",

    "create_tld": "rule:admin",
    "find_tlds": "rule:admin",
    "get_tld": "rule:admin",
    "update_tld": "rule:admin",
    "delete_tld": "rule:admin",

    "create_tsigkey": "rule:admin",
    "find_tsigkeys": "rule:admin",
    "get_tsigkey": "rule:admin",
    "update_tsigkey": "rule:admin",
    "delete_tsigkey": "rule:admin",

    "find_tenants": "rule:admin",
    "get_tenant": "rule:admin",
    "count_tenants": "rule:admin",

    "create_zone": "rule:context_is_dns_admin",
    "create_sub_zone": "rule:context_is_dns_admin",
    "get_zones": "rule:context_is_viewer",
    "get_zone": "rule:context_is_viewer",
    "get_zone_servers": "rule:context_is_viewer",
    "find_zones": "rule:context_is_viewer",
    "find_zone": "rule:context_is_viewer",
    "update_zone": "rule:context_is_dns_admin",
    "update_sub_zone": "rule:context_is_dns_admin",
    "delete_zone": "rule:context_is_dns_admin",
    "delete_sub_zone": "rule:context_is_dns_admin",
    "xfr_zone": "rule:context_is_viewer",
    "abandon_zone": "rule:admin",
    "count_zones": "rule:context_is_viewer",
    "count_zones_pending_notify": "rule:context_is_viewer",
    "purge_zones": "rule:admin",
    "touch_zone": "rule:context_is_editor",

    "create_A_recordset": "rule:zone_primary_or_admin",
    "create_AAAA_recordset": "rule:zone_primary_or_admin",
    "create_CNAME_recordset": "rule:zone_primary_or_admin",
    "create_MX_recordset": "rule:zone_primary_or_admin",
    "create_NS_recordset": "rule:zone_primary_or_admin",
    "create_PTR_recordset": "rule:zone_primary_or_admin",
    "create_SOA_recordset": "rule:zone_primary_or_admin",
    "create_SPF_recordset": "rule:zone_primary_or_admin",
    "create_SRV_recordset": "rule:zone_primary_or_admin",
    "create_SSHFP_recordset": "rule:zone_primary_or_admin",
    "create_TXT_recordset": "rule:zone_primary_or_admin",

    "update_A_recordset": "rule:zone_primary_or_admin",
    "update_AAAA_recordset": "rule:zone_primary_or_admin",
    "update_CNAME_recordset": "rule:zone_primary_or_admin",
    "update_MX_recordset": "rule:zone_primary_or_admin",
    "update_NS_recordset": "rule:zone_primary_or_admin",
    "update_PTR_recordset": "rule:zone_primary_or_admin",
    "update_SOA_recordset": "rule:zone_primary_or_admin",
    "update_SPF_recordset": "rule:zone_primary_or_admin",
    "update_SRV_recordset": "rule:zone_primary_or_admin",
    "update_SSHFP_recordset": "rule:zone_primary_or_admin",
    "update_TXT_recordset": "rule:zone_primary_or_admin",

    "delete_A_recordset": "rule:zone_primary_or_admin",
    "delete_AAAA_recordset": "rule:zone_primary_or_admin",
    "delete_CNAME_recordset": "rule:zone_primary_or_admin",
    "delete_MX_recordset": "rule:zone_primary_or_admin",
    "delete_NS_recordset": "rule:zone_primary_or_admin",
    "delete_PTR_recordset": "rule:zone_primary_or_admin",
    "delete_SOA_recordset": "rule:zone_primary_or_admin",
    "delete_SPF_recordset": "rule:zone_primary_or_admin",
    "delete_SRV_recordset": "rule:zone_primary_or_admin",
    "delete_SSHFP_recordset": "rule:zone_primary_or_admin",
    "delete_TXT_recordset": "rule:zone_primary_or_admin",

    "get_recordsets": "rule:context_is_viewer",
    "get_recordset": "rule:context_is_viewer",
    "find_recordsets": "rule:context_is_viewer",
    "find_recordset": "rule:context_is_viewer",
    "count_recordset": "rule:context_is_viewer",

    "create_record": "rule:context_is_editor",
    "get_records": "rule:context_is_viewer",
    "get_record": "rule:context_is_viewer",
    "find_records": "rule:context_is_viewer",
    "find_record": "rule:context_is_viewer",
    "update_record": "rule:context_is_editor",
    "delete_record": "rule:context_is_editor",
    "count_records": "rule:context_is_viewer",

    "use_sudo": "rule:admin",

    "create_blacklist": "rule:admin",
    "find_blacklist": "rule:admin",
    "find_blacklists": "rule:admin",
    "get_blacklist": "rule:admin",
    "update_blacklist": "rule:admin",
    "delete_blacklist": "rule:admin",
    "use_blacklisted_zone": "rule:admin",

    "create_pool": "rule:admin",
    "find_pools": "rule:admin",
    "find_pool": "rule:admin",
    "get_pool": "rule:admin",
    "update_pool": "rule:admin",
    "delete_pool": "rule:admin",
    "zone_create_forced_pool": "rule:admin",

    "diagnostics_ping": "rule:admin",
    "diagnostics_sync_zones": "rule:admin",
    "diagnostics_sync_zone": "rule:admin",
    "diagnostics_sync_record": "rule:admin",

    "create_zone_transfer_request": "rule:context_is_dns_admin",
    "get_zone_transfer_request": "rule:context_is_viewer or tenant:%(target_tenant_id)s or None:%(target_tenant_id)s",
    "get_zone_transfer_request_detailed": "rule:context_is_dns_admin",
    "find_zone_transfer_requests": "@",
    "find_zone_transfer_request": "@",
    "update_zone_transfer_request": "rule:context_is_dns_admin",
    "delete_zone_transfer_request": "rule:context_is_dns_admin",

    "create_zone_transfer_accept": "rule:context_is_editor or tenant:%(target_tenant_id)s or None:%(target_tenant_id)s",
    "get_zone_transfer_accept": "rule:context_is_viewer",
    "find_zone_transfer_accepts": "rule:admin",
    "find_zone_transfer_accept": "rule:admin",
    "update_zone_transfer_accept": "rule:admin",
    "delete_zone_transfer_accept": "rule:admin",

    "create_zone_import": "rule:context_is_dns_admin",
    "find_zone_imports": "rule:context_is_dns_admin",
    "get_zone_import": "rule:context_is_dns_admin",
    "update_zone_import": "rule:context_is_dns_admin",
    "delete_zone_import": "rule:context_is_dns_admin",

    "zone_export": "rule:context_is_editor",
    "create_zone_export": "rule:context_is_editor",
    "find_zone_exports": "rule:context_is_viewer",
    "get_zone_export": "rule:context_is_viewer",
    "update_zone_export": "rule:context_is_editor",

    "find_service_status": "rule:admin",
    "find_service_statuses": "rule:admin",
    "update_service_service_status": "rule:admin"
}
