module "dev-infra" {
  source = "./infra-app"
  env = "dev"
  bucket_name = "infra-app-buckettt-01"
  instance_count = 1 
  instance_type = "t3.micro"
  ami_id = "ami-07a00cf47dbbc844c"
  hashkey = "studentID"

}

module "prod-infra" {
    source = "./infra-app"
    env = "prd" 
    bucket_name = "prod-infra-app-bucket-01"
    instance_count = 2 
    instance_type = "t3.small"
    ami_id = "ami-07a00cf47dbbc844c"
    hashkey = "studentID"
}


module "stage" { 
    source = "./infra-app"
    env = "stg" 
    bucket_name = "stg-infra-app-bucket-01"
    instance_count = 1 
    instance_type = "t3.micro"
    ami_id = "ami-07a00cf47dbbc844c"
    hashkey = "studentID"
}
