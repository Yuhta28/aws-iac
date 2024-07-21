module "storage" {
  source      = "../../../module/storage"
  bucket_name = "main"
  env         = "prod"
}