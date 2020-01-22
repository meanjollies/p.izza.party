variable "droplet_image" {
  type        = string
  description = "The Droplet image ID or slug."
}

variable "droplet_name" {
  type        = string
  description = "The Droplet name."
}

variable "droplet_region" {
  type        = string
  description = "The region to start in."
}

variable "droplet_size" {
  type        = string
  description = "The unique slug that indentifies the type of Droplet."
}

variable "droplet_ipv6" {
  type        = bool
  description = "Boolean controlling if IPv6 is enabled."
}
