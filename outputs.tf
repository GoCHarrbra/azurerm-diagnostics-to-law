output "id" {
  description = "ID of the diagnostic setting."
  value       = azurerm_monitor_diagnostic_setting.this.id
}

output "name" {
  description = "Name of the diagnostic setting."
  value       = azurerm_monitor_diagnostic_setting.this.name
}

output "target_resource_id" {
  description = "ARM ID of the resource sending diagnostics."
  value       = azurerm_monitor_diagnostic_setting.this.target_resource_id
}

output "law_resource_id" {
  description = "ARM ID of the Log Analytics Workspace receiving diagnostics."
  value       = azurerm_monitor_diagnostic_setting.this.log_analytics_workspace_id
}

output "enabled_log_categories" {
  description = "Log categories enabled by this setting."
  value       = [for l in azurerm_monitor_diagnostic_setting.this.enabled_log : l.category]
}

output "enabled_metric_categories" {
  description = "Metric categories enabled by this setting."
  value       = [for m in azurerm_monitor_diagnostic_setting.this.metric : m.category]
}
