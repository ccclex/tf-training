variable dnsimple_token {}
variable dnsimple_domain {}
variable dnsimple_email {}

provider "dnsimple" {
  token = "${var.dnsimple_token}"
  email = "${var.dnsimple_email}"
}

resource "dnsimple_record" "terraformrocks" {
  domain = "${var.dnsimple_domain}"
  name = "xxxxx"
  value = "${aws_instance.web.0.public_ip}"
  type = "A"
}
