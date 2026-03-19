# ---------------------------------------------------------------------------
# Required
# ---------------------------------------------------------------------------

variable "name" {
  type        = string
  description = "The name of the Log Analytics workspace."
}

variable "location" {
  type        = string
  description = "Azure region for the workspace."
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group to deploy into."
}

# ---------------------------------------------------------------------------
# Workspace settings
# ---------------------------------------------------------------------------

variable "sku" {
  type        = string
  default     = "PerGB2018"
  description = "SKU of the workspace. Common values: `PerGB2018`, `CapacityReservation`, `Free`, `Standalone`."
}

variable "retention_in_days" {
  type        = number
  default     = 90
  description = "Data retention in days (30–730)."
}

variable "daily_quota_gb" {
  type        = number
  default     = -1
  description = "Daily ingestion cap in GB. `-1` means unlimited."
}

variable "reservation_capacity_in_gb_per_day" {
  type        = number
  default     = null
  description = "Capacity reservation in GB/day. Only applies when SKU is `CapacityReservation`."
}

variable "cmk_for_query_forced" {
  type        = bool
  default     = null
  description = "Whether saved queries are stored using customer-managed keys."
}

variable "internet_ingestion_enabled" {
  type        = string
  default     = "true"
  description = "Allow public ingestion. Valid values: `true`, `false`, `SecuredByPerimeter`."
}

variable "internet_query_enabled" {
  type        = string
  default     = "true"
  description = "Allow public queries. Valid values: `true`, `false`, `SecuredByPerimeter`."
}

variable "allow_resource_only_permissions" {
  type        = bool
  default     = true
  description = "Enable resource-context access to workspace data."
}

variable "local_authentication_enabled" {
  type        = bool
  default     = true
  description = "Enable local (non-AAD) authentication."
}

# ---------------------------------------------------------------------------
# Identity
# ---------------------------------------------------------------------------

variable "identity" {
  type = object({
    type         = string
    identity_ids = optional(list(string), null)
  })
  default     = null
  description = "Managed identity block. `type` can be `SystemAssigned`, `UserAssigned`, or `SystemAssigned, UserAssigned`."
}

# ---------------------------------------------------------------------------
# AVM standard interfaces
# ---------------------------------------------------------------------------

variable "tags" {
  type        = map(string)
  default     = null
  description = "Tags to apply to the workspace."
}

variable "enable_telemetry" {
  type        = bool
  default     = true
  description = "Controls whether AVM telemetry is enabled."
}

variable "lock" {
  type = object({
    kind = string
    name = optional(string, null)
  })
  default     = null
  description = "Resource lock configuration."
}

variable "role_assignments" {
  type        = map(object({
    role_definition_id_or_name             = string
    principal_id                           = string
    description                            = optional(string, null)
    skip_service_principal_aad_check       = optional(bool, false)
    condition                              = optional(string, null)
    condition_version                      = optional(string, null)
    delegated_managed_identity_resource_id = optional(string, null)
    principal_type                         = optional(string, null)
  }))
  default     = {}
  description = "Role assignments to create on the workspace."
}

variable "diagnostic_settings" {
  type        = any
  default     = {}
  description = "Diagnostic settings map. Pass-through to the AVM module."
}

variable "private_endpoints" {
  type        = any
  default     = {}
  description = "Private endpoint configurations. Pass-through to the AVM module."
}

variable "monitor_private_link_scopes" {
  type        = any
  default     = {}
  description = "Azure Monitor Private Link Scope configurations."
}

# ---------------------------------------------------------------------------
# Solutions, linked services & storage
# ---------------------------------------------------------------------------

variable "solutions" {
  type        = any
  default     = {}
  description = "Log Analytics solutions to deploy (e.g. SecurityInsights, Updates)."
}

variable "linked_services" {
  type        = any
  default     = {}
  description = "Linked services (e.g. automation account) for the workspace."
}

variable "linked_storage_accounts" {
  type        = any
  default     = {}
  description = "Linked storage accounts for custom log ingestion."
}

# ---------------------------------------------------------------------------
# Tables & data exports
# ---------------------------------------------------------------------------

variable "tables" {
  type        = any
  default     = {}
  description = "Custom table definitions for the workspace."
}

variable "tables_update" {
  type        = any
  default     = {}
  description = "Updates to existing workspace tables (retention, plan)."
}

variable "data_exports" {
  type        = any
  default     = {}
  description = "Data export rules to Event Hubs or Storage Accounts."
}

# ---------------------------------------------------------------------------
# Saved searches
# ---------------------------------------------------------------------------

variable "saved_searches" {
  type        = any
  default     = {}
  description = "Saved search queries for the workspace."
}
