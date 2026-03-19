# ---------------------------------------------------------------------------
# Required
# ---------------------------------------------------------------------------

variable "log_analytics_workspace_id" {
  type        = string
  description = "Resource ID of the Log Analytics workspace to onboard Sentinel onto."
}

# ---------------------------------------------------------------------------
# Onboarding
# ---------------------------------------------------------------------------

variable "customer_managed_key_enabled" {
  type        = bool
  default     = false
  description = "Enable customer-managed key encryption for Sentinel."
}

# ---------------------------------------------------------------------------
# Fusion alert rule
# ---------------------------------------------------------------------------

variable "enable_fusion_alert_rule" {
  type        = bool
  default     = true
  description = "Enable the built-in Fusion (advanced multistage attack detection) alert rule."
}

variable "fusion_alert_rule_name" {
  type        = string
  default     = "advanced-multistage-attack-detection"
  description = "Name of the Fusion alert rule."
}

# ---------------------------------------------------------------------------
# MS Security Incident rules
# ---------------------------------------------------------------------------

variable "ms_security_incident_rules" {
  type = map(object({
    name            = string
    display_name    = string
    product_filter  = string
    severity_filter = list(string)
    enabled         = optional(bool, true)
  }))
  default     = {}
  description = <<-EOT
    Microsoft Security incident creation rules.
    `product_filter` examples: "Microsoft Defender for Cloud", "Microsoft Entra ID Protection",
    "Microsoft Defender for Endpoint", "Microsoft Defender for Office 365".
  EOT
}

# ---------------------------------------------------------------------------
# Data connectors
# ---------------------------------------------------------------------------

variable "enable_aad_connector" {
  type        = bool
  default     = false
  description = "Enable the Microsoft Entra ID (AAD) data connector."
}

variable "aad_connector_name" {
  type        = string
  default     = "aad-connector"
  description = "Name of the Entra ID data connector."
}

variable "enable_asc_connector" {
  type        = bool
  default     = false
  description = "Enable the Microsoft Defender for Cloud (ASC) data connector."
}

variable "asc_connector_name" {
  type        = string
  default     = "asc-connector"
  description = "Name of the Defender for Cloud data connector."
}

variable "enable_ti_connector" {
  type        = bool
  default     = false
  description = "Enable the Threat Intelligence data connector."
}

variable "ti_connector_name" {
  type        = string
  default     = "ti-connector"
  description = "Name of the Threat Intelligence data connector."
}
