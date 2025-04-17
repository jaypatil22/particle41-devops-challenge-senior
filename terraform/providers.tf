provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Project = "particle41-devops-challenge-senior"
    }
  }
}