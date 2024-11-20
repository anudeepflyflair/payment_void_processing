
# Fetch Current Account Details
data "aws_caller_identity" "current" {}

# Fetch Existing Private Subnet by Tag
data "aws_subnet" "private_subnet" {
  filter {
    name   = "tag:Name"
    values = ["audit-infra-PrivateSubnet"] # Replace with the tag of your private subnet
  }
}

# Fetch Existing Security Group by Tag
data "aws_security_group" "private_sg" {
  filter {
    name   = "tag:Name"
    values = ["audit-infra-DynamoDBEndpointSG"] # Replace with the tag of your Lambda security group
  }
}
  
data "aws_dynamodb_table" "transactions_table" {
  name = var.transactions_table_name
}

data "aws_dynamodb_table" "audit_trail_table" {
  name = var.audit_trail_table_name
}