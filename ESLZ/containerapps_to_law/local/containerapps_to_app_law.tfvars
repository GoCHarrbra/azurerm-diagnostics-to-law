cae_diag = {
  name                      = "containerapps-env-to-law-fair"
  target_resource_id = "/subscriptions/subID/resourceGroups/RGNAME/providers/Microsoft.App/managedEnvironments/caeNAME"
  # App-only telemetry today; add "AllMetrics" later if you want ACA platform metrics too.
  include_log_categories    = ["ContainerAppConsoleLogs"]
  include_metric_categories = []
}

