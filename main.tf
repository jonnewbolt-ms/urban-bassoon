# =============================================================================
#  Sentinel Data Lake – Root Module
# =============================================================================
# Customise the variable values below or in a .tfvars file.
# Each module block maps to a wrapper module under ./modules/ that references
# an Azure Verified Module (AVM) where available.
# =============================================================================

# ----- Resource Group --------------------------------------------------------

module "resource_group" {
  source = "./modules/resource_group"

  name             = local.resource_group_name
  location         = var.location
  tags             = var.tags
  enable_telemetry = var.enable_telemetry
  lock             = var.resource_group_lock
}

# ----- Log Analytics Workspace -----------------------------------------------

module "log_analytics_workspace" {
  source = "./modules/log_analytics_workspace"

  name                = local.log_analytics_workspace_name
  location            = var.location
  resource_group_name = module.resource_group.name
  tags                = var.tags
  enable_telemetry    = var.enable_telemetry

  sku                        = var.law_sku
  retention_in_days          = var.law_retention_in_days
  daily_quota_gb             = var.law_daily_quota_gb
  internet_ingestion_enabled = var.law_internet_ingestion_enabled
  internet_query_enabled     = var.law_internet_query_enabled
  identity                   = var.law_identity
  solutions                  = var.law_solutions
  diagnostic_settings        = var.law_diagnostic_settings
  private_endpoints          = var.law_private_endpoints

  depends_on = [module.resource_group]
}

# ----- Microsoft Sentinel ----------------------------------------------------

module "sentinel" {
  source = "./modules/sentinel"

  log_analytics_workspace_id     = module.log_analytics_workspace.resource_id
  customer_managed_key_enabled   = var.sentinel_customer_managed_key_enabled
  enable_fusion_alert_rule       = var.sentinel_enable_fusion_alert_rule
  fusion_alert_rule_name         = local.sentinel_fusion_rule_name
  ms_security_incident_rules     = var.sentinel_ms_security_incident_rules
  enable_aad_connector           = var.sentinel_enable_aad_connector
  aad_connector_name             = local.sentinel_aad_connector
  enable_asc_connector           = var.sentinel_enable_asc_connector
  asc_connector_name             = local.sentinel_asc_connector
  enable_ti_connector            = var.sentinel_enable_ti_connector
  ti_connector_name              = local.sentinel_ti_connector

  depends_on = [module.log_analytics_workspace]
}
