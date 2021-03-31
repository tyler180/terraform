provider "aws" {
    region = "us-east-1"
}

terraform {
    backend "s3" {
        key = "ec2_tf/terraform.tfstate"
    }
    required_version = "0.12.26"
}