resource "azurerm_monitor_diagnostic_setting" "this" {
  name                       = var.name
  target_resource_id         = var.target_resource_id
  log_analytics_workspace_id = var.law_resource_id

  # Logs – caller passes the exact category names.
  # If the list is empty, no log blocks are created.
  dynamic "enabled_log" {
    for_each = toset(var.include_log_categories)
    content {
      category = enabled_log.value

      retention_policy {
        enabled = false
      }
    }
  }

  # Metrics – same idea, caller passes category names (e.g. "AllMetrics").
  dynamic "metric" {
    for_each = toset(var.include_metric_categories)
    content {
      category = metric.value

      retention_policy {
        enabled = false
      }
    }
  }
}
