# Lambda Function for Process Void Transaction
resource "aws_lambda_function" "process_void_transaction" {
  function_name = "${var.project}-Transaction"
  runtime       = "python3.9"
  handler       = "process_void_transaction.lambda_handler"
  role          = aws_iam_role.process_void_role.arn

  filename      = "lambda_function/process_void_transaction.zip"

  timeout       = 30  # Timeout in seconds

  environment {
    variables = {
      TRANSACTIONS_TABLE = data.aws_dynamodb_table.transactions_table.name,
      AUDIT_TRAIL_TABLE  = data.aws_dynamodb_table.audit_trail_table.name,
      FIFO_QUEUE_URL     = aws_sqs_queue.audit_trail_fifo_queue.id
    }
  }
      vpc_config {
    subnet_ids         = [data.aws_subnet.private_subnet.id]
    security_group_ids = [data.aws_security_group.private_sg.id]
  }

  depends_on = [
    data.aws_dynamodb_table.transactions_table,
    data.aws_dynamodb_table.audit_trail_table,
    aws_sqs_queue.audit_trail_fifo_queue
  ]
}