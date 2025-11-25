# Assumes in the SAME stack:
# - module "cosmos" (outputs `account_id`)
variable "cosmos_diag" {
  description = "Diagnostics settings for Cosmos DB account → Platform/Infra LAW."
  type = object({
    name                      = string
    platform_law_id           = string          # ARM id of the Platform/Infra LAW
    include_log_categories    = list(string)    # e.g., ["DataPlaneRequests","ControlPlaneRequests"]
    include_metric_categories = list(string)    # e.g., ["AllMetrics"]
  })
}

module "cosmos_diagnostics" {
  source = "github.com/GoCHarrbra/azurerm-diagnostics-to-law.git?ref=v0.7.0"

  name               = var.cosmos_diag.name
  target_resource_id = module.cosmos.account_id
  law_resource_id    = module.foundation.law_id           # from foundation

  include_log_categories    = var.cosmos_diag.include_log_categories
  include_metric_categories = var.cosmos_diag.include_metric_categories

  depends_on = [
    module.cosmos, module.foundation
  ]
}

