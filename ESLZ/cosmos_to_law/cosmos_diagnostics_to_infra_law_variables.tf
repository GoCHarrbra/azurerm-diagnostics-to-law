variable "cosmos_diag" {
  description = "Diagnostics settings for Cosmos DB account → Platform/Infra LAW."
  type = object({
    name                      = string
    platform_law_id           = string          # ARM id of the Platform/Infra LAW
    include_log_categories    = list(string)    # e.g., ["DataPlaneRequests","ControlPlaneRequests"]
    include_metric_categories = list(string)    # e.g., ["AllMetrics"]
  })
}
