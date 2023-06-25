module "db" {
    source  = "terraform-aws-modules/rds-aurora/aws"
    version = "8.3.1"

    name = "aurora-db-mysql"
    engine = "aurora-mysql"
    engine_version = "5.7.mysql_aurora.2.11.2"
    instance_class = "db.t3.small"
    instances = {
        one = {}
    }

    security_group_rules = {
        ex1_ingress = {
            cidr_blocks = ["10.0.11.0/24"]
        }
    }

    master_password = "password"
    master_username = "admin"

    vpc_id = "vpc-00f452c4ee7d20190"
    db_subnet_group_name  = "prod-vpc"
    skip_final_snapshot = true
}