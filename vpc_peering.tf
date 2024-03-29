resource "aws_vpc" "peer" {
  cidr_block = "172.31.0.0/16"
}

data "aws_arn" "peer" {
  arn = aws_vpc.peer.arn
}

resource "hcp_aws_network_peering" "peer" {
  hvn_id              = data.hcp_hvn.partner_hvn.hvn_id
  peering_id          = var.peering_id
  peer_vpc_id         = aws_vpc.peer.id
  peer_account_id     = aws_vpc.peer.owner_id
  peer_vpc_region     = data.aws_arn.peer.region
}

resource "hcp_hvn_route" "peer_route" {
  hvn_link         = data.hcp_hvn.partner_hvn.self_link
  hvn_route_id     = var.hpl_hcp_hvn_id
  destination_cidr = aws_vpc.peer.cidr_block
  target_link      = hcp_aws_network_peering.peer.self_link
}

resource "aws_vpc_peering_connection_accepter" "peer" {
  vpc_peering_connection_id = hcp_aws_network_peering.peer.provider_peering_id
  auto_accept               = true
}

data "aws_route_table" "peer" {
  vpc_id = aws_vpc.peer.id
}

resource "aws_route" "peer_route" {
  route_table_id            = data.aws_route_table.peer.id
  destination_cidr_block    = data.hcp_hvn.partner_hvn.cidr_block
  vpc_peering_connection_id = hcp_aws_network_peering.peer.provider_peering_id
}

resource "aws_route" "gw_route" {
  route_table_id         = data.aws_route_table.peer.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.gw.id
}

resource "aws_subnet" "peer_subnet" {
  vpc_id     = aws_vpc.peer.id
  cidr_block = "172.31.0.0/24"

  tags = {
    Name = "Consul"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.peer.id

  tags = {
    Name = "Partner Env"
  }
}