resource "aws_s3_bucket" "my-test-bucket" {
  bucket = "my-tf-test-bucket-184848451515818"


  tags = {
    Name        = "My bucket"
    Environment = "Dev"
    Managedby   = "Terraform"
  }
}