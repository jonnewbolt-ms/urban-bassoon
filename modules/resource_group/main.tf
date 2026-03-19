module "resource_group" {
  source  = "Azure/avm-res-resources-resourcegroup/azurerm"
  version = "0.2.1"

  name             = var.name
  location         = var.location
  enable_telemetry = var.enable_telemetry
  lock             = var.lock
  role_assignments = var.role_assignments
  tags             = var.tags
}
