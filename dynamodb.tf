resource "aws_dynamodb_table" "transactions_table" {
  name           = "${var.project}-TransactionsTable"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "transactionId"
  range_key      = "timestamp"
 
  attribute {
    name = "transactionId"
    type = "S"
  }
 
  attribute {
    name = "timestamp"
    type = "S"
  }
 
  attribute {
    name = "status"
    type = "S"
  }
 
  attribute {
    name = "voidTransactionId"
    type = "S"
  }
 
  attribute {
    name = "linkedTransactionId"
    type = "S"
  }
 
  attribute {
    name = "voidReason"
    type = "S"
  }
 
  attribute {
    name = "processorResponseCode"
    type = "S"
  }
 
  attribute {
    name = "externalReference"
    type = "S"
  }
 
  attribute {
    name = "metadata"
    type = "M"
  }
 
  stream_enabled  = true
  stream_view_type = "NEW_AND_OLD_IMAGES"
 
  tags = {
    Name = "${var.project}-TransactionsTable"
  }
}

#audit trail table
resource "aws_dynamodb_table" "audit_trail_table" {
  name           = "${var.project}-AuditTrailTable"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "auditTrailId"
  range_key      = "timestamp"
 
  attribute {
    name = "auditTrailId"
    type = "S"
  }
 
  attribute {
    name = "timestamp"
    type = "S"
  }
 
  attribute {
    name = "actor"
    type = "S"
  }
 
  attribute {
    name = "action"
    type = "S"
  }
 
  attribute {
    name = "transactionId"
    type = "S"
  }
 
  attribute {
    name = "voidTransactionId"
    type = "S"
  }
 
  attribute {
    name = "actionStatus"
    type = "S"
  }
 
  attribute {
    name = "details"
    type = "S"
  }
 
  attribute {
    name = "metadata"
    type = "M"
  }
 
  stream_enabled  = true
  stream_view_type = "NEW_AND_OLD_IMAGES"
 
  tags = {
    Name = "${var.project}-AuditTrailTable"
  }
}