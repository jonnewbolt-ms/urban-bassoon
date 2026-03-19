output "onboarding_id" {
  description = "The ID of the Sentinel workspace onboarding resource."
  value       = azurerm_sentinel_log_analytics_workspace_onboarding.this.id
}

output "fusion_alert_rule_id" {
  description = "The ID of the Fusion alert rule (if enabled)."
  value       = var.enable_fusion_alert_rule ? azurerm_sentinel_alert_rule_fusion.this["fusion"].id : null
}

output "aad_connector_id" {
  description = "The ID of the Entra ID data connector (if enabled)."
  value       = var.enable_aad_connector ? azurerm_sentinel_data_connector_azure_active_directory.this["aad"].id : null
}

output "asc_connector_id" {
  description = "The ID of the Defender for Cloud data connector (if enabled)."
  value       = var.enable_asc_connector ? azurerm_sentinel_data_connector_azure_security_center.this["asc"].id : null
}

output "ti_connector_id" {
  description = "The ID of the Threat Intelligence data connector (if enabled)."
  value       = var.enable_ti_connector ? azurerm_sentinel_data_connector_threat_intelligence.this["ti"].id : null
}
