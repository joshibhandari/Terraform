terraform {
  backend "s3" {
    bucket              = "terraform-backend-configuration"
    key                 = "terraform/state/vpc/terraform.tfstate"
    region              = "us-east-1"
    #dynamodb_table      = "terraform_configuration"
    #encrypt             = true
  }
}
