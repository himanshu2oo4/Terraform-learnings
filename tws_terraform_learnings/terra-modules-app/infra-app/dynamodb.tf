resource "aws_dynamodb_table" "basic_dynamodb_table" {
  name = "${var.env}-infra-dynamoTable"
  hash_key = var.hashkey
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = var.hashkey
    type = "S"
  }
  tags = {
    Name = "${var.env}-infra-dynamoTable"   
    Environment = var.env 
  }
}
