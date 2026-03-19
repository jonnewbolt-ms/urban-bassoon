# No AVM module exists for Sentinel — use native azurerm resources.

resource "azurerm_sentinel_log_analytics_workspace_onboarding" "this" {
  workspace_id                 = var.log_analytics_workspace_id
  customer_managed_key_enabled = var.customer_managed_key_enabled
}

resource "azurerm_sentinel_alert_rule_fusion" "this" {
  for_each = var.enable_fusion_alert_rule ? { "fusion" = true } : {}

  name                       = var.fusion_alert_rule_name
  log_analytics_workspace_id = var.log_analytics_workspace_id
  alert_rule_template_guid   = "f71aba3d-28fb-450b-b192-4e76a83015c8"
  enabled                    = true

  depends_on = [azurerm_sentinel_log_analytics_workspace_onboarding.this]
}

resource "azurerm_sentinel_alert_rule_ms_security_incident" "this" {
  for_each = var.ms_security_incident_rules

  name                       = each.value.name
  log_analytics_workspace_id = var.log_analytics_workspace_id
  product_filter             = each.value.product_filter
  display_name               = each.value.display_name
  severity_filter            = each.value.severity_filter
  enabled                    = lookup(each.value, "enabled", true)

  depends_on = [azurerm_sentinel_log_analytics_workspace_onboarding.this]
}

resource "azurerm_sentinel_data_connector_azure_active_directory" "this" {
  for_each = var.enable_aad_connector ? { "aad" = true } : {}

  name                       = var.aad_connector_name
  log_analytics_workspace_id = var.log_analytics_workspace_id

  depends_on = [azurerm_sentinel_log_analytics_workspace_onboarding.this]
}

resource "azurerm_sentinel_data_connector_azure_security_center" "this" {
  for_each = var.enable_asc_connector ? { "asc" = true } : {}

  name                       = var.asc_connector_name
  log_analytics_workspace_id = var.log_analytics_workspace_id

  depends_on = [azurerm_sentinel_log_analytics_workspace_onboarding.this]
}

resource "azurerm_sentinel_data_connector_threat_intelligence" "this" {
  for_each = var.enable_ti_connector ? { "ti" = true } : {}

  name                       = var.ti_connector_name
  log_analytics_workspace_id = var.log_analytics_workspace_id

  depends_on = [azurerm_sentinel_log_analytics_workspace_onboarding.this]
}
