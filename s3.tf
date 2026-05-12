# 1. The Core Bucket
resource "aws_s3_bucket" "pavan_bucket_s3" {
  bucket = "digistackpav234tej"
  force_destroy = true

}

# 2. Versioning (Crucial for State and Backups)
resource "aws_s3_bucket_versioning" "pavan_data_versioning" {
  bucket = aws_s3_bucket.pavan_bucket_s3.id
  versioning_configuration {
    status = "Enabled"
  }
}



# 4. Block Public Access (The "Golden Rule")
resource "aws_s3_bucket_public_access_block" "pavan_data_privacy" {
  bucket = aws_s3_bucket.pavan_bucket_s3.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}