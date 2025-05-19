terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.29.0"
    }
  }
}
provider "azurerm" {
  features {}

    subscription_id = "51c7239f-55d9-49c2-8878-d9ac2918dc68"
    client_id = "f08630de-a906-4485-8487-4e38240ca663"
    client_secret = var.ARM_CLIENT_SECRET
    tenant_id = "5a2ec06b-b05e-4d96-affa-afc83b2a4629"
}
resource "azurerm_resource_group" "rg" {
  name     = "aks-lab"
  location = "centralus"
}

resource "azurerm_resource_group" "k8s" {
  name     = var.resource_group_name
  location = var.location
}

# resource "random_id" "log_analytics_workspace_name_suffix" {
#     byte_length = 8
# }

# resource "azurerm_log_analytics_workspace" "test" {
#     # The WorkSpace name has to be unique across the whole of azure, not just the current subscription/tenant.
#     name                = "${var.log_analytics_workspace_name}-${random_id.log_analytics_workspace_name_suffix.dec}"
#     location            = var.log_analytics_workspace_location
#     resource_group_name = azurerm_resource_group.k8s.name
#     sku                 = var.log_analytics_workspace_sku
# }

# resource "azurerm_log_analytics_solution" "test" {
#     solution_name         = "ContainerInsights"
#     location              = azurerm_log_analytics_workspace.test.location
#     resource_group_name   = azurerm_resource_group.k8s.name
#     workspace_resource_id = azurerm_log_analytics_workspace.test.id
#     workspace_name        = azurerm_log_analytics_workspace.test.name

#     plan {
#         publisher = "Microsoft"
#         product   = "OMSGallery/ContainerInsights"
#     }
# }

resource "azurerm_kubernetes_cluster" "k8s" {
  name                = var.cluster_name
  location            = azurerm_resource_group.k8s.location
  resource_group_name = azurerm_resource_group.k8s.name
  dns_prefix          = var.dns_prefix

  default_node_pool {
    name       = "syspool"
    node_count = var.agent_count
    vm_size    = "Standard_D2_v2"
  }
  service_principal {
    client_id     = var.client_id
    client_secret = var.ARM_CLIENT_SECRET   
  }
  network_profile {
    load_balancer_sku = "Standard"
    network_plugin    = "kubenet"
  }

  tags = {
    Environment = "Development"
  }
}