module "storage" {
  source      = "../../../module/storage"
  bucket_name = "sub"
  env         = "stg"
}