resource "aws_s3_bucket" "example15481151" {
  bucket = "example115464611kjkfkfjj"
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.example15481151.id

  block_public_acls   = true
  block_public_policy = true
}

resource "aws_s3_bucket_object" "file_uploadjinooij" {
  bucket = aws_s3_bucket.example15481151.id
  key    = "my_bucket_key88888"
  source = "web.zip"
}

resource "aws_s3_bucket_versioning" "bucket-versionamento" {
  bucket = aws_s3_bucket.example15481151.id
  versioning_configuration {
    status = "Enabled"
  }
}
