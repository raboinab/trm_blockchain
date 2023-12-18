# providers.tf
## terraform aws cli access 
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.45.0"
    }
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" {}

# aws provider
provider "aws" {
  region = "us-east-1" #The region where the environment 
  #is going to be deployed # Use your own region here
  access_key = "AKIAT3M3VHY5CNG4Z4QI"                     # Enter AWS IAM 
  secret_key = "UvbY2vGYXfvYt5I4w0j4qlpFQKUX69SwKEkrseJD" # Enter AWS IAM 
}

