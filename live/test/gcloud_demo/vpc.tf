resource "google_compute_network" "vpc_network" {
  name                    = "terraform-gh-network"
  auto_create_subnetworks = "true"
}
