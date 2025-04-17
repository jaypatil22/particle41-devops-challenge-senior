terraform {
  backend "s3" {
    bucket       = "<backend-s3-bucket>"
    key          = "particle41-devops-challenge/terraform.tfstate"
    region       = "ap-south-1"
    encrypt      = true
    use_lockfile = true
  }
}