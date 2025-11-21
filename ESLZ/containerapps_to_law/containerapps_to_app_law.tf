# Assumes these modules exist in the SAME stack:
# - module "containerApps"  (outputs `environments` map: { key => { object, umi } })
# - module "foundation"     (outputs `law_id`)

locals {
  envs          = try(module.containerApps.environments, {})
  selected_env  = try(local.envs[var.cae_diag.container_apps_env_key], null)
  cae_id        = try(local.selected_env.object.id, null)
}

module "cae_diagnostics" {
  source = "github.com/GoCHarrbra/azurerm-diagnostics-to-law.git?ref=v0.6.0"

  name               = var.cae_diag.name
  target_resource_id = local.cae_id                       # derived from containerapps module outputs
  law_resource_id    = module.foundation.law_id           # from foundation

  include_log_categories    = var.cae_diag.include_log_categories
  include_metric_categories = var.cae_diag.include_metric_categories

  depends_on = [module.foundation, module.containerApps]
}

# Guardrail: fail early if the key doesn't exist
resource "null_resource" "validate_env_key" {
  triggers = {
    cae_id = local.cae_id != null ? local.cae_id : "MISSING"
  }
  lifecycle {
    precondition {
      condition     = self.triggers.cae_id != "MISSING"
      error_message = "Container Apps env key '${var.cae_diag.container_apps_env_key}' not found in module.containerApps.environments."
    }
  }
}
