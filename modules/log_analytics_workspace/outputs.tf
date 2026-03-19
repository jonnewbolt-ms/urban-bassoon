output "resource" {
  description = "The full Log Analytics workspace resource object."
  sensitive   = true
  value       = module.log_analytics_workspace.resource
}

output "resource_id" {
  description = "The resource ID of the Log Analytics workspace."
  value       = module.log_analytics_workspace.resource_id
}

output "name" {
  description = "The name of the Log Analytics workspace."
  value       = module.log_analytics_workspace.resource.name
}

output "workspace_id" {
  description = "The immutable workspace GUID (customer ID)."
  value       = module.log_analytics_workspace.resource.workspace_id
}

output "primary_shared_key" {
  description = "Primary shared key for the workspace."
  sensitive   = true
  value       = module.log_analytics_workspace.resource.primary_shared_key
}

output "secondary_shared_key" {
  description = "Secondary shared key for the workspace."
  sensitive   = true
  value       = module.log_analytics_workspace.resource.secondary_shared_key
}

output "private_endpoints" {
  description = "Map of private endpoints created for the workspace."
  value       = module.log_analytics_workspace.private_endpoints
}
