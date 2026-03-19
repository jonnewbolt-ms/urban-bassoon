# ---------------------------------------------------------------------------
# Naming Convention Components
# ---------------------------------------------------------------------------
# Pattern: <BU>-<MGMT>-<ENV>-<REG>-<RTYPE>-<APP/TIER>-<NNN>
# ---------------------------------------------------------------------------

variable "bu" {
  type        = string
  description = "Business unit or company identifier (e.g. `contoso`, `fin`, `hr`)."

  validation {
    condition     = can(regex("^[a-z0-9]+$", var.bu))
    error_message = "bu must be lowercase alphanumeric."
  }
}

variable "mgmt" {
  type        = string
  description = "Management scope or service domain (e.g. `it`, `ops`, `sec`)."

  validation {
    condition     = can(regex("^[a-z0-9]+$", var.mgmt))
    error_message = "mgmt must be lowercase alphanumeric."
  }
}

variable "env" {
  type        = string
  description = "Environment (e.g. `dev`, `test`, `qa`, `prod`)."

  validation {
    condition     = contains(["dev", "test", "qa", "staging", "prod"], var.env)
    error_message = "env must be one of: dev, test, qa, staging, prod."
  }
}

variable "region_code" {
  type        = string
  description = "Azure region short code (e.g. `eus2`, `weu`). Used only in resource names."

  validation {
    condition     = can(regex("^[a-z0-9]+$", var.region_code))
    error_message = "region_code must be lowercase alphanumeric."
  }
}

variable "app_tier" {
  type        = string
  description = "Application, project, or tier identifier (e.g. `sentinel`, `backend`, `db`)."

  validation {
    condition     = can(regex("^[a-z0-9]+$", var.app_tier))
    error_message = "app_tier must be lowercase alphanumeric."
  }
}

variable "instance" {
  type        = string
  default     = "001"
  description = "Instance or sequence number (e.g. `001`, `002`)."

  validation {
    condition     = can(regex("^[0-9]{3}$", var.instance))
    error_message = "instance must be a three-digit zero-padded number (e.g. 001)."
  }
}

# ---------------------------------------------------------------------------
# Common
# ---------------------------------------------------------------------------

variable "location" {
  type        = string
  description = "Azure region for all resources (full name, e.g. `eastus2`)."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags applied to all resources."
}

variable "enable_telemetry" {
  type        = bool
  default     = true
  description = "Controls AVM telemetry collection."
}

# ---------------------------------------------------------------------------
# Resource Group
# ---------------------------------------------------------------------------

variable "resource_group_lock" {
  type = object({
    kind = string
    name = optional(string, null)
  })
  default     = null
  description = "Resource lock for the resource group."
}

# ---------------------------------------------------------------------------
# Log Analytics Workspace
# ---------------------------------------------------------------------------

variable "law_sku" {
  type        = string
  default     = "PerGB2018"
  description = "SKU of the Log Analytics workspace."
}

variable "law_retention_in_days" {
  type        = number
  default     = 90
  description = "Log Analytics data retention in days."
}

variable "law_daily_quota_gb" {
  type        = number
  default     = -1
  description = "Daily ingestion cap in GB (`-1` = unlimited)."
}

variable "law_internet_ingestion_enabled" {
  type        = string
  default     = "true"
  description = "Allow public ingestion (`true`, `false`, `SecuredByPerimeter`)."
}

variable "law_internet_query_enabled" {
  type        = string
  default     = "true"
  description = "Allow public queries (`true`, `false`, `SecuredByPerimeter`)."
}

variable "law_identity" {
  type = object({
    type         = string
    identity_ids = optional(list(string), null)
  })
  default     = null
  description = "Managed identity for the workspace."
}

variable "law_solutions" {
  type        = any
  default     = {}
  description = "Log Analytics solutions to deploy alongside the workspace."
}

variable "law_diagnostic_settings" {
  type        = any
  default     = {}
  description = "Diagnostic settings for the workspace."
}

variable "law_private_endpoints" {
  type        = any
  default     = {}
  description = "Private endpoint configurations for the workspace."
}

# ---------------------------------------------------------------------------
# Sentinel
# ---------------------------------------------------------------------------

variable "sentinel_customer_managed_key_enabled" {
  type        = bool
  default     = false
  description = "Enable CMK encryption for Sentinel."
}

variable "sentinel_enable_fusion_alert_rule" {
  type        = bool
  default     = true
  description = "Enable Fusion (advanced multistage) alert rule."
}

variable "sentinel_ms_security_incident_rules" {
  type = map(object({
    name            = string
    display_name    = string
    product_filter  = string
    severity_filter = list(string)
    enabled         = optional(bool, true)
  }))
  default     = {}
  description = "Microsoft security incident creation rules."
}

variable "sentinel_enable_aad_connector" {
  type        = bool
  default     = false
  description = "Enable the Entra ID data connector."
}

variable "sentinel_enable_asc_connector" {
  type        = bool
  default     = false
  description = "Enable the Defender for Cloud data connector."
}

variable "sentinel_enable_ti_connector" {
  type        = bool
  default     = false
  description = "Enable the Threat Intelligence data connector."
}
