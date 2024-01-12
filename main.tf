# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MIT

provider "aws" {
  region      = var.region
  access_key  = var.aws_access_key
  secret_key  = var.aws_secret_key
}

provider "hcp" {
  project_id    = var.hpl_hcp_project_id
}

data "hcp_hvn" "partner_hvn" {
  hvn_id = var.hvn_id
}

resource "hcp_consul_cluster" "partner_hcp" {
  hvn_id          = data.hcp_hvn.partner_hvn.hvn_id
  cluster_id      = var.cluster_id
  tier            = "standard"
  public_endpoint = true
}

