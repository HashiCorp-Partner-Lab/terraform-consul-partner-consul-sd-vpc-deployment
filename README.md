<!-- BEGIN_TF_DOCS -->
## Overview
This Terraform configuration is designed to provision the foundational infrastructure for a partner environment on HashiCorp Cloud Platform (HCP). The infrastructure includes a Virtual Private Cloud (VPC), HashiCorp Consul Cluster, and necessary networking components to establish a secure and scalable partner environment

## Components

### VPC (Virtual Private Cloud):
- A dedicated VPC with a specified CIDR block to isolate and organize network resources.
- Subnet for HashiCorp Consul deployment within the VPC.
- Internet Gateway to enable communication with the external world.

### HCP HVN (HashiCorp Virtual Network):
- The HashiCorp Virtual Network (HVN) is created to serve as the foundation for HCP services.
- Network peering connection to connect the HVN with the partner's AWS VPC.

### Consul Cluster:
- An empty HashiCorp Consul Cluster is provisioned within

Certainly! Here are the requirements and recommended environment variables for deploying the Terraform configuration:

## Requirements

- **AWS Account:**
  - An active AWS account is required to provision the infrastructure components.
  - Ensure that the AWS access credentials provided have sufficient permissions to create VPCs, subnets, security groups, and other necessary resources.

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_hcp"></a> [hcp](#provider\_hcp) | n/a |

## Modules

No modules.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloud_provider"></a> [cloud\_provider](#input\_cloud\_provider) | The cloud provider of the HCP HVN and Consul cluster. | `string` | `"aws"` | no |
| <a name="input_cluster_id"></a> [cluster\_id](#input\_cluster\_id) | The ID of the HCP Consul cluster. | `string` | `"partner-hcp-consul"` | no |
| <a name="input_hcp_client_id"></a> [hcp\_client\_id](#input\_hcp\_client\_id) | Your HashiCorp Cloud Platform client ID. | `string` | `"value"` | no |
| <a name="input_hcp_client_secret"></a> [hcp\_client\_secret](#input\_hcp\_client\_secret) | The client secret key associated with your HCP account. | `string` | `"value"` | no |
| <a name="input_hpl_hcp_hvn_id"></a> [hpl\_hcp\_hvn\_id](#input\_hpl\_hcp\_hvn\_id) | The ID of the HCP HVN route. | `string` | `"partner-hvn-route"` | no |
| <a name="input_hvn_id"></a> [hvn\_id](#input\_hvn\_id) | The ID of the HCP HVN. | `string` | `"partner-hvn"` | no |
| <a name="input_peering_id"></a> [peering\_id](#input\_peering\_id) | The ID of the HCP peering connection. | `string` | `"partner-peering"` | no |
| <a name="input_region"></a> [region](#input\_region) | The region of the HCP HVN and Consul cluster. | `string` | `"us-west-2"` | no |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloud_provider"></a> [cloud\_provider](#input\_cloud\_provider) | The cloud provider of the HCP HVN and Consul cluster. | `string` | `"aws"` | no |
| <a name="input_cluster_id"></a> [cluster\_id](#input\_cluster\_id) | The ID of the HCP Consul cluster. | `string` | `"partner-hcp-consul"` | no |
| <a name="input_hcp_client_id"></a> [hcp\_client\_id](#input\_hcp\_client\_id) | Your HashiCorp Cloud Platform client ID. | `string` | n/a | yes |
| <a name="input_hcp_client_secret"></a> [hcp\_client\_secret](#input\_hcp\_client\_secret) | The client secret key associated with your HCP account. | `string` | n/a | yes |
| <a name="input_hcp_project_id"></a> [hcp\_project\_id](#input\_hcp\_project\_id) | The project key for your HCP account. | `string` | n/a | yes |
| <a name="input_hvn_id"></a> [hvn\_id](#input\_hvn\_id) | The ID of the HCP HVN. | `string` | `"partner-hvn"` | no |
| <a name="input_peering_id"></a> [peering\_id](#input\_peering\_id) | The ID of the HCP peering connection. | `string` | `"partner-peering"` | no |
| <a name="input_region"></a> [region](#input\_region) | The region of the HCP HVN and Consul cluster. | `string` | `"us-west-2"` | no |
| <a name="input_route_id"></a> [route\_id](#input\_route\_id) | The ID of the HCP HVN route. | `string` | `"partner-hvn-route"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_security_group_id"></a> [aws\_security\_group\_id](#output\_aws\_security\_group\_id) | n/a |
| <a name="output_consul_ca_file"></a> [consul\_ca\_file](#output\_consul\_ca\_file) | n/a |
| <a name="output_consul_cluster_id"></a> [consul\_cluster\_id](#output\_consul\_cluster\_id) | n/a |
| <a name="output_consul_config_file"></a> [consul\_config\_file](#output\_consul\_config\_file) | n/a |
| <a name="output_consul_private_endpoint_url"></a> [consul\_private\_endpoint\_url](#output\_consul\_private\_endpoint\_url) | n/a |
| <a name="output_consul_region"></a> [consul\_region](#output\_consul\_region) | n/a |
| <a name="output_consul_root_token_accessor_id"></a> [consul\_root\_token\_accessor\_id](#output\_consul\_root\_token\_accessor\_id) | n/a |
| <a name="output_consul_root_token_secret_id"></a> [consul\_root\_token\_secret\_id](#output\_consul\_root\_token\_secret\_id) | n/a |
| <a name="output_vpc_cidr_block"></a> [vpc\_cidr\_block](#output\_vpc\_cidr\_block) | n/a |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | n/a |
| <a name="output_vpc_subnet_id"></a> [vpc\_subnet\_id](#output\_vpc\_subnet\_id) | n/a |
<!-- END_TF_DOCS -->"
