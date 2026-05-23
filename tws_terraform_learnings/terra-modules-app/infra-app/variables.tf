variable "env" {
  description = "a env for my infrastructure"
  type = string
}

variable "bucket_name" {
  description = "my bucket name"
  type = string
}

variable "instance_count" {
  description = "no of instances you want to create"
  type = number
}

variable "instance_type" {
  description = "type of instance to be created"
  type = string
}


variable "ami_id" {
  description = "id of ami"
  type = string
}

variable "hashkey" {
  description = "hash key for dynamo table"
  type = string
}
