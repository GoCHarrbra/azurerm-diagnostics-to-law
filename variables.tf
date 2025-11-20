variable "target_resource_id" {
  description = "Full ARM ID of the resource to send logs/metrics from (Cosmos, Container Apps Env, Key Vault, Storage, etc.)."
  type        = string
}

variable "law_resource_id" {
  description = "Full ARM ID of the Log Analytics Workspace (from monitoring-foundation)."
  type        = string
}

variable "name" {
  description = "Diagnostic setting name to create on the target resource."
  type        = string
}

variable "include_log_categories" {
  description = "If provided, only these log categories are enabled (must be valid for the target). If empty, enable all available."
  type        = list(string)
}

variable "include_metric_categories" {
  description = "If provided, only these metric categories are enabled (must be valid for the target). If empty, enable all available."
  type        = list(string)
}
