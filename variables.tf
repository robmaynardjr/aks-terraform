variable "ARM_CLIENT_SECRET" {
  type = string
}

variable "agent_count" {
  default = 2
}

variable "ssh_public_key" {
  default = "~/.ssh/id_ed25519.pub"
}

variable "dns_prefix" {
  default = "spacelift"
}

variable "cluster_name" {
  default = "spacelift-aks"
}

variable "resource_group_name" {
  default = "spacelift-rg"
}

variable "location" {
  default = "eastus"
}

# variable log_analytics_workspace_name {
#     default = "testLogAnalyticsWorkspaceName"
# }

# # refer https://azure.microsoft.com/global-infrastructure/services/?products=monitor for log analytics available regions
# variable log_analytics_workspace_location {
#     default = "centralus"
# }

# # refer https://azure.microsoft.com/pricing/details/monitor/ for log analytics pricing 
# variable log_analytics_workspace_sku {
#     default = "PerGB2018"
# }

