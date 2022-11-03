## Data Source examples

# The following example retrieves Account id
data "aws_caller_identity" "current" {}

# The following example retrieves VPC id filtered by tag Name
data "aws_vpc" "vpc_id" {
  tags = {
    Name = var.vpc
  }
}

# The following example retrieves a set of all subnets in a VPC defined in the filter
# with a custom set of tags.
data "aws_subnets" "filter_app_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc_id.id]
  }

  tags = {
    subnet_tier = "app"
    Name        = "app-*.${var.vpc}"
  }
}

data "aws_subnet" "app_subnets" {
  for_each = toset(data.aws_subnets.filter_app_subnets.ids)
  id       = each.value
}

# This examples is to get IDs of Security Group in a VPC defined in the filter
# with a custom set of tags.
data "aws_security_group" "onprem_sg" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc_id.id]
  }

  tags = {
    Name = "${var.vpc}.onprem"
  }
}
