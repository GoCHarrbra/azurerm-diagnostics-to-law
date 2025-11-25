# All fields required; must be set in containerapps-diagnostics.tfvars
variable "cae_diag" {
  description = "Diagnostics config for Container Apps Environment to app-telemetry LAW."
  type = object({
    # Friendly name for the diagnostic setting
    name = string

    # Direct ARM ID of the Container Apps Environment
    # e.g. /subscriptions/xxx/resourceGroups/yyy/providers/Microsoft.App/managedEnvironments/cae
    target_resource_id = string

    # Categories you want enabled
    include_log_categories    = list(string)
    include_metric_categories = list(string)
  })
}

module "cae_diagnostics" {
  source = "github.com/GoCHarrbra/azurerm-diagnostics-to-law.git?ref=v0.7.0"

  name               = var.cae_diag.name
  target_resource_id = var.cae_diag.target_resource_id
  law_resource_id    = module.foundation.law_id           # from foundation

  include_log_categories    = var.cae_diag.include_log_categories
  include_metric_categories = var.cae_diag.include_metric_categories

  depends_on = [module.foundation]
}


