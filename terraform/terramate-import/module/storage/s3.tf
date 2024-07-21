resource "aws_s3_bucket" "main_bucket" {
  bucket = "${var.bucket_name}-${random_id.storage_suffix.hex}"

  tags = {
    Environment = var.env
  }
}

resource "random_id" "storage_suffix" {
  byte_length = 8
}
