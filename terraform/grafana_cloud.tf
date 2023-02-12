data "grafana_synthetic_monitoring_probes" "main" {}

locals {
  global_probes = [
    data.grafana_synthetic_monitoring_probes.main.probes.Amsterdam,
    data.grafana_synthetic_monitoring_probes.main.probes.CapeTown,
    data.grafana_synthetic_monitoring_probes.main.probes.Dallas,
    data.grafana_synthetic_monitoring_probes.main.probes.Frankfurt,
    data.grafana_synthetic_monitoring_probes.main.probes.London,
    data.grafana_synthetic_monitoring_probes.main.probes.Mumbai,
    data.grafana_synthetic_monitoring_probes.main.probes.NewYork,
    data.grafana_synthetic_monitoring_probes.main.probes.NorthCalifornia,
    data.grafana_synthetic_monitoring_probes.main.probes.Oregon,
    data.grafana_synthetic_monitoring_probes.main.probes.Paris,
    data.grafana_synthetic_monitoring_probes.main.probes.SaoPaulo,
    data.grafana_synthetic_monitoring_probes.main.probes.Seoul,
    data.grafana_synthetic_monitoring_probes.main.probes.Singapore,
    data.grafana_synthetic_monitoring_probes.main.probes.Sydney,
    data.grafana_synthetic_monitoring_probes.main.probes.Tokyo,
    data.grafana_synthetic_monitoring_probes.main.probes.Toronto
  ]
  partial_global_probes = [
    data.grafana_synthetic_monitoring_probes.main.probes.CapeTown,
    data.grafana_synthetic_monitoring_probes.main.probes.Dallas,
    data.grafana_synthetic_monitoring_probes.main.probes.Frankfurt,
    data.grafana_synthetic_monitoring_probes.main.probes.London,
    data.grafana_synthetic_monitoring_probes.main.probes.Mumbai,
    data.grafana_synthetic_monitoring_probes.main.probes.NewYork,
    data.grafana_synthetic_monitoring_probes.main.probes.NorthCalifornia,
    data.grafana_synthetic_monitoring_probes.main.probes.SaoPaulo,
    data.grafana_synthetic_monitoring_probes.main.probes.Seoul,
    data.grafana_synthetic_monitoring_probes.main.probes.Singapore,
    data.grafana_synthetic_monitoring_probes.main.probes.Sydney,
    data.grafana_synthetic_monitoring_probes.main.probes.Toronto,
  ]
  all_probes = data.grafana_synthetic_monitoring_probes.main.probes.*
}

resource "grafana_synthetic_monitoring_check" "vps_ping" {
  for_each = {
    casey  = linode_instance.casey.ip_address
    walker = vultr_instance.walker.main_ip
    grimes = vultr_instance.grimes.main_ip
  }

  job     = each.key
  target  = each.value
  enabled = true
  probes  = local.partial_global_probes

  frequency = 120 * 1000 # 2 minutes

  settings {
    ping {
      ip_version    = "Any"
      dont_fragment = true
    }
  }
}


resource "grafana_synthetic_monitoring_check" "personal_website" {
  job     = "Personal Website"
  target  = "https://theorangeone.net/.health/"
  enabled = true
  probes  = local.global_probes

  settings {
    http {
      ip_version = "Any"
      method     = "GET"
    }
  }
}


resource "grafana_synthetic_monitoring_check" "grafana" {
  job     = "Grafana"
  target  = "https://grafana.jakehoward.tech/api/health"
  enabled = true
  probes = [
    data.grafana_synthetic_monitoring_probes.main.probes.London
  ]

  settings {
    http {
      ip_version = "Any"
      method     = "GET"
    }
  }
}


resource "grafana_synthetic_monitoring_check" "whoami" {
  job     = "Whoami"
  target  = "https://whoami.theorangeone.net"
  enabled = true
  probes = [
    data.grafana_synthetic_monitoring_probes.main.probes.London
  ]

  settings {
    http {
      ip_version = "Any"
      method     = "GET"
    }
  }
}
