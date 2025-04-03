variable "host_os" {
  type    = string
  default = "windows"
}

variable "ssh_user" {
  type    = string
  default = "ubuntu"
}

variable "ssh_identityfile" {
  type    = string
  default = "~/.ssh/sethwahle"
}

variable "cloudflare_api_token" {
  type    = string
}

variable "cloudflare_zone_id" {
  type    = string
}

variable "namecheap_user_name" {
  type = string
  sensitive = true
}

variable "namecheap_api_user" {
  type = string
  sensitive = true
}

variable "namecheap_api_key" {
  type = string
  sensitive = true
} 