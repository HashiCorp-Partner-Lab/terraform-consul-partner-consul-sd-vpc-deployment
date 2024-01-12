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
  hvn_id = var.hpl_hcp_hvn_id
}

data "tfe_organization" "org_name" {
  name = var.hpl_tfc_organisation_name
}

resource "hcp_consul_cluster" "partner_hcp" {
  hvn_id          = data.hcp_hvn.partner_hvn.hvn_id
  cluster_id      = var.cluster_id
  tier            = "standard"
  public_endpoint = true
}

resource "tfe_variable_set" "consul_vs" {
  name         = "Consul Variables"
  description  = "Consul Variables"
  organization = data.tfe_organization.org_name.name
  global       = true
  depends_on   = [hcp_consul_cluster.partner_hcp]
}

resource "tfe_variable" "consul_addr" {
  key             = "consul_addr"
  value           = hcp_consul_cluster.partner_hcp.consul_public_endpoint_url
  description     = "Consul URL"
  variable_set_id = tfe_variable_set.consul_vs.id
  category        = "terraform"
}

resource "tfe_variable" "consul_root_token" {
  key             = "consul_addr"
  value           = hcp_consul_cluster.partner_hcp.consul_root_token_secret_id
  description     = "Consul Root Token"
  variable_set_id = tfe_variable_set.consul_vs.id
  sensitive       = true
  category        = "terraform"
}
