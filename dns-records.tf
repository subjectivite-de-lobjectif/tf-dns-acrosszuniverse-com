locals {
  zone = "acrosszuniverse.com"

  dns_records = [
    # -------------------------------------------------- #
    # DNS zone configuration
    # -------------------------------------------------- #
    {
      name = "",
      type = "NS",
      ttl  = 0,
      targets = [
        "dns110.ovh.net.",
        "ns110.ovh.net.",
      ]
    },
    # See https://help.github.com/en/github/working-with-github-pages/managing-a-custom-domain-for-your-github-pages-site#configuring-an-apex-domain.
    {
      name = "",
      type = "A",
      ttl  = 3600,
      targets = [
        "185.199.108.153",
        "185.199.109.153",
        "185.199.110.153",
        "185.199.111.153",
      ]
    },
    {
      name = "www",
      type = "CNAME",
      ttl  = 0,
      targets = [
        "acrosszuniverse.com.",
      ]
    },
    # -------------------------------------------------- #
    # Email configuration
    # -------------------------------------------------- #
    {
      name = "",
      type = "MX",
      ttl  = 0,
      targets = [
        "1 mx1.mail.ovh.net.",
      ]
    },
    {
      name = "",
      type = "MX",
      ttl  = 0,
      targets = [
        "5 mx2.mail.ovh.net.",
      ]
    },
    {
      name = "",
      type = "MX",
      ttl  = 0,
      targets = [
        "100 mx3.mail.ovh.net.",
      ]
    },
    {
      name = "autoconfig",
      type = "CNAME",
      ttl  = 0,
      targets = [
        "mailconfig.ovh.net.",
      ]
    },
    {
      name = "autodiscover",
      type = "CNAME",
      ttl  = 0,
      targets = [
        "mailconfig.ovh.net.",
      ]
    },
    {
      name = "mail",
      type = "CNAME",
      ttl  = 0,
      targets = [
        "ssl0.ovh.net.",
      ]
    },
    {
      name = "pop3",
      type = "CNAME",
      ttl  = 0,
      targets = [
        "ssl0.ovh.net.",
      ]
    },
    {
      name = "imap",
      type = "CNAME",
      ttl  = 0,
      targets = [
        "ssl0.ovh.net.",
      ]
    },
    {
      name = "smtp",
      type = "CNAME",
      ttl  = 0,
      targets = [
        "ssl0.ovh.net.",
      ]
    },
    {
      name = "",
      type = "SPF",
      ttl  = 600,
      targets = [
        "\"v=spf1 include:mx.ovh.com ~all\"",
      ]
    },
    # -------------------------------------------------- #
    # Domain verification
    # -------------------------------------------------- #
    {
      name = "",
      type = "TXT",
      ttl  = 0,
      targets = [
        "keybase-site-verification=1A3LESGM18RNR2U_rHeN84GnjOO9lcPsPYzcOwQ8en8",
      ]
    },
    {
      name = "",
      type = "TXT",
      ttl  = 0,
      targets = [
        "brave-ledger-verification=53cb21c94b6b25a160987cd57a960ca3ed72d6d90849bcfb28edb134c75ed644",
      ]
    },
    {
      name = "_github-challenge-subjectivite-de-lobjectif",
      type = "TXT",
      ttl  = 0,
      targets = [
        "54ccf6d1f5",
      ]
    },
  ]
}

module "dns_records" {
  source = "./modules/ovh-dns"

  ovh_application_key    = var.ovh_application_key
  ovh_application_secret = var.ovh_application_secret
  ovh_consumer_key       = var.ovh_consumer_key
  ovh_endpoint           = var.ovh_endpoint

  zone    = local.zone
  records = local.dns_records
}
