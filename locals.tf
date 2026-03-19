# =============================================================================
#  Naming Convention
# =============================================================================
# Pattern: <BU>-<MGMT>-<ENV>-<REG>-<RTYPE>-<APP/TIER>-<NNN>
# =============================================================================

locals {
  naming_prefix = "${var.bu}-${var.mgmt}-${var.env}-${var.region_code}"

  # Resource names composed from the convention
  resource_group_name          = "${local.naming_prefix}-rg-${var.app_tier}-${var.instance}"
  log_analytics_workspace_name = "${local.naming_prefix}-law-${var.app_tier}-${var.instance}"

  # Sentinel sub-resource names
  sentinel_fusion_rule_name = "${local.naming_prefix}-sar-fusion-${var.instance}"
  sentinel_aad_connector    = "${local.naming_prefix}-sdc-aad-${var.instance}"
  sentinel_asc_connector    = "${local.naming_prefix}-sdc-asc-${var.instance}"
  sentinel_ti_connector     = "${local.naming_prefix}-sdc-ti-${var.instance}"
}
