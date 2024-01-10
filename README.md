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

## AWS Permisions Required
You AWS Key/Secret will require the following permisions:

| AWS Permission                                | Purpose                                      |
|-----------------------------------------------|----------------------------------------------|
| `ec2:DescribeVpcs`                            | Describe Virtual Private Clouds (VPCs)       |
| `ec2:DescribeSecurityGroups`                  | Describe security groups                     |
| `ec2:CreateSecurityGroup`                     | Create security groups for EC2 instances     |
| `ec2:DescribeImages`                          | Describe images (AMIs)                       |
| `ec2:DescribeSubnets`                         | Describe subnets                             |
| `ec2:AuthorizeSecurityGroupIngress`           | Authorize ingress rules for security groups  |
| `ec2:RevokeSecurityGroupIngress`              | Revoke ingress rules for security groups     |
| `ec2:AuthorizeSecurityGroupEgress`            | Authorize egress rules for security groups   |
| `ec2:RevokeSecurityGroupEgress`               | Revoke egress rules for security groups      |
| `ec2:CreateRouteTable`                        | Create route tables for VPCs                 |
| `ec2:CreateRoute`                             | Create routes in route tables                |
| `ec2:CreateInternetGateway`                   | Create internet gateways for VPCs            |
| `ec2:AttachInternetGateway`                   | Attach internet gateways to VPCs             |
| `ec2:CreateVpcPeeringConnection`              | Create VPC peering connections               |
| `ec2:AcceptVpcPeeringConnection`              | Accept VPC peering connections               |
| `ec2:DescribeVpcPeeringConnections`           | Describe VPC peering connections             |


<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_hcp"></a> [hcp](#provider\_hcp) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_internet_gateway.gw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_route.gw_route](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route.peer_route](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_security_group.hcp_consul](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.allow_all_egress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.allow_lan_consul_gossip](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_subnet.peer_subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.peer](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |
| [aws_vpc_peering_connection_accepter.peer](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_peering_connection_accepter) | resource |
| [hcp_aws_network_peering.peer](https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/aws_network_peering) | resource |
| [hcp_consul_cluster.partner_hcp](https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/consul_cluster) | resource |
| [hcp_hvn.partner_hvn](https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/hvn) | resource |
| [hcp_hvn_route.peer_route](https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/hvn_route) | resource |
| [aws_arn.peer](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/arn) | data source |
| [aws_route_table.peer](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route_table) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_access_key"></a> [aws\_access\_key](#input\_aws\_access\_key) | AWS Access Key ID for the account to be peered to | `string` | n/a | yes |
| <a name="input_aws_secret_key"></a> [aws\_secret\_key](#input\_aws\_secret\_key) | AWS Secret Access Key for the account to be peered to | `string` | n/a | yes |
| <a name="input_cloud_provider"></a> [cloud\_provider](#input\_cloud\_provider) | The cloud provider of the HCP HVN and Consul cluster. | `string` | `"aws"` | no |
| <a name="input_cluster_id"></a> [cluster\_id](#input\_cluster\_id) | The ID of the HCP Consul cluster. | `string` | `"partner-hcp-consul"` | no |
| <a name="input_hcp_client_id"></a> [hcp\_client\_id](#input\_hcp\_client\_id) | Your HashiCorp Cloud Platform client ID. | `string` | `"value"` | no |
| <a name="input_hcp_client_secret"></a> [hcp\_client\_secret](#input\_hcp\_client\_secret) | The client secret key associated with your HCP account. | `string` | `"value"` | no |
| <a name="input_hpl_hcp_hvn_id"></a> [hpl\_hcp\_hvn\_id](#input\_hpl\_hcp\_hvn\_id) | The ID of the HCP HVN route. | `string` | `"partner-hvn-route"` | no |
| <a name="input_hpl_hcp_project_id"></a> [hpl\_hcp\_project\_id](#input\_hpl\_hcp\_project\_id) | The project key for your HCP account. | `string` | `"value"` | no |
| <a name="input_hvn_id"></a> [hvn\_id](#input\_hvn\_id) | The ID of the HCP HVN. | `string` | `"partner-hvn"` | no |
| <a name="input_peering_id"></a> [peering\_id](#input\_peering\_id) | The ID of the HCP peering connection. | `string` | `"partner-peering"` | no |
| <a name="input_region"></a> [region](#input\_region) | The region of the HCP HVN and Consul cluster. | `string` | `"us-west-2"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_security_group_id"></a> [aws\_security\_group\_id](#output\_aws\_security\_group\_id) | n/a |
| <a name="output_consul_ca_file"></a> [consul\_ca\_file](#output\_consul\_ca\_file) | n/a |
| <a name="output_consul_cluster_id"></a> [consul\_cluster\_id](#output\_consul\_cluster\_id) | n/a |
| <a name="output_consul_config_file"></a> [consul\_config\_file](#output\_consul\_config\_file) | n/a |
| <a name="output_consul_private_endpoint_url"></a> [consul\_private\_endpoint\_url](#output\_consul\_private\_endpoint\_url) | n/a |
| <a name="output_consul_public_endpoint_url"></a> [consul\_public\_endpoint\_url](#output\_consul\_public\_endpoint\_url) | n/a |
| <a name="output_consul_region"></a> [consul\_region](#output\_consul\_region) | n/a |
| <a name="output_consul_root_token_accessor_id"></a> [consul\_root\_token\_accessor\_id](#output\_consul\_root\_token\_accessor\_id) | n/a |
| <a name="output_consul_root_token_secret_id"></a> [consul\_root\_token\_secret\_id](#output\_consul\_root\_token\_secret\_id) | n/a |
| <a name="output_vpc_cidr_block"></a> [vpc\_cidr\_block](#output\_vpc\_cidr\_block) | n/a |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | n/a |
| <a name="output_vpc_subnet_id"></a> [vpc\_subnet\_id](#output\_vpc\_subnet\_id) | n/a |
<!-- END_TF_DOCS -->"
