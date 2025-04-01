# Google verification CNAME
resource "cloudflare_record" "google_verification" {
  zone_id = var.cloudflare_zone_id
  name    = "google1556563c66940bf2"
  type    = "CNAME"
  content = "google.com"
  proxied = false
}

# Root domain A record
resource "cloudflare_record" "root" {
  depends_on = [aws_instance.sethwahleDOTcom-web-server]
  zone_id = var.cloudflare_zone_id
  name    = "sethwahle.com"
  type    = "A"
  content = aws_instance.sethwahleDOTcom-web-server.public_ip
  proxied = true
}

# WWW A record
resource "cloudflare_record" "www" {
  depends_on = [aws_instance.sethwahleDOTcom-web-server]
  zone_id = var.cloudflare_zone_id
  name    = "www"
  type    = "A"
  content = aws_instance.sethwahleDOTcom-web-server.public_ip
  proxied = true
}

# MX Records
resource "cloudflare_record" "mx_1" {
  zone_id  = var.cloudflare_zone_id
  name     = "sethwahle.com"
  type     = "MX"
  content  = "aspmx.l.google.com"
  priority = 1
  proxied  = false
}

resource "cloudflare_record" "mx_2" {
  zone_id  = var.cloudflare_zone_id
  name     = "sethwahle.com"
  type     = "MX"
  content  = "alt1.aspmx.l.google.com"
  priority = 5
  proxied  = false
}

resource "cloudflare_record" "mx_3" {
  zone_id  = var.cloudflare_zone_id
  name     = "sethwahle.com"
  type     = "MX"
  content  = "alt2.aspmx.l.google.com"
  priority = 5
  proxied  = false
}

resource "cloudflare_record" "mx_4" {
  zone_id  = var.cloudflare_zone_id
  name     = "sethwahle.com"
  type     = "MX"
  content  = "alt3.aspmx.l.google.com"
  priority = 10
  proxied  = false
}

# SRV Record
resource "cloudflare_record" "autodiscover" {
  zone_id = var.cloudflare_zone_id
  name    = "_autodiscover._tcp"
  type    = "SRV"
  data {
    service  = "_autodiscover"
    proto    = "_tcp"
    name     = "sethwahle.com"
    priority = 10
    weight   = 1
    port     = 443
    target   = "autodiscover.cloudlogin.co"
  }
}

# DKIM TXT Record
resource "cloudflare_record" "dkim" {
  zone_id = var.cloudflare_zone_id
  name    = "default._domainkey"
  type    = "TXT"
  content = "k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC41vG+wqCWOd0F/oWYE+eCCtVzX+orzBn5+rXS54pC3nxuqVNMZpLiq38bIyJsAIROsvvfmDtoh5XdP8Y1PB9RYVMmqvU4wGyd2xV+9eGeH3SOHL6RYPLmhXY9v0XKamfbTfUZT8k13T5MHJZRQg1MUGJkKWVyB6IHFL7NyciBIwIDAQAB"
  proxied = false
}

# Domainkey TXT Record
resource "cloudflare_record" "domainkey" {
  zone_id = var.cloudflare_zone_id
  name    = "_domainkey"
  type    = "TXT"
  content = "t=y; o=~"
  proxied = false
}

# Google Site Verification TXT Record
resource "cloudflare_record" "google_site_verification" {
  zone_id = var.cloudflare_zone_id
  name    = "sethwahle.com"
  type    = "TXT"
  content = "google-site-verification=stBGDiWho6w133rnui7NyhOkEDxMn835kN_FbPO6M3Q"
  proxied = false
}
