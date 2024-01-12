# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MIT
variable "cluster_id" {
  description = "The ID of the HCP Consul cluster."
  type        = string
  default     = "partner-hcp-consul"
}

variable "region" {
  description = "The region of the HCP HVN and Consul cluster."
  type        = string
  default     = "eu-west-2"
}

variable "cloud_provider" {
  description = "The cloud provider of the HCP HVN and Consul cluster."
  type        = string
  default     = "aws"
}

variable "peering_id" {
  description = "The ID of the HCP peering connection."
  type        = string
  default     = "partner-peering"
}

variable "hpl_hcp_hvn_id" {
  description = "The ID of the HCP HVN route."
  type        = string
  default     = "partner-hvn-route"
}

variable "hcp_client_id" {
  description = "Your HashiCorp Cloud Platform client ID."
  type = string
  default = "value"
}

variable "hcp_client_secret" {
  description = "The client secret key associated with your HCP account."
  type = string
  default = "value"
}

variable "hpl_hcp_project_id" {
  description = "The project key for your HCP account."
  type = string
  default = "value"
}

variable "aws_access_key" {
  description = "AWS Access Key ID for the account to be peered to"
  type = string
  sensitive = false
}

variable "aws_secret_key" {
  description = "AWS Secret Access Key for the account to be peered to"
  type = string
  sensitive = true
}

variable "hpl_tfc_organisation_name" {
  type        = string
  description = "TFC Org Name"
  default     = "TFC Org"
}