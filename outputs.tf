output "vpc_id" {
  value = aws_vpc.peer.id
}

output "vpc_cidr_block" {
  value = aws_vpc.peer.cidr_block
}

output "vpc_subnet_id" {
  value = aws_subnet.peer_subnet.id
}

output "consul_ca_file" {
  value = hcp_consul_cluster.partner_hcp.consul_ca_file
}

output "consul_config_file" {
  value = hcp_consul_cluster.partner_hcp.consul_config_file
}

output "consul_private_endpoint_url" {
  value = hcp_consul_cluster.partner_hcp.consul_private_endpoint_url
  description = "the private URL for the consul cluster"
}

output "consul_public_endpoint_url" {
  value = hcp_consul_cluster.partner_hcp.consul_public_endpoint_url
  description = "the public URL for the consul cluster"
}

output "consul_root_token_accessor_id" {
  value = hcp_consul_cluster.partner_hcp.consul_root_token_accessor_id
}

output "consul_root_token_secret_id" {
  value = nonsensitive(hcp_consul_cluster.partner_hcp.consul_root_token_secret_id)
  description = "the consul root token"
}

output "consul_cluster_id" {
  value = hcp_consul_cluster.partner_hcp.cluster_id
}

output "consul_region" {
  value = hcp_consul_cluster.partner_hcp.region
}

output "aws_security_group_id" {
  value = aws_security_group.hcp_consul.id
}

