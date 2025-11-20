# azurerm-diagnostics-to-law

Terraform module to connect Azure Diagnostics to Log Analytics Workspace.

## Description

This Terraform module provisions Azure resources to route diagnostic logs and metrics from supported Azure services to a Log Analytics Workspace (LAW). The module automates connection and configuration, helping you centralize monitoring and logging in Azure.

## Features

- Creates diagnostic settings for selected Azure resources
- Routes logs and metrics to a Log Analytics Workspace
- Supports custom resource selection and configuration
- Parameterized for flexible deployments

## Usage

```hcl
module "diagnostics_to_law" {
  source  = "github.com/GoCHarrbra/azurerm-diagnostics-to-law"
  # Required variables
  resource_id           = "<azure_resource_id>"
  log_analytics_workspace_id = "<log_analytics_workspace_resource_id>"
  # Optional: specify logs and metrics categories
  logs                  = ["AuditEvent", "Security"]
  metrics               = ["AllMetrics"]
}
```

## Inputs

| Name                       | Description                                      | Type         | Required |
|----------------------------|--------------------------------------------------|--------------|----------|
| resource_id                | The ID of the Azure resource for diagnostics     | string       | yes      |
| log_analytics_workspace_id | The ID of the Log Analytics Workspace            | string       | yes      |
| logs                       | List of log categories to send to LAW            | list(string) | no       |
| metrics                    | List of metrics categories to send to LAW        | list(string) | no       |

## Outputs

| Name           | Description            |
|----------------|-----------------------|
| diagnostics_id | ID of the diagnostics |

## Examples

Basic usage example:

```hcl
module "diagnostics_to_law" {
  source                       = "github.com/GoCHarrbra/azurerm-diagnostics-to-law"
  resource_id                  = azurerm_storage_account.example.id
  log_analytics_workspace_id   = azurerm_log_analytics_workspace.example.id
  logs                         = ["StorageRead", "StorageWrite"]
  metrics                      = ["AllMetrics"]
}
```

## License

MIT

---

PRs and improvements are welcome!
