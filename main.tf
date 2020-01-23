# Create Mastodon instance to host p.izza.party
resource "digitalocean_droplet" "droplet" {
  image    = var.droplet_image
  name     = var.droplet_name
  region   = var.droplet_region
  size     = var.droplet_size
  ipv6     = var.droplet_ipv6
  ssh_keys = [ data.digitalocean_ssh_key.public.id ]
}

resource "digitalocean_firewall" "firewall" {
  name = var.firewall_name

  droplet_ids = [ digitalocean_droplet.droplet.id ]

  inbound_rule {
    protocol         = "tcp"
    port_range       = var.ssh_port
    source_addresses = var.whitelisted_addresses
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "80"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "443"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "udp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
  
  outbound_rule {
    protocol              = "tcp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "icmp"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
}
