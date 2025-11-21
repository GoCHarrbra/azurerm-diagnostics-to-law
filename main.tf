variable "name" {
  description = "Name of the diagnostic setting."
  type        = string
}

variable "target_resource_id" {
  description = "ARM ID of the resource to which diagnostics are attached."
  type        = string
}

variable "law_resource_id" {
  description = "ARM ID of the Log Analytics workspace."
  type        = string
}

variable "include_log_categories" {
  description = "Exact log categories to enable (e.g. [\"ContainerAppConsoleLogs\"])."
  type        = list(string)
  default     = []
}

variable "include_metric_categories" {
  description = "Exact metric categories to enable (e.g. [\"AllMetrics\"])."
  type        = list(string)
  default     = []
}

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
      # retention_policy removed (deprecated)
    }
  }

  # Metrics – same idea, caller passes category names (e.g. "AllMetrics").
  dynamic "metric" {
    for_each = toset(var.include_metric_categories)
    content {
      category = metric.value
      # retention_policy removed (deprecated)
    }
  }
}
