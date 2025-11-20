data "azurerm_monitor_diagnostic_categories" "this" {
  resource_id = var.target_resource_id
}

locals {
  logs_all    = toset(data.azurerm_monitor_diagnostic_categories.this.logs)
  metrics_all = toset(data.azurerm_monitor_diagnostic_categories.this.metrics)

  # If caller passes empty list, fall back to "all"; else use provided filters.
  logs_effective    = length(var.include_log_categories)    > 0 ? toset(var.include_log_categories)    : local.logs_all
  metrics_effective = length(var.include_metric_categories) > 0 ? toset(var.include_metric_categories) : local.metrics_all
}

resource "azurerm_monitor_diagnostic_setting" "this" {
  name                       = var.name
  target_resource_id         = var.target_resource_id
  log_analytics_workspace_id = var.law_resource_id

  dynamic "enabled_log" {
    for_each = local.logs_effective
    content {
      category = enabled_log.value
      retention_policy { enabled = false }
    }
  }

  dynamic "metric" {
    for_each = local.metrics_effective
    content {
      category = metric.value
      retention_policy { enabled = false }
    }
  }
}
