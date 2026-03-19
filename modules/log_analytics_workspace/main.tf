module "log_analytics_workspace" {
  source  = "Azure/avm-res-operationalinsights-workspace/azurerm"
  version = "0.5.0"

  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  enable_telemetry    = var.enable_telemetry
  tags                = var.tags

  # Workspace configuration
  log_analytics_workspace_sku                                = var.sku
  log_analytics_workspace_retention_in_days                  = var.retention_in_days
  log_analytics_workspace_daily_quota_gb                     = var.daily_quota_gb
  log_analytics_workspace_reservation_capacity_in_gb_per_day = var.reservation_capacity_in_gb_per_day
  log_analytics_workspace_cmk_for_query_forced               = var.cmk_for_query_forced

  # Access & network
  log_analytics_workspace_internet_ingestion_enabled       = var.internet_ingestion_enabled
  log_analytics_workspace_internet_query_enabled           = var.internet_query_enabled
  log_analytics_workspace_allow_resource_only_permissions  = var.allow_resource_only_permissions
  log_analytics_workspace_local_authentication_enabled     = var.local_authentication_enabled

  # Identity
  log_analytics_workspace_identity = var.identity

  # AVM standard interfaces
  lock                          = var.lock
  role_assignments              = var.role_assignments
  diagnostic_settings           = var.diagnostic_settings
  private_endpoints             = var.private_endpoints
  monitor_private_link_scopes   = var.monitor_private_link_scopes

  # Solutions & linked services
  log_analytics_workspace_solutions             = var.solutions
  log_analytics_workspace_linked_service        = var.linked_services
  log_analytics_workspace_linked_storage_accounts = var.linked_storage_accounts

  # Tables & data exports
  log_analytics_workspace_tables        = var.tables
  log_analytics_workspace_tables_update = var.tables_update
  log_analytics_workspace_data_exports  = var.data_exports

  # Saved searches
  log_analytics_workspace_saved_searches = var.saved_searches
}
