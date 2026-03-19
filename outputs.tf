# ---------------------------------------------------------------------------
# Naming
# ---------------------------------------------------------------------------

output "naming_prefix" {
  description = "Common naming prefix: <BU>-<MGMT>-<ENV>-<REG>."
  value       = local.naming_prefix
}

# ---------------------------------------------------------------------------
# Resource Group
# ---------------------------------------------------------------------------

output "resource_group_name" {
  description = "Name of the deployed resource group."
  value       = module.resource_group.name
}

output "resource_group_id" {
  description = "Resource ID of the resource group."
  value       = module.resource_group.resource_id
}

# ---------------------------------------------------------------------------
# Log Analytics Workspace
# ---------------------------------------------------------------------------

output "log_analytics_workspace_id" {
  description = "Resource ID of the Log Analytics workspace."
  value       = module.log_analytics_workspace.resource_id
}

output "log_analytics_workspace_name" {
  description = "Name of the Log Analytics workspace."
  value       = module.log_analytics_workspace.name
}

output "log_analytics_workspace_customer_id" {
  description = "Immutable workspace GUID (customer ID)."
  value       = module.log_analytics_workspace.workspace_id
}

# ---------------------------------------------------------------------------
# Sentinel
# ---------------------------------------------------------------------------

output "sentinel_onboarding_id" {
  description = "ID of the Sentinel workspace onboarding."
  value       = module.sentinel.onboarding_id
}
