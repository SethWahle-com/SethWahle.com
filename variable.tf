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