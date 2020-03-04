# Create the cluster
resource "digitalocean_kubernetes_cluster" "k8s-cluster" {
  name    = "k8s-cluster-01"
  region  = "nyc1"
  version = "1.16.6-do.0"

//   node_pool {
//     name       = "k8s-nodes"
//     size       = "s-1vcpu-2gb"
//     node_count = 1
//     tags       = ["k8s-nodes"]
//   }
  node_pool {
    name       = "autoscale-worker-pool"
    size       = "s-2vcpu-2gb"
    auto_scale = true
    min_nodes  = 1
    max_nodes  = 3
  }
}
