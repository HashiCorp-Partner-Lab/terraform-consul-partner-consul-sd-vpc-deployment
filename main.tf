# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MIT

provider "aws" {
  region      = var.region
  access_key  = var.access_key
  secret_key  = var.secret_key
  token       = var.token
}

provider "hcp" {
  client_id     = var.hcp_client_id
  client_secret = var.hcp_client_secret
  project_id    = var.hcp_project_id
}

resource "hcp_hvn" "partner_hvn" {
  hvn_id         = var.hvn_id
  cloud_provider = var.cloud_provider
  region         = var.region
}

resource "hcp_consul_cluster" "partner_hcp" {
  hvn_id          = hcp_hvn.partner_hvn.hvn_id
  cluster_id      = var.cluster_id
  tier            = "standard"
  public_endpoint = true
}

