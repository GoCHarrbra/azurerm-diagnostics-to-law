cae_diag = {
  name                      = "containerapps-env-to-law-fair"
  container_apps_env_key    = "fair"

  # App-only telemetry today; add "AllMetrics" later if you want ACA platform metrics too.
  include_log_categories    = ["ContainerAppConsoleLogs"]
  include_metric_categories = []
}
