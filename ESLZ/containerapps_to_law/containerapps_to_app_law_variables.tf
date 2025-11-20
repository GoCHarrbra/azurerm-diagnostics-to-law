variable "cae_diag" {
  description = "Diagnostics settings for Container Apps Environment → LAW."
  type = object({
    name                    = string                       # e.g., "containerapps-env-to-law-dev"
    container_apps_env_key  = string                       # must match your container-app-environment map key (e.g., "fair", "dev")
    include_log_categories  = list(string)                 # e.g., ["ContainerAppConsoleLogs"]
    include_metric_categories = list(string)               # e.g., [] or ["AllMetrics"]
  })
}
