provider "instaclustr" {
    username = "%s"
    api_key = "%s"
    api_hostname = "%s"
}

resource "instaclustr_cluster" "validRedis" {
  cluster_name = "tf-redis-test"
//  node_size = "r5.large-100-r"
//  data_centre = "US_WEST_2"
  sla_tier = "PRODUCTION"
  cluster_network = "192.168.0.0/18"
  private_network_cluster = true
  pci_compliant_cluster   = false
//  cluster_provider = {
//    name = "AWS_VPC"
//  }

//  bundle {
//    bundle = "REDIS"
//    version = "redis:6.0.9"
//    options = {
//      master_nodes = 3,
//      replica_nodes = 3,
//      password_auth = false,
//      client_encryption = false
//    }
//  }

  data_centres {
    name        = "DC2"
    data_centre = "US_WEST_1"
    network     = "10.1.0.0/18"
    node_size    = "r5.large-100-r"
    provider = {
      name = "AWS_VPC"
    }
    bundles {
      bundle = "REDIS"
      version = "redis:6.0.9"
      options = {
        master_nodes = 3,
        replica_nodes = 3,
        password_auth = false,
        client_encryption = false
      }
    }
  }

}

