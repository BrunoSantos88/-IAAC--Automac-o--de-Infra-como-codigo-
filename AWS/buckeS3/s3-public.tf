resource "aws_s3_bucket" "example" {
  bucket = "example115464611"
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.example.id

  block_public_acls   = true
  block_public_policy = true
}

resource "aws_s3_bucket_object" "example" {
  bucket                 = aws_s3_bucket.example.id
  source                 = "index.html"
  server_side_encryption = "aws:kms"
}