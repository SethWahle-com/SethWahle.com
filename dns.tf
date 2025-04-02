resource "namecheap_domain_records" "sethwahle-com" {
  domain = "sethwahle.com"
  mode = "MERGE"
  email_type = "MX"
  
  record {
    hostname = "@"
    type = "A"
    address = aws_instance.sethwahleDOTcom-web-server.public_ip
    ttl = 300
  }

  record {
    hostname = "www"
    type = "A"
    address = aws_instance.sethwahleDOTcom-web-server.public_ip
    ttl = 300
  }

  record {
    hostname = "@"
    type = "MX"
    address = "aspmx.l.google.com"
    mx_pref = 1
    ttl = 300
  }

  record {
    hostname = "@"
    type = "MX"
    address = "alt1.aspmx.l.google.com"
    mx_pref = 5
    ttl = 300
  }

  record {
    hostname = "@"
    type = "MX"
    address = "alt2.aspmx.l.google.com"
    mx_pref = 5
    ttl = 300
  }

  record {
    hostname = "@"
    type = "MX"
    address = "alt3.aspmx.l.google.com"
    mx_pref = 10
    ttl = 300
  }

  record {
    hostname = "@"
    type = "TXT"
    address = "google-site-verification=stBGDiWho6w133rnui7NyhOkEDxMn835kN_FbPO6M3Q"
    ttl = 300
  }

  record {
    hostname = "_domainkey"
    type = "TXT"
    address = "t=y; o=~"
    ttl = 300
  }

  record {
    hostname = "default._domainkey"
    type = "TXT"
    address = "k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC41vG+wqCWOd0F/oWYE+eCCtVzX+orzBn5+rXS54pC3nxuqVNMZpLiq38bIyJsAIROsvvfmDtoh5XdP8Y1PB9RYVMmqvU4wGyd2xV+9eGeH3SOHL6RYPLmhXY9v0XKamfbTfUZT8k13T5MHJZRQg1MUGJkKWVyB6IHFL7NyciBIwIDAQAB"
    ttl = 300
  }
}
