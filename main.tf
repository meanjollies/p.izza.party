# Create Mastodon instance to host p.izza.party
resource "digitalocean_droplet" "droplet" {
  image    = var.droplet_image
  name     = var.droplet_name
  region   = var.droplet_region
  size     = var.droplet_size
  ipv6     = var.droplet_ipv6
  ssh_keys = [ data.digitalocean_ssh_key.public.id ]
}
