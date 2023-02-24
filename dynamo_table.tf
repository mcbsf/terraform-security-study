resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  name           = "terraform-security-state-lock-dynamo"
  hash_key       = "LockID"
  read_capacity  = 2
  write_capacity = 2

  attribute {
    name = "LockID"
    type = "S"
  }
}