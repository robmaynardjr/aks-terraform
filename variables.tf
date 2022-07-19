variable "client_id" {
    default = "f856d3d9-e135-4885-a8fb-ae7e237c796a"
}
variable "client_secret" {
    default = "jiS8Q~RPtuKUeMy6FCAgq84d6EkJarujgpAgccSL"
}

variable "agent_count" {
    default = 3
}

variable "ssh_public_key" {
    default = "~/.ssh/id_rsa.pub"
}

variable "dns_prefix" {
    default = "akslab01"
}

variable cluster_name {
    default = "akslab01-rm"
}

variable resource_group_name {
    default = "aks-lab"
}

variable location {
    default = "Central US"
}

variable log_analytics_workspace_name {
    default = "testLogAnalyticsWorkspaceName"
}

# refer https://azure.microsoft.com/global-infrastructure/services/?products=monitor for log analytics available regions
variable log_analytics_workspace_location {
    default = "centralus"
}

# refer https://azure.microsoft.com/pricing/details/monitor/ for log analytics pricing 
variable log_analytics_workspace_sku {
    default = "PerGB2018"
}

