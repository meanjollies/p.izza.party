# Retrieve SSH key information
data "digitalocean_ssh_key" "public" {
  name = "p.izza.party"
}
