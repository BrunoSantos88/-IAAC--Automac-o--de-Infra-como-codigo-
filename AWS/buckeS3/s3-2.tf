resource "aws_s3_bucket" "aula4" {
  bucket = "aulascampinho-digital115464611"
}

resource "aws_s3_bucket_public_access_block" "aula4" {
  bucket = aws_s3_bucket.aula4.id

  block_public_acls   = true
  block_public_policy = true
}