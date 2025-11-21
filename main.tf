resource "azurerm_monitor_diagnostic_setting" "this" {
  name                       = var.name
  target_resource_id         = var.target_resource_id
  log_analytics_workspace_id = var.law_resource_id

  # Logs – caller passes the exact category names.
  # If the list is empty, no log blocks are created (caller's responsibility).
  dynamic "enabled_log" {
    for_each = toset(var.include_log_categories)
    content {
      category = enabled_log.value
    }
  }

  # Metrics – use the new enabled_metric block (not the deprecated metric block).
  dynamic "enabled_metric" {
    for_each = toset(var.include_metric_categories)
    content {
      category = enabled_metric.value
    }
  }
}
