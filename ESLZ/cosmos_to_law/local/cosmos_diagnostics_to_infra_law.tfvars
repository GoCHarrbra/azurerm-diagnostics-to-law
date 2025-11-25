cosmos_diag = {
  name                      = "cosmos-to-platform-law"
  platform_law_id           = "/subscriptions/<SUBID>/resourceGroups/<RG>/providers/Microsoft.OperationalInsights/workspaces/<PLATFORM-LAW>"
  include_metric_categories = [
    "AllMetrics"
  ]
  include_log_categories    = [
    "DataPlaneRequests",
    "ControlPlaneRequests"
  ]
}
