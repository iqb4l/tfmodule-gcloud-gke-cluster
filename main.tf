
# Create the Kubernetes Cluster
resource "google_container_cluster" "default" {
  name                      = var.cluster_name
  location                  = var.region
  project                   = var.project_id
  network                   = var.network
  subnetwork                = var.subnetwork
  remove_default_node_pool  = true
  deletion_protection       = false
  enable_l4_ilb_subsetting  = true
  initial_node_count        = var.initial_node_count
  disable_l4_lb_firewall_reconciliation = true
  
  release_channel {
    channel = var.release_channel
  }

  # Enable Gateway API
  gateway_api_config {
    channel = var.gateway_api_config
  }

  private_cluster_config {
    enable_private_endpoint = var.enable_private_endpoint
    enable_private_nodes    = var.enable_private_nodes
  }

  # Enabled features
  addons_config {
    http_load_balancing {
      disabled = var.disabled_http_load_balancing
    }

    gke_backup_agent_config {
      enabled = var.enabled_gke_backup_agent_config
    }
  }

  logging_config {
    enable_components = var.enable_logging_components
  }

  monitoring_config {
    enable_components = var.enable_monitoring_components
    
    managed_prometheus {
      enabled = var.enable_managed_prometheus
    }
  }

  ip_allocation_policy {
    cluster_secondary_range_name  = var.cluster_secondary_range_name
    services_secondary_range_name = var.services_secondary_range_name
  }

  master_authorized_networks_config {
    cidr_blocks {
      cidr_block   = var.master_authorized_cidr
      display_name = var.master_authorized_networks_display_name
    }
  }

  enable_intranode_visibility = var.enable_intranode_visibility
  node_pool_auto_config {
    resource_manager_tags = var.resource_manager_tags
  }
}