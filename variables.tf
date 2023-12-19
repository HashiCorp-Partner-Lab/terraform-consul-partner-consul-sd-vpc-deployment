# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MIT

variable "hvn_id" {
  description = "The ID of the HCP HVN."
  type        = string
  default     = "partner-hvn"
}
variable "cluster_id" {
  description = "The ID of the HCP Consul cluster."
  type        = string
  default     = "partner-hcp-consul"
}
variable "region" {
  description = "The region of the HCP HVN and Consul cluster."
  type        = string
  default     = "us-west-2"
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
variable "route_id" {
  description = "The ID of the HCP HVN route."
  type        = string
  default     = "partner-hvn-route"
}

variable "hcp_client_id" {
  description = "Your HashiCorp Cloud Platform client ID."
  type = string
}

variable "hcp_client_secret" {
  description = "The client secret key associated with your HCP account."
  type = string
}

variable "hcp_project_id" {
  description = "The project key for your HCP account."
  type = string
}

variable "access_key" {
  description = "Your AWS access key ID."
  type = string
}

variable "secret_key" {
  description = "Your AWS secret access key."
  type = string
}

variable "token" {
  description = "Your AWS session token (if using temporary security credentials)."
  type = string
}