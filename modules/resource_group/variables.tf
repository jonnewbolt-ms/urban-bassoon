variable "name" {
  type        = string
  description = "The name of the resource group."
}

variable "location" {
  type        = string
  description = "The Azure region for the resource group."
}

variable "tags" {
  type        = map(string)
  default     = null
  description = "Tags to apply to the resource group."
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
  description = "Resource lock configuration. `kind` must be `CanNotDelete` or `ReadOnly`."
}

variable "role_assignments" {
  type = map(object({
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
  description = "Role assignments to create on the resource group."
}
