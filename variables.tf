# GKE Cluster Variables
variable "cluster_name" {
  description = "Name of the GKE cluster"
  type        = string
}

variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP region for the cluster"
  type        = string
}

variable "network" {
  description = "VPC network name"
  type        = string
}

variable "subnetwork" {
  description = "VPC subnetwork name"
  type        = string
}

variable "deletion_protection" {
  description = "Enable deletion protection for the cluster"
  type        = bool
}

variable "enable_l4_ilb_subsetting" {
  description = "Enable L4 ILB subsetting"
  type        = bool
}

variable "initial_node_count" {
  description = "Initial number of nodes per zone"
  type        = number
}

variable "release_channel" {
  description = "GKE release channel (RAPID, REGULAR, STABLE, UNSPECIFIED)"
  type        = string
}

variable "gateway_api_config" {
  description = "Gateway API channel (CHANNEL_DISABLED, CHANNEL_STANDARD)"
  type        = string
}

# Private Cluster Configuration
variable "enable_private_endpoint" {
  description = "Enable private endpoint for the cluster"
  type        = bool
}

variable "enable_private_nodes" {
  description = "Enable private nodes"
  type        = bool
}

# Addons Configuration
variable "disabled_http_load_balancing" {
  description = "Disable HTTP load balancing addon"
  type        = bool
}

variable "enabled_gke_backup_agent_config" {
  description = "Enable GKE Backup Agent addon"
  type        = bool
}

# Logging Configuration
variable "enable_logging_components" {
  description = "List of GKE components to enable logging for"
  type        = list(string)
}

# Monitoring Configuration
variable "enable_monitoring_components" {
  description = "List of GKE components to enable monitoring for"
  type        = list(string)
}

variable "enable_managed_prometheus" {
  description = "Enable managed Prometheus"
  type        = bool
}

# IP Allocation Policy
variable "cluster_secondary_range_name" {
  description = "Name of the secondary range for pods"
  type        = string
}

variable "services_secondary_range_name" {
  description = "Name of the secondary range for services"
  type        = string
}

# Master Authorized Networks
variable "master_authorized_cidr" {
  description = "CIDR block for master authorized networks"
  type        = string
}

variable "master_authorized_networks_display_name" {
  description = "Display name for master authorized networks"
  type        = string
}

variable "enable_intranode_visibility" {
  description = "Enable intranode visibility"
  type        = bool
}

variable "resource_manager_tags" {
  description = "Resource manager tags to apply to the GKE cluster. Map of tag key to tag value ID"
  type        = map(string)
  default     = {}
}