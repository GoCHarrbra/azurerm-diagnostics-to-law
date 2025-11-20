# Assumes in the SAME stack:
# - module "cosmos" (outputs `account_id`)

module "cosmos_diagnostics" {
  source = "github.com/GoCHarrbra/azurerm-diagnostics-to-law.git?ref=v0.1.0"

  name               = var.cosmos_diag.name
  target_resource_id = module.cosmos.account_id
  law_resource_id    = var.cosmos_diag.platform_law_id

  include_log_categories    = var.cosmos_diag.include_log_categories
  include_metric_categories = var.cosmos_diag.include_metric_categories

  depends_on = [
    module.cosmos
  ]
}
