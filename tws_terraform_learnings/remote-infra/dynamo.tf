provider "aws" {
  region = "ap-south-1"
}

resource "aws_dynamodb_table" "tws_state_lock_table" {
  name = "tws_state_table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "LockID"   # partition key or the primary key 
  
  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "tws_state_lock_table"
  }
}

